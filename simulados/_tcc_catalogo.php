<?php

declare(strict_types=1);

function tcc_catalogo_conexao(): ?mysqli
{
    mysqli_report(MYSQLI_REPORT_OFF);
    $db = @new mysqli('localhost', 'root', '', 'tcc');
    if ($db->connect_errno) return null;
    $db->set_charset('utf8mb4');
    return $db;
}

function tcc_catalogo_buscar(string $loja, array $filtros = []): array
{
    $db = tcc_catalogo_conexao();
    if (!$db) return [];

    $sql = "SELECT j.id, j.nome, j.slug, j.descricao, j.img, j.img AS imagem,
                   j.plataforma, j.genero, j.etaria, j.ano, j.status,
                   0 AS avaliacao
            FROM tcc.jogos j
            WHERE 1 = 1";
    $types = '';
    $params = [];
    if (!empty($filtros['slug'])) { $sql .= ' AND j.slug = ?'; $types .= 's'; $params[] = $filtros['slug']; }
    if (!empty($filtros['id'])) { $sql .= ' AND j.id = ?'; $types .= 'i'; $params[] = (int)$filtros['id']; }
    if (!empty($filtros['busca'])) { $sql .= ' AND (j.nome LIKE ? OR j.slug LIKE ? OR j.genero LIKE ?)'; $types .= 'sss'; $like = '%' . $filtros['busca'] . '%'; array_push($params, $like, $like, $like); }
    $sql .= ' ORDER BY j.id ASC';

    $stmt = $db->prepare($sql);
    if (!$stmt) { $db->close(); return []; }
    if ($types !== '') $stmt->bind_param($types, ...$params);
    if (!$stmt->execute()) { $stmt->close(); $db->close(); return []; }
    $resultado = $stmt->get_result();
    $jogos = [];
    while ($resultado && ($jogo = $resultado->fetch_assoc())) {
        $id = (int)$jogo['id'];
        $base = 49.90 + (($id * 37) % 251);
        $configuracoes = [
            'SteamFake' => [$base, 0.80],
            'GOGFake' => [$base + 17.50, 0.70],
            'EpicFake' => [$base + 31.25, 0.85]
        ];
        [$precoOriginal, $fatorPromocao] = $configuracoes[$loja] ?? [$base, 1.00];
        $precoOriginal = round($precoOriginal, 2);
        $precoAtual = round($precoOriginal * $fatorPromocao, 2);

        $jogo['id'] = $id;
        $jogo['avaliacao'] = (float)$jogo['avaliacao'];
        $jogo['preco_original'] = $precoOriginal;
        $jogo['preco_atual'] = $precoAtual;
        $jogo['desconto'] = (int)round((($precoOriginal - $precoAtual) / $precoOriginal) * 100);
        $jogo['loja'] = $loja;
        $jogo['promocao_status'] = 'Oferta simulada';
        $jogo['disponibilidade'] = 'disponivel';
        $jogo['disponivel'] = true;
        $jogo['imagem'] = (string)($jogo['imagem'] ?? '');
        $jogo['url'] = strtolower($loja) . '/jogo.php?slug=' . rawurlencode($jogo['slug']);
        $jogos[] = $jogo;
    }
    $stmt->close();
    $db->close();
    return $jogos;
}

function tcc_catalogo_por_slug(string $loja, string $slug): ?array
{
    $jogos = tcc_catalogo_buscar($loja, ['slug' => trim($slug)]);
    return $jogos[0] ?? null;
}
?>

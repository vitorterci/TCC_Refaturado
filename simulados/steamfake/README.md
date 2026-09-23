# SteamFake

A SteamFake é uma loja fictícia de jogos digitais criada para simular uma fonte externa de preços consumida pelo GameSearch. Ela não realiza compras e não utiliza APIs externas de dados.

## Instalação no XAMPP

Copie a pasta `steamfake` para dentro de `htdocs` junto do projeto. No phpMyAdmin, selecione o banco `tcc` usado pelo GameSearch e importe `database/steamfake.sql`. O script cria a tabela `steamfake_jogos` e cadastra 30 jogos com preços simulados. A configuração padrão usa `localhost`, usuário `root`, senha vazia e banco `tcc`, em conformidade com a configuração local já existente do projeto.

Se a tabela ainda não tiver sido importada, a interface e os endpoints continuam funcionando com o catálogo PHP local em `data/jogos.php`; depois da importação, as páginas e APIs priorizam os dados do MySQL.

## Endpoints

| Endpoint | Uso |
| --- | --- |
| `api/jogos.php` | Lista o catálogo completo. Aceita `?id=1`, `?slug=cyberpunk-2077`, `?busca=rpg` e `?ofertas=1`. |
| `api/precos.php` | Lista o preço simulado no contrato do GameSearch. Aceita `?id=1` ou `?slug=cyberpunk-2077`. |

Cada item de `api/precos.php` retorna `id`, `nome`, `slug`, `imagem`, `plataforma`, `preco_original`, `preco_atual`, `desconto`, `loja`, `url` e `status_promocao`. O campo `loja` é sempre `SteamFake`.

## Acesso

- `index.php`: vitrine inicial.
- `ofertas.php`: catálogo de ofertas.
- `produto.php?slug=cyberpunk-2077`: detalhe dinâmico de um produto.

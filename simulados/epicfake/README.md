# EpicFake

A EpicFake é uma loja fictícia local criada como segunda fonte de preços para o GameSearch. A interface não realiza compras, não usa scraping e não depende de internet: o catálogo é persistido na tabela `epicfake_jogos` do banco configurado pelo projeto.

## Execução no XAMPP

Mantenha a pasta `php/` existente do GameSearch no mesmo nível da pasta `api/` e da pasta `epicfake/`. Inicie Apache e MySQL no XAMPP e abra `epicfake/index.php`. Na primeira chamada a qualquer endpoint, a estrutura da tabela é criada e os 30 jogos são sincronizados de forma idempotente.

A conexão reutiliza `php/config.php`, portanto o banco padrão é `tcc`, com usuário `root` e senha vazia, conforme a configuração central atual do projeto. Se o projeto estiver sendo validado sem MySQL, o fallback SQLite já presente em `php/config.php` também é suportado.

## Endpoints

| Endpoint | Parâmetros | Uso |
| --- | --- | --- |
| `/api/jogos.php` | `limite`, `busca`/`q`, `categoria` | Lista o catálogo filtrado. |
| `/api/jogos.php?slug=cyberpunk-2077` | `slug` ou `id` | Retorna um jogo específico. |
| `/api/precos.php` | `limite` | Lista os preços locais. |
| `/api/precos.php?slug=cyberpunk-2077` | `slug` ou `id` | Retorna o preço específico para comparação. |

As respostas são JSON e sempre incluem o campo `loja` com o valor `EpicFake`. Para uma consulta individual de preço, o objeto `jogo` possui `id`, `nome`, `slug`, `imagem`, `plataforma`, `preco_original`, `preco_atual`, `desconto`, `moeda` e `url_oferta`.

## Rotas da interface

A home está em `epicfake/index.php`; o catálogo completo em `epicfake/jogos.php`; as promoções em `epicfake/ofertas.php`; os jogos gratuitos em `epicfake/gratuitos.php`; e os detalhes dinâmicos em `epicfake/jogo.php?slug=...`. Os dados são carregados pelo JavaScript a partir dos endpoints locais.

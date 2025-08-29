Este repositório contém os modelos de dados apresentados no livro [Engenharia de Analytics](https://www.engdeanalytics.com.br).

O objetivo é fornecer um exemplo de um projeto dbt completo e funcional. Ao seguir os passos de configuração, você poderá executar todo o pipeline de transformação de dados com um único comando: `dbt build`.

### Pré-requisitos

Antes de começar, você precisa ter:

- [Git](https://git-scm.com)
- Python 3.7 ou superior
- Acesso a um Data Warehouse [compatível com dbt](https://docs.getdbt.com/docs/trusted-adapters) (este tutorial usa [Databricks](https://www.databricks.com/learn/free-edition) como exemplo)

### Instalação e configuração

1. Faça um fork deste repositório

Clique no botão "Fork" no GitHub para criar uma cópia na sua conta.

2. Clone o repositório

```
git clone https://github.com/SEU-USUARIO/northwind.git
```
   
3. Acesse o repositório:

```
cd northwind
```

4. Crie e ative um ambiente virtual

```
python3 -m venv .venv
source .venv/bin/activate
```

5. Instale as dependências

```
python -m pip install dbt-core dbt-databricks
```

Para um Data Warehouse diferente do Databricks, substitua pelo [adaptador correspondente](https://docs.getdbt.com/docs/trusted-adapters) (ex: dbt-snowflake, dbt-bigquery)

6. Configure seu profile do dbt

Você deverá configurar um *profile* para o seu DW adicionando o seguinte trecho de código no arquivo `~/.dbt/profiles.yml` (lembre-se de alterar as variáveis específicas para seu projeto):

```yaml
northwind:
  target: dev
  outputs:
    dev:
      type: databricks
      catalog: workspace
      schema: default
      host: YOURORG.databrickshost.com  # Substitua pelo seu host
      http_path: /SQL/YOUR/HTTP/PATH  # Substitua pelo seu path HTTP
      token: dapiXXXXXXXXXXXXXXXXXXXXXXX  # Substitua pelo seu token de acesso
```

7. Em seguida, teste se a configuração está correta:

```bash
dbt debug

(...)
  Connection test: [OK connection ok]

All checks passed!
```

### Executando o projeto

1. Carregue os dados

Este comando carrega os arquivos .csv da pasta seeds para o Data Warehouse. Esta etapa é necessária para que os modelos possam ser executados.

```
dbt seed
```

Obs: Esta prática não é recomendada em projetos reais, somente usada aqui para fins educacionais.

2. Execute os dados

```
dbt build
```

Pronto! Você tem um projeto dbt configurado e com dados disponíveis no Data Warehouse.

### Saiba mais:
- Livro [Engenharia de Analytics](https://www.engdeanalytics.com.br)
- Aprenda mais sobre o dbt [na documentação oficial](https://docs.getdbt.com/docs/introduction)
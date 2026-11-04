# Banco de Dados UFRN

Scripts SQL e arquivos de infraestrutura para um laboratório de banco de dados
relacional baseado em MariaDB. O exemplo implementa uma biblioteca com autores,
livros e empréstimos, além de disponibilizar o CloudBeaver para administração
visual do banco.

## Estrutura do repositório

Todos os arquivos da atividade estão em [`Tarefa 03`](./Tarefa%2003/):

- [`setup.sql`](./Tarefa%2003/setup.sql): recria o banco `biblioteca`, cria as
  tabelas, insere os dados iniciais e configura usuários e permissões.
- [`povoamento.sql`](./Tarefa%2003/povoamento.sql): adiciona autores e livros
  complementares ao conjunto inicial.
- [`docker-compose.yml`](./Tarefa%2003/docker-compose.yml): inicia MariaDB e
  CloudBeaver.
- [`.env.example`](./Tarefa%2003/.env.example): modelo das variáveis usadas pelo
  Docker Compose.

## Modelo de dados

O banco `biblioteca` possui três tabelas:

```text
autores 1 ---- N livros 1 ---- N emprestimos
```

- `autores`: nome, país e ano de nascimento.
- `livros`: título, ano de publicação, preço e referência ao autor.
- `emprestimos`: livro emprestado, data do empréstimo e indicador de devolução.

As relações entre as tabelas são protegidas por chaves estrangeiras.

## Pré-requisitos

- Docker e Docker Compose;
- ou MariaDB/MySQL instalado localmente para execução manual dos scripts;
- Git, caso o projeto seja obtido por clonagem.

## Execução com Docker

1. Entre na pasta da atividade:

   ```bash
   cd "Tarefa 03"
   ```

2. Crie o arquivo de ambiente a partir do modelo:

   ```bash
   cp .env.example .env
   ```

   No Windows PowerShell, use:

   ```powershell
   Copy-Item .env.example .env
   ```

3. Edite `.env` e substitua `MARIADB_ROOT_PASSWORD` por uma senha forte.

4. Inicie os serviços:

   ```bash
   docker compose up -d
   ```

5. Acesse o CloudBeaver em <http://localhost:8978>. Para conectar ao MariaDB
   dentro da rede do Compose, use:

   - **Host:** `mariadb`
   - **Porta:** `3306`
   - **Usuário:** `root`
   - **Senha:** o valor de `MARIADB_ROOT_PASSWORD`

   A partir do CloudBeaver, abra e execute `setup.sql` e, em seguida,
   `povoamento.sql`.

Para acompanhar os serviços:

```bash
docker compose ps
docker compose logs -f mariadb
```

Para parar os serviços sem remover os dados:

```bash
docker compose down
```

Para remover também o volume persistente do MariaDB:

```bash
docker compose down -v
```

## Execução manual

Com um servidor MariaDB/MySQL em execução, execute os scripts na ordem:

```bash
mysql -u root -p < setup.sql
mysql -u root -p biblioteca < povoamento.sql
```

Os comandos devem ser executados a partir de `Tarefa 03`, ou com os caminhos
correspondentes para os arquivos.

## Consultas de exemplo

Depois da carga dos dados, algumas consultas úteis são:

```sql
USE biblioteca;

SELECT l.titulo, a.nome AS autor, l.preco
FROM livros AS l
JOIN autores AS a ON a.id = l.autor_id
ORDER BY a.nome, l.titulo;

SELECT l.titulo, e.data_emprestimo, e.devolvido
FROM emprestimos AS e
JOIN livros AS l ON l.id = e.livro_id
WHERE e.devolvido = FALSE;
```

## Observações importantes

- `setup.sql` começa com `DROP DATABASE IF EXISTS biblioteca`; sua execução
  apaga e recria esse banco. Use-o apenas em ambiente de desenvolvimento ou
  laboratório.
- O script também cria os usuários `app_biblioteca` e `consulta` com
  permissões diferentes. Revise as senhas diretamente no script antes de usar
  este projeto fora de um ambiente local.
- O arquivo `.env` é ignorado pelo Git. Nunca publique senhas reais ou outros
  segredos no repositório.
- O volume `mariadb_data` mantém os dados entre reinicializações do Compose.


DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE biblioteca
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE biblioteca;

CREATE TABLE autores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  pais VARCHAR(50),
  ano_nascimento INT
);

CREATE TABLE livros (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(150) NOT NULL,
  ano_publicacao INT,
  preco DECIMAL(10,2),
  autor_id INT,
  FOREIGN KEY (autor_id) REFERENCES autores(id)
);

CREATE TABLE emprestimos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  livro_id INT NOT NULL,
  data_emprestimo DATE NOT NULL,
  devolvido BOOLEAN NOT NULL DEFAULT FALSE,
  FOREIGN KEY (livro_id) REFERENCES livros(id)
);

INSERT INTO autores (nome, pais, ano_nascimento) VALUES
  ('Machado de Assis', 'Brasil', 1839),
  ('Clarice Lispector', 'Brasil', 1920),
  ('Gabriel García Márquez', 'Colômbia', 1927),
  ('Jane Austen', 'Inglaterra', 1775);

INSERT INTO livros (titulo, ano_publicacao, preco, autor_id) VALUES
  ('Dom Casmurro', 1899, 39.90, 1),
  ('Memórias Póstumas de Brás Cubas', 1881, 45.00, 1),
  ('A Hora da Estrela', 1977, 32.50, 2),
  ('Cem Anos de Solidão', 1967, 59.90, 3),
  ('Orgulho e Preconceito', 1813, 29.90, 4),
  ('O Primeiro Sucesso', 2010, 39.90, 1),
  ('Reflexões do Passado', 2015, 45.00, 1),
  ('Aventuras no Tempo', 2005, 29.90, 2),
  ('Crônicas Urbanas', 2018, 34.80, 3),
  ('O Enigma da Noite', 2021, 49.90, 4),
  ('Fragmentos de Sol', 2023, 52.00, 4);

INSERT INTO autores (nome, pais, ano_nascimento) VALUES
  ('Gabriel García Márquez', 'Colômbia', 1927),
  ('Virginia Woolf', 'Reino Unido', 1882),
  ('Fiódor Dostoiévski', 'Rússia', 1821),
  ('Jane Austen', 'Reino Unido', 1775),
  ('Jorge Luis Borges', 'Argentina', 1899),
  ('Toni Morrison', 'Estados Unidos', 1931),
  ('Haruki Murakami', 'Japão', 1949),
  ('Fernando Pessoa', 'Portugal', 1888),
  ('Mary Shelley', 'Reino Unido', 1797),
  ('Machado de Assis', 'Brasil', 1839);

INSERT INTO livros (titulo, ano_publicacao, preco, autor_id) VALUES
  ('Cem Anos de Solidão', 1967, 59.90, 5),
  ('O Amor nos Tempos do Cólera', 1985, 49.90, 5),
  ('Mrs. Dalloway', 1925, 34.90, 6),
  ('Ao Farol', 1927, 36.50, 6),
  ('Crime e Castigo', 1866, 69.90, 7),
  ('O Idiota', 1869, 64.00, 7),
  ('Os Irmãos Karamázov', 1880, 79.90, 7),
  ('Orgulho e Preconceito', 1813, 29.90, 8),
  ('Razão e Sensibilidade', 1811, 27.80, 8),
  ('Ficções', 1944, 42.00, 9),
  ('O Aleph', 1949, 39.90, 9),
  ('Amada', 1987, 45.00, 10),
  ('Canção de Solomon', 1977, 41.50, 10),
  ('Norwegian Wood', 1987, 54.90, 11),
  ('Kafka à Beira-Mar', 2002, 58.00, 11),
  ('Livro do Desassossego', 1982, 47.90, 12),
  ('Mensagem', 1934, 25.00, 12),
  ('Frankenstein', 1818, 31.90, 13),
  ('Dom Casmurro', 1899, 24.90, 14),
  ('Memórias Póstumas de Brás Cubas', 1881, 24.90, 14);

INSERT INTO emprestimos (livro_id, data_emprestimo, devolvido) VALUES
  (1, '2026-10-20', FALSE),
  (7, '2026-10-25', FALSE),
  (14, '2026-10-15', TRUE);

DROP USER IF EXISTS 'app_biblioteca'@'%';
DROP USER IF EXISTS 'consulta'@'%';
CREATE USER 'app_biblioteca'@'%' IDENTIFIED BY 'AppBib2026!';
CREATE USER 'consulta'@'%' IDENTIFIED BY 'Consulta2026!';
GRANT SELECT, INSERT, UPDATE, DELETE ON biblioteca.* TO 'app_biblioteca'@'%';
GRANT SELECT ON biblioteca.* TO 'consulta'@'%';
FLUSH PRIVILEGES;

-- 1. Inserção de mais 10 autores (IDs de 5 a 14)
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

-- 2 e 3. Inserção de 26 livros com preços realistas e datas consistentes
-- Distribuídos entre os autores existentes (IDs 1 a 4) e os novos (IDs 5 a 14)
INSERT INTO livros (titulo, ano_publicacao, preco, autor_id) VALUES
-- Livros para os autores existentes (IDs 1 a 4)
('O Primeiro Sucesso', 2010, 39.90, 1),
('Reflexões do Passado', 2015, 45.00, 1),
('Aventuras no Tempo', 2005, 29.90, 2),
('Crônicas Urbanas', 2018, 34.80, 3),
('O Enigma da Noite', 2021, 49.90, 4),
('Fragmentos de Sol', 2023, 52.00, 4),

-- Livros para os novos autores (IDs 5 a 14)
-- Gabriel García Márquez (ID 5)
('Cem Anos de Solidão', 1967, 59.90, 5),
('O Amor nos Tempos do Cólera', 1985, 49.90, 5),

-- Virginia Woolf (ID 6)
('Mrs. Dalloway', 1925, 34.90, 6),
('Ao Farol', 1927, 36.50, 6),

-- Fiódor Dostoiévski (ID 7)
('Crime e Castigo', 1866, 69.90, 7),
('O Idiota', 1869, 64.00, 7),
('Os Irmãos Karamázov', 1880, 79.90, 7),

-- Jane Austen (ID 8)
('Orgulho e Preconceito', 1813, 29.90, 8),
('Razão e Sensibilidade', 1811, 27.80, 8),

-- Jorge Luis Borges (ID 9)
('Ficções', 1944, 42.00, 9),
('O Aleph', 1949, 39.90, 9),

-- Toni Morrison (ID 10)
('Amada', 1987, 45.00, 10),
('Canção de Solomon', 1977, 41.50, 10),

-- Haruki Murakami (ID 11)
('Norwegian Wood', 1987, 54.90, 11),
('Kafka à Beira-Mar', 2002, 58.00, 11),

-- Fernando Pessoa (ID 12)
('Livro do Desassossego', 1982, 47.90, 12),
('Mensagem', 1934, 25.00, 12),

-- Mary Shelley (ID 13)
('Frankenstein', 1818, 31.90, 13),

-- Machado de Assis (ID 14)
('Dom Casmurro', 1899, 24.90, 14),
('Memórias Póstumas de Brás Cubas', 1881, 24.90, 14);

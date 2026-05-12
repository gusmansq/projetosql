create database if not exists biblioteca;

use biblioteca

create table livros (

id int auto_increment primary key,
titulo varchar(100),
isbn varchar(100),
ano_publicacao int,
editora_id int,
qantidade_estoque int,
quantidade_disponivel int
)

create table autores (

  id int auto_increment primary key,
    nome varchar(100),
    nacionalidade varchar(100),
    data_nascimento date
)


create table livro_autores (

livro_id int,
autor_id int
)

create table categorias (

    id int auto_increment primary key,
    nome varchar(100),
    descricao TEXT
)

create table livro_categorias (

livro_id int,
categoria_id int
)

create table editoras (
    id int AUTO_INCREMENT primary key,
    nome varchar(100),
    cidade varchar(100),
    pais varchar(100)

)

create table usuarios (
    id int AUTO_INCREMENT primary key,
    nome varchar(100),
    cpf varchar(11),
    email varchar(100),
    telefone varchar(100),
    data_cadastro DATE

)

create table emprestimos (
    id int auto_increment primary key,
    usuario_id int,
    livro_id int,
    data_emprestimo date,
    data_devolucao_prevista date,
    data_devolucao_real date
    
)

create table multa (
    id int AUTO_INCREMENT primary key,
    emprestimo_id int,
    valor decimal,
    data_geracao date,
    data_pagamento date,
    paga boolean
)

create table reservas (
    id int AUTO_INCREMENT primary key,
    usuario_id INT,
    livro_id INT,
    data_reserva date,
    status varchar(100)
)




alter table livros 

add foreign key (editora_id) references editoras(id);

alter table livro_autores
add foreign key (autor_id) references livros(id);

alter table livro_autores
add foreign key (autor_id) references autores(id);

alter table livro_categorias
add foreign key (livro_id) references livros(id);

alter table livro_categorias
add foreign key (categoria_id) references categorias(id);

alter table emprestimos
add foreign key (livro_id) references livros(id);

alter table emprestimos
add foreign key (usuario_id) references usuarios(id);

alter table multa
ADD FOREIGN KEY (emprestimo_id) REFERENCES emprestimos(id);

alter table reservas 
add foreign key (usuario_id) references usuarios(id);

alter table reservas
add foreign key (livro_id) references livros(id);

use projeto_1


insert into editoras (nome, cidade, pais) values
('Companhia das Letras', 'São Paulo', 'Brasil'),
('Record', 'Rio de Janeiro', 'Brasil'),
('Rocco', 'Rio de Janeiro', 'Brasil'),
('Intrínseca', 'Rio de Janeiro', 'Brasil'),
('Darkside Books', 'Rio de Janeiro', 'Brasil');

insert into autores (nome, nacionalidade, data_nascimento) VALUES
('Paulo Coelho', 'Brasileiro', '1947-08-24'),
('Machado de Assis', 'Brasileiro', '1839-06-21'),
('J.R.R. Tolkien', 'Britânico', '1892-01-03'),
('George Orwell', 'Britânico', '1903-06-25'),
('Clarice Lispector', 'Brasileira', '1920-12-10');

insert into categorias (nome, descricao) values
('Romance', 'Livros de romance e ficção sentimental'),
('Fantasia', 'Livros de fantasia e mundos fictícios'),
('Distopia', 'Livros de sociedades futuristas opressoras'),
('Realismo', 'Literatura realista brasileira'),
('Autoajuda', 'Livros de desenvolvimento pessoal');

INSERT INTO livros (titulo, isbn, ano_publicacao, editora_id, qantidade_estoque, quantidade_disponivel) VALUES
('O Alquimista', '9788532511010', 1988, 1, 5, 5),
('Dom Casmurro', '9788535902778', 1899, 1, 3, 3),
('O Senhor dos Anéis', '9788533613379', 1954, 3, 4, 4),
('1984', '9788535914849', 1949, 2, 6, 6),
('A Hora da Estrela', '9788532630278', 1977, 1, 3, 3);

INSERT INTO livro_autores (livro_id, autor_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO livro_categorias (livro_id, categoria_id) VALUES
(1, 5),
(2, 4),
(3, 2),
(4, 3),
(5, 1);

INSERT INTO usuarios (nome, cpf, email, telefone, data_cadastro) VALUES
('Carlos Silva', '123.456.789-00', 'carlos@email.com', '(11) 91234-5678', '2024-01-10'),
('Ana Souza', '987.654.321-00', 'ana@email.com', '(21) 99876-5432', '2024-02-15'),
('Fernanda Lima', '456.789.123-00', 'fernanda@email.com', '(31) 98765-4321', '2024-03-20'),
('Roberto Alves', '321.654.987-00', 'roberto@email.com', '(41) 97654-3210', '2024-04-05'),
('Julia Costa', '654.321.987-00', 'julia@email.com', '(51) 96543-2109', '2024-05-18');

INSERT INTO emprestimos (usuario_id, livro_id, data_emprestimo, data_devolucao_prevista, data_devolucao_real, status) VALUES
(1, 1, '2024-06-01', '2024-06-15', '2024-06-14', 'devolvido'),
(2, 3, '2024-06-05', '2024-06-19', NULL, 'emprestado'),
(3, 4, '2024-06-10', '2024-06-24', NULL, 'atrasado'),
(4, 2, '2024-06-12', '2024-06-26', '2024-06-25', 'devolvido'),
(5, 5, '2024-06-15', '2024-06-29', NULL, 'emprestado');

INSERT INTO multa (emprestimo_id, valor, data_geracao, data_pagamento, paga) VALUES
(3, 15.50, '2024-06-25', NULL, false);

INSERT INTO reservas (usuario_id, livro_id, data_reserva, status) VALUES
(1, 4, '2024-06-20', 'pendente'),
(2, 2, '2024-06-21', 'confirmada'),
(3, 1, '2024-06-22', 'cancelada'),
(4, 5, '2024-06-23', 'pendente'),
(5, 3, '2024-06-24', 'confirmada');



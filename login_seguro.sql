create database login_seguro;

  use login_seguro;

#tabela que contém todos os dados do usuario
create table usuarios (

id int auto_increment primary key,
nome varchar(100) not null,
email varchar(100) UNIQUE,
senha_hash varchar(255) not null,
criado_em timestamp default current_timestamp,
ativo boolean default true

);

#tabela que controla quem esta logado
create table sessoes (

id int auto_increment primary key,
usuario_id int not null,
token varchar(255),
iniciado_em timestamp default current_timestamp,
expira_em datetime,
foreign key (usuario_id) references usuarios(id)

);

#tabela que registra tentativas de login dos usuarios
create table logs_acesso (

id int auto_increment primary key,
usuario_id int,
ip varchar(45),
registrado_em timestamp default current_timestamp,
sucesso boolean,
foreign key (usuario_id) references usuarios(id)

);

#tabela que registra qualquer tentativa, mesmo de usuarios que não existe no banco de dados
create table tentativas_login (

id int auto_increment primary key,
email varchar(100),
ip varchar(100),
tentativa_em timestamp default current_timestamp

);

insert into usuarios(nome, email, senha_hash) values

('João Silva', 'joao@gmail.com', 'hash123'),
('Maria Souza', 'maria@gmail.com', 'hash456'),
('Carlos Lima', 'carlos@gmail.com', 'hash789'),
('Ana Costa', 'ana@gmail.com', 'hashabc'),
('Pedro Alves', 'pedro@gmail.com', 'hashxyz');

insert into sessoes (usuario_id, token, expira_em) values

(1, 'token_abc123', '2026-12-31 23:59:59'),
(2, 'token_xyz456', '2026-12-31 23:59:59'),
(3, 'token_qwe789', '2026-12-31 23:59:59');

insert into logs_acesso (usuario_id, ip, sucesso) values

(1, '192.168.0.1', 1),
(2, '192.168.0.2', 1),
(3, '192.168.0.3', 0),
(1, '192.168.0.4', 1),
(2, '192.168.0.5', 0);

insert into tentativas_login (email, ip) values

('invalido@gmail.com', '192.168.1.10'),
('erro@teste.com', '192.168.1.11'),
('fake@fake.com', '192.168.1.12'),
('naoexiste@email.com', '192.168.1.13');

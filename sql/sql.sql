create database tecnews;
use tecnews;

create table usuario (
	id	int	primary key auto_increment,
	nome	varchar(16),
	email	varchar(32),
	senha	varchar(16)
)auto_increment = 1000;

create table noticia (
	id	int primary key auto_increment, 
	titulo		varchar(64), 
	img			varchar(128), 
	texto		varchar(8000), 
	autor		varchar(20)
);

create table rank (
	id		int primary key auto_increment, 
	fkusuario	int,
	foreign key (fkusuario) references usuario(id),
	fknoticia	int,
	foreign key (fknoticia) references noticia(id),
	noticias_lidas	int, 
	pontos	int
);

insert into usuario (id, nome, email, senha) 
		VALUES (null,'Rony','ronyalves@gmail.com','25481179'),
				(null,'Pedro','pedro21@hotmail.com','6544456'),
				(null,'Breno','breno@outlook.com','12246487');

select * from usuario;

insert into noticia (id, titulo, img, texto, autor) 
		VALUES (null, 'Pessoas não sabem diferenciar', '', 'A diferenciação é baseada no blalbalbalbalba', 'Thais'),
				(null, 'Hoje em dia as Pessoas não se', '', 'No mundo moderno blalbalbalbalba', 'Rodrigo');

select * from noticia;

insert into rank (id, fkusuario, fknoticia, noticias_lidas, pontos) 
		VALUES (null, 1003, 2, 1, 150);

select * from rank;

select usuario.email ,noticias_lidas, pontos from rank join usuario on fkusuario = usuario.id where usuario.email = 'breno@outlook.com'; 

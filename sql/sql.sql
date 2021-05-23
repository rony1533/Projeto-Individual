create database tecnews;
use tecnews;

create table usuario (
	idusuario	int	primary key auto_increment,
	nome	varchar(16),
	email	varchar(32),
	senha	varchar(16)
)auto_increment = 1000;

create table noticia (
	idnoticia	int primary key auto_increment, 
	titulo		varchar(32), 
	img			varchar(128), 
	texto		varchar(8000), 
	autor		varchar(20)
);

create table rank (
	idRank		int primary key auto_increment, 
	fkusuario	int,
	foreign key (fkusario) references usuario(idusuario),
	fknoticia	int,
	foreign key (fknoticia) references noticia(idnoticia),
	noticias_lidas	int, 
	pontos	int
);
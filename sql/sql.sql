create database vrnews;
use vrnews;

create table estatisticas (
	idDados	int primary key auto_increment,
    favorito	char(14),
    check(favorito = 'Oculus' or favorito = 'Playstation VR' or favorito = 'VALVE')
);
create table usuario (
	id	int primary key auto_increment, 
	fkDados	int,
	foreign key (fkDados) references estatisticas(idDados),
	perfil int,
	check(perfil = 1 or perfil = 2 or perfil = 3),
	nome varchar(42), 
	email varchar(42), 
	senha varchar(16)
);
create table noticia (
	idnoticia	int primary key auto_increment, 
	titulo varchar(64), 
    texto	varchar(900), 
    autor	varchar(25)
);
create table historico (
	idhistorico	int	primary key auto_increment,
    fknoticia	int, 
    foreign key (fknoticia) references noticia(idnoticia),
    fkusuario	int,
    foreign key (fkusuario) references usuario(id),
    dataLida	datetime, 
    pontuacao	int
);

insert into estatisticas(idDados, favorito) 
			values (null, 'Oculus'),
					(null, 'VALVE'),
                    (null, 'Playstation VR');

select * from estatisticas;

select * from usuario; 

select idDados, nome,  favorito from usuario join estatisticas on fkDados = 3 where idDados = 3;

select * from usuario join estatisticas on fkDados = 3 where idDados = 3;

select idDados, count(favorito) as oculus, favorito from usuario join estatisticas on fkDados = 1 where idDados = 1;
select idDados, count(favorito) as valve, favorito from usuario join estatisticas on fkDados = 2 where idDados = 2;
select idDados, count(favorito) as playstation, favorito from usuario join estatisticas on fkDados = 3 where idDados = 3;

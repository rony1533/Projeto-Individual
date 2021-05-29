create database ac3_rony;
use ac3_rony;

create table estatisticas (
	idDados	int primary key auto_increment,
    favorito	char(14),
    check(favorito = 'Oculus' or favorito = 'Playstation VR' or favorito = 'VALVE'),
    sexo char(14),
    check(sexo = 'Masculino' or sexo = 'Feminino' or sexo = 'Outros')
);
create table usuario (
	idusuario	int primary key auto_increment, 
	fkDados	int,
	foreign key (fkDados) references estatisticas(idDados),
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
    foreign key (fkusuario) references usuario(idusuario),
    dataLida	datetime, 
    pontuacao	int
);

insert into estatisticas(idDados, favorito, sexo) 
			values (null, 'Oculus', 'Masculino'),
					(null, 'Oculus', 'Feminino'),
                    (null, 'Oculus', 'Outros'),
					(null, 'VALVE', 'Masculino'),
                    (null, 'VALVE', 'Feminino'),
                    (null, 'VALVE', 'Outros'),
                    (null, 'Playstation VR', 'Masculino'),
                    (null, 'Playstation VR', 'Feminino'),
                    (null, 'Playstation VR', 'Outros');

select * from estatisticas;

insert into usuario(idusuario, fkDados, nome, email, senha) 
			values (null, 1, 'Rony Sobral', 'rony25@outlook.com', 'sobral12345'),
					(null, 1, 'Breno Cesar', 'breno32@gmail.com', 'br13425532'),
                    (null, 2, 'Carolina', 'carol21@gmail.com', 'cr32694322'),
                    (null, 5, 'Dara', 'dara@hotmail.com', '1234564'),
                    (null, 7, 'Pedro', 'pedro@gmail.com', 'pp12332112');
                    
select * from usuario;

insert into noticia(idnoticia, titulo, texto, autor) 
		values (null, 'Novos headset de VR da VALVE', 'bla bla la lalblal valve oculos e blablabalba', 'Reginaldo'),
				(null, 'Novo Oculus quest pode chegar no final desse ano', 'lablalbalb pode vir a chegar no natal', 'Francisco'),
				(null, 'Empresa fecha parceria com a Playstation', 'blablalb Fecha parceria para fazer jogos para o VR da Playstation', 'Renata'),
				(null, 'VALVE apresenta seu novo VR', 'balblalba com tela que pode chegar até 8k em games', 'Gabriela'),
				(null, 'Playstation planeja lançar se novo vr', 'blalbal vr novo da Playstation', 'Bruna');
                
select * from noticia;

insert into historico(idhistorico, fknoticia, fkusuario, dataLida, pontuacao) 
		values (null, 1, 1, '2019-02-12 13:14:20', 100),
				(null, 3, 2, '2019-02-15 13:30:10', 100),
                (null, 1, 4, '2019-02-12 18:25:50', 100),
                (null, 2, 3, '2019-02-12 16:14:20', 100),
                (null, 4, 1, '2019-02-12 10:30:00', 100);
                
select * from historico;

select idusuario, fkDados, nome, favorito, sexo 
	from usuario 
	join estatisticas on usuario.fkDados = estatisticas.idDados;
    
select idhistorico, fknoticia, titulo, autor, fkusuario, usuario.nome as nome_Usuario 
		from historico 
		join noticia on fkusuario = idnoticia
		join usuario on fkusuario = idusuario;
                        
select idhistorico, fknoticia, titulo, autor, fkusuario, usuario.nome as nome_Usuario from historico 
						join noticia on fkusuario = idnoticia
						join usuario on fkusuario = idusuario where fkusuario = 2;
                        
select idhistorico, fknoticia, dataLida, pontuacao 
		from historico 
        join noticia on fknoticia = idnoticia
        where fknoticia = 2;
        
select usuario.nome, favorito, sexo, pontuacao from usuario 
		join estatisticas on usuario.fkDados = estatisticas.idDados
		join historico on fkusuario = idusuario;
        
select fkusuario, sum(pontuacao) as Pontuacao from historico where fkusuario = 1;
select sum(pontuacao) as Pontuacao from historico;

select * from usuario where sexo in (select sexo from estatisticas where sexo = 'Masculino'); 
-- PROVA 02/06/2026


-- CRIANDO DATABASE ---------------
create database empresa_games
default character set utf8mb4
default collate utf8mb4_general_ci;
-- --------------------------------


-- =================================
--     Universo Resindente Evil 
-- =================================

-- CRIANDO TABELAS --------------------------------------------------
create table salas (
id int not null auto_increment primary key,
nome varchar (50),
andar int
)default charset utf8mb4;

create table itens (
id int not null auto_increment primary key,
nomeIten varchar(50),
itemTipo varchar(20),
espaço int ,
iten_id int,
foreign key (iten_id) references salas(id)
)default charset utf8mb4;
-- -------------------------------------------------------------------

-- ADICIONANDO VALORES NAS TABELAS E LINCANDO UMA COM A OUTRA --------
insert into salas values
(default, 'Parte de fora', 1),
(default, 'Salão principal', 1),
(default, 'biblioteca', 2);

select * from salas;
select * from itens;

truncate itens;

INSERT INTO itens VALUES
  (default, 'Erva Verde', 'item de cura', '2','1'),
  (default, 'Erva Vermelha', 'item de cura','2','2' ),
  (default, 'Erva Azul', 'item de cura', '2','3'),
  (default, 'Munição de pistola ', 'munição' , '1', '2');

-- -----------------------------------------------------------------------------------------------

ALTER TABLE itens ADD CONSTRAINT uc_nome UNIQUE (nomeIten); -- Botando contrato pra não repetir 
ALTER TABLE salas ADD CONSTRAINT uc_nome UNIQUE (nome); -- Botando contrato pra não repetir 

-- -----------------------------------------------------------------------------------------------

--  ATUALIZAÇÃO DE EMERGÊNCIA

update Itens 
    set nomeIten = `Erva Verde misturada com Erva Vermelha`
    where id = 1;

-- INVENTÁRIO POR SALA 

select s.nome`Nome da sala`, i.nomeIten `Nome do Iten`, s.andar
from salas as s inner join itens as i
on i.iten_id = s.id;
  
  
-- BUSCANDO TEXTUAL POR PADRÃO 

select * from itens
where itemTipo like '_______'; -- 7 - Munição








-- =================================
--          DEAD BY DAYLIGHT
-- =================================

-- CRIANDO TABELAS --------------------------------------------------

create table assassinos (
id_assassinos int not null auto_increment primary key,
nome varchar (20),
poder varchar (50),
velocidade decimal (2,1)
)default charset utf8mb4;

create table partidas (
id int not null auto_increment primary key,
dataPartida date,
mapa varchar (50),
NSobrevivente int,
partidas_id int,
foreign key (partidas_id) references assassinos (id_assassinos)
)default charset utf8mb4;


drop table assassinos;
drop table partidas;
ALTER TABLE assassinos ADD CONSTRAINT uc_nome UNIQUE (nome); -- Botando contrato pra não repetir 
ALTER TABLE partidas ADD CONSTRAINT uc_Data UNIQUE (dataPartida); -- Botando contrato pra não repetir 
 

-- -------------------------------------------------------------------


-- ADICIONANDO VALORES NAS TABELAS E LINCANDO UMA COM A OUTRA --------
insert into assassinos value
(default, 'O COMEDOR DE CU', 'Comer cu', '4.5' );


INSERT INTO partidas VALUES
  (default, '2025-05-10', 'Campo do caipira ', '3','1'),
  (default, '2025-05-11', 'A casa da mamae','2','1' ),
  (default, '2025-05-12', 'RPD', '4','1');
-- --------------------------------------------------------------------

select p.mapa`Nome do mapa`, p.dataPartida `Data da Partida`, a.nome `Nome Assassino`
from assassinos as a inner join partidas as p
on p.partidas_id = a.id_assassinos;


-- MÉDIA DE SACRIFÍCIOS
select avg(NSobrevivente) from partidas;


-- RESET DE TEMPORADA 
truncate table partidas; -- UTILIZEI ESSE COMANDO POIS FOI OQUE ME ENSINARAM E OQUE ME DISERAM QUE SERIA MAIS ADEQUADO PARA LIMPAR TODOS OS DADOS DA TABELA







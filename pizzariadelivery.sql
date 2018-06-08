create table Categoria(
cod serial not null primary key,
categoria varchar(30),
disponivel boolean
);

create table Perfil(
id serial not null primary key,
nivel_acesso varchar (20) not null unique
);

create table PerfilFunc(
id serial not null primary key,
nivel_acesso varchar (20) not null unique,
perfil int not null,
constraint fk_perfil foreign key (perfil) references Perfil(id)
);

create table Usuario(
id serial not null primary key,
login varchar (20) not null,
senha varchar (20) not null,
perfil int not null,
disponivel boolean,
constraint fk_perfil foreign key (perfil) references Perfil(id) 
);

create table Endereco(
id serial not null primary key,
rua varchar(70) not null,
cep varchar (10) not null,
numero int not null,
bairro varchar(30) not null,
cidade varchar (30)not null,
estado varchar (30)not null,
referencias varchar (50)
);

create table Cliente (
id serial not null primary key,
nome varchar (50) not null,
sexo char not null,
nascimento varchar (10) not null,
telefone varchar (15) not null,
cpf varchar (15) not null unique,
rg varchar(15) not null,
endereco int,
id_user int not null,
disponivel boolean,
constraint fk_endereco foreign key (endereco) references Endereco(id),
constraint fk_id_user foreign key (id_user) references Usuario(id)
);

create table Funcionario(
id serial not null primary key,
perfil int not null,
funcao varchar (20) not null,
nome varchar (50) not null,
sexo char not null,
nascimento varchar (10) not null,
telefone varchar (15) not null,
rg varchar (15) not null,
cpf varchar (15) not null,
id_user int not null,
endereco int,
disponivel boolean,
constraint fk_endereco foreign key (endereco) references Endereco(id),
constraint fk_id_user foreign key (id_user) references Usuario(id),
constraint fk_perfil foreign key (perfil) references PerfilFunc(id)
);

create table Pedido (
cod serial not null primary key,
status varchar,
idFunc int,
observacao varchar(50),
desconto numeric (10,2),
entega boolean,
taxaEntrega numeric(10,2),
troco numeric (10,2),
endereco int,
idCli int not null,
valortotal numeric(10,2),
data date,
constraint fk_idFunc foreign key (idFunc) references Funcionario(id),
constraint fk_idCli foreign key (idCli) references Cliente(id),
constraint fk_endereco foreign key (endereco) references Endereco(id)
);

create table Produto(
cod serial not null primary key,
codCat int,
nome varchar (30),
ingredientes varchar(100),
valor numeric (10,2),
id_user int,
disponivel boolean,
constraint fk_id_user foreign key (id_user) references Usuario(id),
constraint fk_codCat foreign key (codCat) references Categoria(cod)
);

create table ItemPedido(
cod serial primary key,
codproduto int,
quantidade int,
valoritem numeric (10,2),
idpedido int,
constraint fk_pedido foreign key (idpedido) references Pedido(cod),
constraint fk_codPro foreign key (codProduto) references Produto(cod)
);

create table Combo(
id serial primary key,
pedido int not null,

constraint pedido_fk foreign key (pedido) references Pedido (cod)
);

create table ItemCombo(
id serial primary key,
produto int not null,
combo int not null,

constraint combo_fk foreign key (combo) references Combo (id),
constraint produto_fk foreign key (produto) references Produto (cod)
);

INSERT INTO categoria VALUES (1, 'Pizza',TRUE);
INSERT INTO categoria VALUES (2, 'Esfirra',TRUE);
INSERT INTO categoria VALUES (3, 'Bebida',TRUE);

INSERT INTO Perfil VALUES (1, 'Usuario');
INSERT INTO Perfil VALUES (2, 'Funcionario');

INSERT INTO PerfilFunc VALUES (1, 'Gerente', 2);
INSERT INTO PerfilFunc VALUES (2, 'Balconista', 2);
INSERT INTO PerfilFunc VALUES (3, 'Pizzaiolo', 2);

INSERT INTO Usuario VALUES (1, 'Admin', 'Admin123', 2, TRUE);

												
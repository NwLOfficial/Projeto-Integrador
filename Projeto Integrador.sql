create database bdSistemaLanchonete;

use bdSistemaLanchonete;

/* ------------------------------------------------------------------------------------------------------------------------------------------------ */

create table tbEstoque
(
    codigo int identity(1,1),
    nome varchar(100) not null,
    descricao varchar(255) not null,
    marca varchar(50) not null,
    quantidade int not null,
    preco_Venda decimal(10,2) not null check (preco_Venda >= 0),
    primary key(codigo)
);

/* ------------------------------------------------------------------------------------------------------------------------------------------------ */

create table tbSituacao
(
    idSituacao int identity(1,1),
    descricao varchar(50) not null,
    primary key(idSituacao)
);

/* ------------------------------------------------------------------------------------------------------------------------------------------------ */

create table tbLancamento
(
    idProduto int identity(1,1),
    idProdutoEstoque int not null,
    idSituacao int not null, -- Relaciona com a tabela de situações
    quantidade int not null,
    data date not null,
    primary key(idProduto),
    constraint fk_Lancamento_Estoque foreign key (idProdutoEstoque) references tbEstoque(codigo),
    constraint fk_Lancamento_Situacao foreign key (idSituacao) references tbSituacao(idSituacao)
);

/* ------------------------------------------------------------------------------------------------------------------------------------------------ */

create table tbPedidos
(
    idPedido int identity(1,1),
    Numero_Pedido int not null,
    Codigo_Usuario int not null,
    quantidade int not null,
    data date not null,
    Observacao text,
    primary key(idPedido),
    constraint fk_Pedidos_Usuarios foreign key (Codigo_Usuario) references tbUsuarios(codigo)
);

/* ------------------------------------------------------------------------------------------------------------------------------------------------ */

create table tbUsuarios
(
    codigo int identity(1,1),
    nome varchar(100) not null,
    permissao varchar(1) default('U') check (permissao in ('U', 'A')), -- 'U' para Usuário, 'A' para Administrador
    senha varchar(255) not null, -- Para armazenar hash da senha
    primary key(codigo)
);

/* ------------------------------------------------------------------------------------------------------------------------------------------------ */

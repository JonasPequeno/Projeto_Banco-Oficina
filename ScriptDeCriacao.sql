CREATE TABLE Pessoa(
 Cpf VARCHAR(11),
 Email VARCHAR(50) UNIQUE NOT NULL,
 Rg VARCHAR(10) NOT NULL,
 DataNascimento DATE NOT NULL,
 Nome VARCHAR(100) NOT NULL,
 Rua VARCHAR(100),
 Bairro VARCHAR(100) NOT NULL,
 Cidade VARCHAR(50)NOT NULL,
 PRIMARY KEY(CPF)
);

CREATE TABLE Cliente (
 Cpf VARCHAR(11),
 PRIMARY KEY(CPF),
 FOREIGN KEY(CPF) REFERENCES PESSOA(CPF)
);

CREATE TABLE Funcionario(
 Cpf VARCHAR(11),
 Salario REAL NOT NULL DEFAULT 900,
 Cargo VARCHAR(30) NOT NULL,
 Matricula VARCHAR(6) NOT NULL,
 CodDepartamento INT,
 PRIMARY KEY(CPF)
);


CREATE TABLE Departamento(
 Codigo INT,
 Nome VARCHAR(30) NOT NULL UNIQUE,
 CpfGerente VARCHAR(11),
 PRIMARY KEY(Codigo)
);

CREATE TABLE PessoaTelefone(
 Cpf VARCHAR(11),
 Telefone VARCHAR(11),
 PRIMARY KEY(Cpf , Telefone),
 FOREIGN KEY (cpf) REFERENCES PESSOA(CPF)
);

CREATE TABLE PONTO(
 Codigo INT,
 Data DATE NOT NULL,
 HoraSaida TIME NOT NULL,
 HoraEntrada TIME NOT NULL,
 CpfFuncionario VARCHAR(11),
 PRIMARY KEY(Codigo),
 FOREIGN KEY(CpfFuncionario) REFERENCES FUNCIONARIO(cpf)
);

CREATE TABLE Estoque(
 QuantTotal INT,
 ID INT,
 PRIMARY KEY(ID)
);

CREATE TABLE PecaAcessorio(
 IDEstoque INT,
 NomeProduto VARCHAR(30) NOT NULL,
 Codigo INT,
 Garantia INT,
 Valor REAL NOT NULL,
 AnoAno VARCHAR(9) NOT NULL,
 ModeloVeiculo VARCHAR(20) NOT NULL,
 NomeVeiculo VARCHAR(20) NOT NULL,
 PRIMARY KEY(Codigo),
 FOREIGN KEY(IDEstoque) REFERENCES Estoque(ID)
);
CREATE TABLE FuncionarioEstoque(
 CpfFuncionario VARCHAR(11),
 IDEstoque INT,
 PRIMARY KEY(CpfFuncionario,IDEstoque),
 FOREIGN KEY(CpfFuncionario) REFERENCES Funcionario(Cpf),
 FOREIGN KEY(IDEstoque) REFERENCES Estoque(ID)
);
CREATE TABLE FuncionarioPecaAcessorio(
 CpfGerente VARCHAR(11),
 CpfFuncionario VARCHAR(11),
 CodPeca INT,
 Data Date not null,
 PRIMARY KEY(CpfGerente, CpfFuncionario, CodPeca, Data),
 FOREIGN KEY(CpfGerente) REFERENCES Funcionario(Cpf),
 FOREIGN KEY(CpfFuncionario) REFERENCES Funcionario(Cpf),
 FOREIGN KEY(CodPeca) REFERENCES PecaAcessorio(Codigo) 
);
CREATE TABLE Pedido(
 ID INT,
 Quantidade INT,
 Data DATE ,
 PRIMARY KEY(ID)
);
CREATE TABLE PedidoPecaAcessorio(
 IDPedido INT,
 CodPeca INT,
 PRIMARY KEY(IDPedido,CodPeca),
 FOREIGN KEY(codPeca) REFERENCES PecaAcessorio(Codigo),
 FOREIGN KEY(IDPedido) REFERENCES Pedido(ID)
);

CREATE TABLE FuncionarioPedido(
 CpfGerente VARCHAR(11),
 IDPedido INT,
 PRIMARY KEY(CpfGerente,IDPedido),
 FOREIGN KEY(CpfGerente) REFERENCES Funcionario(Cpf),
 FOREIGN KEY(IDPedido) REFERENCES Pedido(ID)
);
CREATE TABLE Fornecedor(
 NomeEmpresa VARCHAR(50) NOT NULL UNIQUE,
 Codigo INT UNIQUE NOT NULL,
 CNPJ VARCHAR(20),
 ENDERECO VARCHAR(100) NOT NULL,
 PRIMARY KEY(CNPJ)
);

CREATE TABLE PedidoFornecedor(
 CNPJ VARCHAR(20),
 IDPEdido INT,
 PRIMARY KEY(CNPJ,IDPedido),
 FOREIGN KEY(CNPJ) REFERENCES Fornecedor(CNPJ),
 FOREIGN KEY(IDPedido) REFERENCES Pedido(ID)
);

CREATE TABLE FornecedorTelefone(
 CNPJ VARCHAR(20),
 Telefone VARCHAR(11),
 PRIMARY KEY(CNPJ , Telefone),
 FOREIGN KEY(CNPJ) REFERENCES Fornecedor(CNPJ)
);

CREATE TABLE Agendamento(
 ID INT,
 Hora TIME NOT NULL,
 Data DATE NOT NULL,
 PRIMARY KEY(ID)
);

CREATE TABLE AgendaPecaAcessorio(
 IDAgenda INT ,
 CodPeca INT,
 PRIMARY KEY(IDAgenda , CodPeca),
 FOREIGN KEY(IDAgenda) REFERENCES Agendamento(ID),
 FOREIGN KEY(CodPeca) REFERENCES PecaAcessorio(Codigo)
);

CREATE TABLE FuncionarioAgenda(
 CpfFuncionario VARCHAR(11),
 IDAgenda INT,
 Disponibilidade BOOLEAN,
 PRIMARY KEY(CpfFuncionario,IDAgenda),
 FOREIGN KEY(IDAgenda) REFERENCES Agendamento(ID),
 FOREIGN KEY(CpfFuncionario) REFERENCES Funcionario(CPF)
);

CREATE TABLE ClienteAgenda(
 CpfCliente VARCHAR(11),
 IDAgenda INT,
 Data DATE NOT NULL,
 Hora TIME NOT NULL,
 PRIMARY KEY(CpfCliente,IDAgenda),
 FOREIGN KEY(IDAgenda) REFERENCES Agendamento(ID),
 FOREIGN KEY(CpfCliente) REFERENCES Cliente(CPF)
);

CREATE TABLE Pagamento(
 ID INT,
 Data DATE NOT NULL,
 Hora TIME NOT NULL,
 PRIMARY KEY(ID)
);
CREATE TABLE Cartao(
 Numero VARCHAR(20),
 Bandeira VARCHAR(20) NOT NULL,
 Titular VARCHAR(50) NOT NULL,
 PRIMARY KEY(Numero)
);

CREATE TABLE VendaCartao(
 IDPagamento INT,
 NumParcelas INT DEFAULT 1,
 NumCartao  VARCHAR(20),
 Valor Real NOT NULL, 
 PRIMARY KEY(IDPagamento),
 FOREIGN KEY(NumCartao) REFERENCES Cartao(Numero),
 FOREIGN KEY(IDPagamento) REFERENCES Pagamento(ID)
);

CREATE TABLE VendaCheque(
 IDPagamento INT,
 Titular VARCHAR(50) NOT NULL, 
 Numero VARCHAR(50),
 Data DATE NOT NULL,
 Banco VARCHAR(50),
 Valor Real NOT NULL,
 PRIMARY KEY(IDPagamento),
 FOREIGN KEY(IDPagamento) REFERENCES Pagamento(ID)
);


CREATE TABLE ClientePagamento(
 CpfCliente VARCHAR(11),
 IDPagamento INT,
 PRIMARY KEY(IDPagamento , CpfCliente),
 FOREIGN KEY(IDPagamento) REFERENCES Pagamento(ID),
 FOREIGN KEY(CpfCliente) REFERENCES Cliente(CPF)
);

CREATE TABLE FornecedorPecaAcessorio(
 CNPJ VARCHAR(20),
 CodPeca INT,
 PRIMARY KEY(CNPJ,CodPeca),
 FOREIGN KEY(CNPJ) REFERENCES Fornecedor(CNPJ),
 FOREIGN KEY(CodPeca) REFERENCES PECAACESSORIO(Codigo)
);

--- Já que é referencia cruzada, a restriçao foi adicionado depois---
ALTER TABLE DEPARTAMENTO ADD CONSTRAINT cpfGerente_fk
FOREIGN KEY(CpfGerente) REFERENCES FUNCIONARIO(CPF);

ALTER TABLE FUNCIONARIO ADD CONSTRAINT codDep_fk
FOREIGN KEY(CodDepartamento) REFERENCES Departamento(Codigo);
 
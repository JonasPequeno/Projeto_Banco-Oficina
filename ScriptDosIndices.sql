create index on agendamento(id); --Indice referente ao atributo ID da tabela AGENDAMENTO.--
create index on agendaPecaAcessorio(idAgenda , codPeca); --Indice referente aos atributos IDAGENDA e CODPECA da tabela AGENDAPECAACESSORIO.--
create index on cartao(numero); --Indice referente ao atributo NUMERO da tabela CARTAO.--
create index on cliente(cpf); --Indice referente ao atributo CPF da tabela CLIENTE.--
create index on clienteAgenda(cpfCliente,IdAgenda); --Indice referente aos atributos CPFCLIENTE e IDAGENDA da tabela CLIENTEAGENDA.--
create index on clientePagamento(cpfCliente, idPagamento); --Indice referente aos atributos CPFCLIENTE e IDPAGAMENTO da tabela CLIENTEPAGAMENTO.--
create index on departamento(codigo); --Indice referente ao atributo CODIGO da tabela DEPARTAMENTO.--
create index on estoque(id); --Indice referente ao atributo ID da tabela ESTOQUE.--
create index on fornecedor(cnpj); --Indice referente ao atributo CNPJ da tabela FORNECEDOR.--
create index on fornecedorPecaAcessorio(cnpj , codPeca); --Indice referente aos atributos CNPJ e CODPECA da tabela FORNECEDORPECAACESSORIO.--
create index on fornecedorTelefone(cnpj, telefone); --Indice referente aos atributos CNPJ e TELEFONE da tabela FORNECEDORTELEFONE.--
create index on funcionario(cpf); --Indice referente ao atributo CPF da tabela FUNCIONARIO.--
create index on funcionarioAgenda(cpffuncionario , idAgenda); --Indice referente aos atributos CPFFUNCIONARIO e IDAGENDA da tabela FUNCIONARIOAGENDA.--
create index on funcionarioEstoque(cpffuncionario, IdEstoque); --Indice referente aos atributos CPFFUNCIONARIO e IDESTOQUE da tabela FUNCIONARIOESTOQUE.--
create index on funcionarioPecaAcessorio(cpfFuncionario,CodPeca); --Indice referente aos atributos CPFFUNCIONARIO e CODPECA da tabela FUNCIONARIOPECAACESSORIO.--
create index on funcionarioPedido(cpfGerente, idPedido); --Indice referente aos atributos CPFGERENTE e IDPEDIDO da tabela FUNCIONARIOPEDIDO.--
create index on pagamento (id); --Indice referente ao atributo ID da tabela PAGAMENTO.--
create index on pecaAcessorio(codigo); --Indice referente ao atributo CODIGO da tabela PECAACESSORIO.--
create index on pedido(id); --Indice referente ao atributo ID da tabela PEDIDO.--
create index on pedidoFornecedor(cnpj, idPedido); --Indice referente aos atributos CNPJ e IDPEDIDO da tabela PEDIDOFORNECEDOR.--
create index on pedidoPecaAcessorio(idPedido, codPeca); --Indice referente aos atributos IDPEDIDO e CODPECA da tabela PEDIDOPECAACESSORIO.--
create index on pessoa(cpf); --Indice referente ao atributo CPF da tabela PESSOA.--
create index on pessoaTelefone(cpf ,telefone); --Indice referente aos atributos CPF e TELEFONE da tabela PESSOATELEFONE.--
create index on ponto(codigo); --Indice referente ao atributo CODIGO da tabela PONTO.--
create index on vendaCartao (idPagamento , numCartao); --Indice referente aos atributos IDPAGAMENTO e NUMCARTAO da tabela VENDACARTAO.--
create index on vendaCheque (idPagamento, numero); --Indice referente ao atributo IDPAGAMENTO e NUMERO da tabela VENDACHEQUE.--
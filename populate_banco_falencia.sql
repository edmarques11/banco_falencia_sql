USE banco_falencia;

INSERT
  INTO endereco(cep, cidade, bairro, numero, estado, logradouro, complemento)
VALUES
  ('12345678', 'Sussuapara', 'centro', 11, 'PI', 'casa', 'próximo ao bar do Zé'),
  ('98210038', 'Bocaina', 'centro', 29, 'PI', 'casa', 'próximo ao bar do Paulo'),
  ('12312832', 'sao Luis', 'centro', 19, 'PI', 'casa', 'próximo ao bar do Abdias'),
  ('99874632', 'Santo Santo Antônio', 'centro', 22, 'PI', 'casa', 'próximo ao bar do Di Assis'),
  ('13213213', 'Jaicós', 'centro', 1, 'PI', 'casa', 'próximo ao bar do João'),
  ('98273283', 'Patos', 'centro', 88, 'PI', 'casa', 'próximo ao bar do Pedro'),
  ('13123128', 'Pimenteiras', 'centro', 129, 'PI', 'casa', 'próximo ao bar do Cicero'),
  ('13123128', 'Pimenteiras', 'centro', 129, 'PI', 'casa', 'próximo ao bar do Gleicon'),
  ('13123128', 'Pimenteiras', 'centro', 129, 'PI', 'casa', 'próximo ao bar do Carlos'),
  ('13123128', 'Pimenteiras', 'centro', 129, 'PI', 'casa', 'próximo ao bar da Raila');

INSERT
  INTO cliente(nome, cpf_cnpj, razao_social, apelido, endereco_id)
VALUES
  ('Romulo', '42427189693', null, 'Carvalho', 1),
  ('Edmarques', '91637836066', null, 'Lima', 2),
  ('Rafael', '62278426133', null, 'Ramos', 3),
  ('Michel', '75582807705', null, 'Fonseca', 9),
  ('Lucas', '56691092791', null, 'Matos', 6),
  ('Raquel', '34648301447', null, 'Cadete', 7),
  ('MB Labs', '04476538000128', 'Mb Labs', 'MB', 1),
  ('Coder Corporation', '71482024000172', 'Coder Corporation', 'Cod3r', 8),
  ('Mova Sociedade de Emprestimo entre Pessoas', '42486450000186', 'Mova', 'Mova', 5),
  ('Mambee', '24188486000100', 'Mambee', 'Mambee', 4);

INSERT
  INTO cartao(numero_cartao, codigo_seguranca, data_validade, tipo_cartao, cartao_virtual, limite, cliente_id)
VALUES
  ('5454335644570964', 394, '2024/01/01', 'multiplo', 'nao', 400.00, 10),
  ('5454335644570955', 134, '2024/12/11', 'multiplo', 'nao', 400, 2),
  ('5454335644570956', 998, '2029/04/22', 'multiplo', 'sim', 50.0, 2),
  ('5454335644570957', 409, '2025/08/11', 'debito', 'nao', null, 3),
  ('5454335644570958', 110, '2024/11/08', 'multiplo', 'nao', 200, 4),
  ('5454335644570959', 111, '2024/03/02', 'credito', 'nao', 670, 5),
  ('5454335644570960', 122, '2024/04/15', 'multiplo', 'sim', 500, 6),
  ('5454335644570961', 155, '2024/06/19', 'debito', 'nao', null, 7),
  ('5454335644570962', 892, '2024/07/13', 'multiplo', 'nao', 110, 8),
  ('5454335644570963', 982, '2024/05/17', 'debito', 'nao', null, 9);

INSERT
  INTO conta(tipo_pessoa, tipo_conta, agencia_com_digito, numero_com_digito, cliente_id)
VALUES
  ('pf', 'cc', '123456', '12345678901', 1),
  ('pf', 'cp', '123457', '12345678902', 2),
  ('pf', 'cc', '123458', '12345678903', 3),
  ('pf', 'cc', '123459', '12345678904', 4),
  ('pf', 'cp', '123460', '12345678905', 5),
  ('pf', 'cp', '123461', '12345678906', 6),
  ('pj', 'cc', '123462', '12345678907', 7),
  ('pf', 'cp', '123463', '12345678908', 8);

INSERT
  INTO conta_externa_transacao(banco, tipo_pessoa, tipo_conta, cpf_cnpj, nome_titular, agencia_com_digito, numero_com_digito)
VALUES
  ('Banco da miseria', 'pf', 'cp', '15265536604', 'Euzébio Batista', '1235', '48324934'),
  ('Banco da miseria', 'pf', 'cp', '84027307879', 'João Carlos', '9821', '578203481'),
  ('Banco da miseria', 'pf', 'cp', '74586583126', 'Pedro Campello', '09324', '7480238432'),
  ('Banco da miseria', 'pf', 'cp', '14157236807', 'Alice Montano', '123998', '12341094'),
  ('Banco da miseria', 'pf', 'cp', '32961131693', 'Carla Bianca', '83242323', '22341134'),
  ('Banco da miseria', 'pj', 'cc', '22631237000103', 'Alvaro Bezerra', '10340', '99028432'),
  ('Banco da miseria', 'pj', 'cc', '77347267000184', 'Luana Luz', '28193', '12342564'),
  ('Banco da miseria', 'pj', 'cc', '47432257000186', 'Sophia Andrade', '4324333', '1346998273');

INSERT
  INTO transacoes(tipo_transacao, valor_transacao, transacao_interna)
VALUES
  ('deposito', 250, 'sim'),
  ('saque', 255, 'sim'),
  ('saque', 260, 'sim'),
  ('deposito', 290, 'sim'),
  ('saque', 120, 'sim'),
  ('deposito', 200, 'sim'),
  ('deposito', 250, 'sim'),
  ('saque', 500, 'sim'),
  ('deposito', 250, 'sim'),
  ('transferencia', 255, 'sim'),
  ('transferencia', 260, 'sim'),
  ('transferencia', 290, 'nao'),
  ('transferencia', 120, 'nao'),
  ('transferencia', 200, 'nao'),
  ('transferencia', 250, 'nao'),
  ('transferencia', 500, 'nao');

INSERT
  INTO transacoes_conta(id_transacao, id_conta_interna_saida)
VALUES
  (1, 2),
  (8, 3);

INSERT
  INTO transacoes_conta(id_transacao, id_conta_interna_entrada)
VALUES
  (1, 1),
  (5, 4);

INSERT
  INTO transacoes_conta(id_transacao, id_conta_interna_saida, id_conta_interna_entrada)
VALUES
  (10, 1, 2),
  (11, 6, 2);

INSERT
  INTO transacoes_conta(id_transacao, id_conta_interna_saida, id_conta_externa_entrada)
VALUES
  (12, 1, 1),
  (13, 6, 4);

INSERT
  INTO transacoes_conta(id_transacao, id_conta_externa_saida, id_conta_interna_entrada)
VALUES
  (14, 1, 4),
  (15, 6, 8);

INSERT
  INTO compras(valor_total, parcelas, juros_porcentagem, estabelecimento, data_compra)
VALUES
  (20, 1, 0, 'Budega do paulo', '2024/01/28'),
  (10, 2, 0.1, 'Supermercado Barra dura', '2024/01/29'),
  (80, 1, 0.03, 'Posto petroleo', '2024/02/28'),
  (120, 1, 0, 'Bar da esquina', '2024/03/28'),
  (20, 1, 0.01, 'Quitanga do paulo', '2024/01/12'),
  (200, 1, 0, 'Bar do João', '2024/01/28'),
  (20, 1, 0.2, 'Sorveteria preta', '2024/12/11'),
  (20, 1, 0.04, 'Açaí do nordeste', '2024/01/15'),
  (20, 1, 0.03, 'Cabana dance', '2024/01/14'),
  (20, 1, 0, 'Cinema olho vivo', '2024/05/09');

INSERT
  INTO fatura(valor, parcelas, data_vencimento, cartao_id)
VALUES
  (200, 1, '2022/01/20', 1),
  (100, 2, '2022/04/10', 2),
  (180, 1, '2022/03/13', 2),
  (125.80, 1, '2022/08/01', 3),
  (433.36, 4, '2022/10/19', 5),
  (988.50, 1, '2022/11/05', 5),
  (10, 1, '2022/12/04', 5),
  (33, 6, '2022/02/02', 8),
  (78, 2, '2022/04/21', 6),
  (15.98, 1, '2022/06/29', 6);

INSERT
  INTO compras_fatura(id_compra, id_fatura)
VALUES
  (1, 2), (2, 1), (3, 1), (6, 4), (4, 4),
  (5, 4), (7, 4), (8, 5), (9, 7), (10, 2);

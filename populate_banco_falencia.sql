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
  ('Rafael', '62278426133', null, 'Ramos', 2),
  ('Michel', '75582807705', null, 'Fonseca', 2),
  ('Lucas', '56691092791', null, 'Matos', 6),
  ('Raquel', '34648301447', null, 'Cadete', 2),
  ('MB Labs', '04476538000128', 'Mb Labs', 'MB', 1),
  ('Fatal Model', '71482024000172', 'Model', 'MODEL', 1),
  ('Mova Sociedade de Emprestimo entre Pessoas', '42486450000186', 'Mova', 'Mova', 2),
  ('Mambee', '24188486000100', 'Mambee', 'Mambee', 2);

INSERT
  INTO cartao(numero_cartao, codigo_seguranca, data_validade, tipo_cartao, cartao_virtual, limite, cliente_id)
VALUES
  ('5454335644570954', 394, '2024/04/30', 'multiplo', 'nao', 400, 1);
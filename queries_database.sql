USE banco_falencia;

SELECT cliente.nome AS 'Nome do Cliente', endereco.cidade AS 'Cidade do Cliente'
FROM cliente, endereco
WHERE
  cliente.id = endereco.id
AND
  endereco.complemento = 'próximo ao bar do Zé';

SELECT
  cliente.nome AS 'Nome do cliente', cliente.cpf_cnpj AS 'CPF ou CNPJ do cliente'
FROM cliente
INNER JOIN
  endereco
ON
  cliente.endereco_id = endereco.id
INNER JOIN
  conta
ON conta.cliente_id = cliente.id
WHERE
  endereco.cidade = 'Pimenteiras' AND conta.tipo_pessoa = 'pf';

SELECT
  cliente.nome AS 'Nome do cliente', cliente.cpf_cnpj AS 'CPF ou CNPJ do cliente'
FROM cliente
INNER JOIN
  endereco
ON
  cliente.endereco_id = endereco.id
INNER JOIN
  cartao
ON cartao.cliente_id = cliente.id
WHERE
  endereco.cidade = 'Pimenteiras' AND cartao.tipo_cartao = 'multiplo';

SELECT compras.estabelecimento AS 'Compra estabelecimento', compras.valor_total AS 'Valor'
FROM compras
INNER JOIN
  compras_fatura
ON compras.id = compras_fatura.id_compra
INNER JOIN
  fatura
ON fatura.id = compras_fatura.id_fatura
WHERE
  compras.valor_total >= 80 OR fatura.valor > 180;

SELECT
  cliente.nome AS 'Nome do cliente', cartao.numero_cartao AS 'Numero do cartao', avg(fatura.valor) AS 'Valor total das faturas'
FROM cliente, cartao, fatura
WHERE
  cartao.cliente_id = cliente.id
AND
  cartao.id = fatura.cartao_id;

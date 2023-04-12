SELECT 
MIN(P.plano_valor) AS faturamento_minimo,
MAX(P.plano_valor) AS faturamento_maximo,
ROUND(AVG(P.plano_valor), 2) AS faturamento_medio,
ROUND(SUM(P.plano_valor), 2) AS faturamento_total
FROM SpotifyClone.planos AS P 
INNER JOIN SpotifyClone.users US
ON US.plano_id = P.plano_id;
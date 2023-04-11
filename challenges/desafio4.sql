SELECT 
U.user_nome AS pessoa_usuaria,
IF(MAX(YEAR(HIST.data_reproducao)) >= 2021, 'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM SpotifyClone.users AS U, SpotifyClone.historico_reproducao AS HIST
WHERE U.user_id = HIST.user_id
GROUP BY U.user_nome
ORDER BY U.user_nome;
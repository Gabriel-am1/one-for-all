SELECT 
U.user_nome AS pessoa_usuaria,
COUNT(S.song_id) AS musicas_ouvidas,
ROUND((SUM(MUS.duration) / 60), 2) AS total_minutos
FROM 
SpotifyClone.users AS U
INNER JOIN SpotifyClone.historico_reproducao AS S
ON U.user_id = S.user_id 
INNER JOIN  SpotifyClone.songs AS MUS
ON S.song_id = MUS.song_id
GROUP BY U.user_nome
ORDER BY U.user_nome;
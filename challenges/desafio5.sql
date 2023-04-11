-- SELECT S.song_nome AS cancao,
-- COUNT(HIST.song_id) AS reproducoes
-- FROM SpotifyClone.songs S INNER JOIN SpotifyClone.historico_reproducao HIST
-- ON S.song_nome = HIST.song_id 
-- GROUP BY S.song_nome, HIST.song_id
-- ORDER BY cancao DESC, cancao
-- LIMIT 2;

SELECT s.song_nome AS cancao, COUNT(hr.user_id) AS reproducoes
FROM historico_reproducao hr
INNER JOIN songs s ON hr.song_id = s.song_id
GROUP BY hr.song_id
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;
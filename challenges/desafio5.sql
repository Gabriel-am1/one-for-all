SELECT s.song_nome AS cancao, COUNT(hr.user_id) AS reproducoes
FROM historico_reproducao hr
INNER JOIN songs s ON hr.song_id = s.song_id
GROUP BY hr.song_id
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;
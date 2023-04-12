SELECT
A.artista_nome AS artista,
AB.album_nome AS album,
COUNT(SEG.user_id) AS pessoas_seguidoras
FROM SpotifyClone.artista AS A
INNER JOIN SpotifyClone.albuns AS AB
ON A.artista_id = AB.artista_id
INNER JOIN SpotifyClone.seguidor AS SEG
ON AB.artista_id = SEG.artista_id
GROUP BY artista, album
ORDER BY pessoas_seguidoras DESC, artista, album;
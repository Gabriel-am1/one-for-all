SELECT COUNT(S.song_id) AS cancoes,
COUNT(DISTINCT ART.artista_id) AS artistas,
COUNT(DISTINCT AB.album_id) AS albuns
FROM SpotifyClone.albuns AS AB
INNER JOIN SpotifyClone.artista AS ART
ON AB.artista_id = ART.artista_id
INNER JOIN SpotifyClone.songs AS S
ON AB.album_id = S.album_id;
SELECT A.artista_nome AS artista,
AB.album_nome AS album
FROM SpotifyClone.artista AS A
INNER JOIN SpotifyClone.albuns AS AB
ON A.artista_id = AB.artista_id AND A.artista_nome = 'Elis Regina';
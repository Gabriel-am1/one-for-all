DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE planos(
    plano_id INT AUTO_INCREMENT PRIMARY_KEY,
    plano_nome VARCHAR(255) NOT NULL,
    plano_valor DECIMAL(5,2) NOT NULL
) engine = InnoDB;


CREATE TABLE users(
    user_id INT AUTO_INCREMENT PRIMARY_KEY,
    user_nome VARCHAR(255) NOT NULL,
    user_idade INT NOT NULL
) engine = InnoDB;


CREATE TABLE users_plans(
    user_id INT NOT NULL,
    plano_id INT NOT NULL,
    data_assinatura DATETIME NOT NULL,
    FOREIGN KEY(plano_id) REFERENCES planos(plano_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    CONSTRAINT PRIMARY KEY(plano_id, user_id)
) engine = InnoDB;

CREATE TABLE artista(
    artista_id INT AUTO_INCREMENT PRIMARY_KEY,
    artista_nome VARCHAR(225) NOT NULL
) engine = InnoDB;

CREATE TABLE albuns(
    album_id INT AUTO_INCREMENT PRIMARY_KEY,
    album_nome VARCHAR(255) NOT NULL,
    ano_lancamento YEAR NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY(artista_id) REFERENCES artista(artista_id)
) engine =  InnoDB;

CREATE TABLE songs(
    song_id INT AUTO_INCREMENT PRIMARY_KEY,
    song_nome VARCHAR(255) NOT NULL,
    duration INT UNSIGNED NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY(album_id) REFERENCES albuns(album_id)
) engine = InnoDB;


CREATE TABLE seguidor(
    user_id INT NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
) engine = InnoDB;

CREATE TABLE historico_reproducao(
    Song_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (song_id) REFERENCES songs(song_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
) engine = InnoDB;






INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
VALUES
  ('exemplo de dados 1', 'exemplo de dados A'),
  ('exemplo de dados 2', 'exemplo de dados B'),
  ('exemplo de dados 3', 'exemplo de dados C');
INSERT INTO SpotifyClone.tabela2 (coluna1, coluna2)
VALUES
  ('exemplo de dados 1', 'exemplo de dados X'),
  ('exemplo de dados 2', 'exemplo de dados Y');

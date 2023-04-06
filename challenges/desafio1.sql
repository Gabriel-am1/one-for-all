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
    user_idade INT NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
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
    data_reproducao DATETIME NOT NULL,
    FOREIGN KEY (song_id) REFERENCES songs(song_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
) engine = InnoDB;

INSERT INTO planos (plano_nome, plano_valor)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);


INSERT INTO users (user_nome, user_idade) 
VALUES
	('Barbara Liskov', '82', 1),
	('Robert Cecil Martin', '58', 1),
	('Ada Lovelace', '37', 2),
	('Martin Fowler', '46', 2),
	('Sandi Metz', '58', 2),
	('Paulo Freire', '19', 3),
	('Bell Hooks', '26', 3),
	('Christopher Alexander', '85', 4),
	('Judith Butler', '45', 4),
	('Jorge Amado', '58', 4);



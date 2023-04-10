DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE planos(
    plano_id INT AUTO_INCREMENT PRIMARY KEY,
    plano_nome VARCHAR(255) NOT NULL,
    plano_valor DECIMAL(5,2) NOT NULL
) engine = InnoDB;


CREATE TABLE users(
    user_id INT AUTO_INCREMENT PRIMARY KEY,
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
    artista_id INT AUTO_INCREMENT PRIMARY KEY,
    artista_nome VARCHAR(225) NOT NULL
) engine = InnoDB;

CREATE TABLE albuns(
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    album_nome VARCHAR(255) NOT NULL,
    ano_lancamento YEAR NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY(artista_id) REFERENCES artista(artista_id)
) engine =  InnoDB;

CREATE TABLE songs(
    song_id INT AUTO_INCREMENT PRIMARY KEY,
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


INSERT INTO users (user_nome, user_idade,plano_id) 
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


INSERT INTO users_plans (user_id, plano_id, data_assinatura) 
VALUES
	('1', '1', '2019-10-20'),
	('2', '1', '2017-01-06'),
	('3', '2', '2017-12-30'),
	('4', '2', '2017-01-17'),
	('5', '2', '2018-04-29'),
	('6', '3', '2018-02-14'),
	('7', '3', '2018-01-05'),
	('8', '4', '2019-06-05'),
	('9', '4', '2020-05-13'),
	('10', '4', '2017-02-17');


INSERT INTO artista (artista_nome) 
VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');


INSERT INTO albuns (album_nome, artista_id, ano_lancamento) 
VALUES
	('Renaissance', '1', '2022'),
	('Jazz', '2', '1978'),
	('Hot Space', '2', '1982'),
	('Falso Brilhante', '3', '1998'),
	('Vento de Maio', '3', '2001'),
	('QVVJFA?', '4', '2003'),
	('Somewhere Far Beyond', '5', '2007'),
	('I Put A Spell On You', '6', '2012');


INSERT INTO songs (album_id, song_nome, duration) 
VALUES
	('1', 'ALIEN SUPERSTAR', '116'),
	('1', `'VIRGO'S GROOVE'`, '369'),
	('1', 'BREAK MY SOUL', '279'),
	('2', `'Don't Stop Me Now'`, '203'),
	('3', 'Under Pressure', '152'),
	('4', 'Como Nossos Pais', '105'),
	('5', 'O Medo de Amar é o Medo de Ser Livre', '207'),
	('6', 'Samba em Paris', '267'),
	('7', `'The Bard's Song'`, '244'),
	('8', 'Feeling Good', '100');


INSERT INTO seguidor (user_id, artista_id) VALUES
	('1', '1'),
	('1', '2'),
	('1', '3'),
	('2', '1'),
	('2', '3'),
	('3', '2'),
	('4', '4'),
	('5', '5'),
	('5', '6'),
	('6', '6'),
	('6', '1'),
	('7', '6'),
	('9', '3'),
	('10', '2');


INSERT INTO historico_reproducao (user_id, song_id, data_reproducao) VALUES
	('1', '4', '2022-02-28 10:45:55'),
	('1', '1', '2020-05-02 05:30:35'),
	('1', '6', '2020-03-06 11:22:33'),
	('2', '6', '2022-08-05 08:05:17'),
	('2', '3', '2020-01-02 07:40:33'),
	('3', '6', '2020-11-13 16:55:13'),
	('3', '1', '2020-12-05 18:38:30'),
	('4', '4', '2021-08-15 17:10:10'),
	('5', '4', '2022-01-09 01:44:33'),
	('5', '2', '2020-08-06 15:23:43'),
	('6', '3', '2017-01-24 00:31:17'),
	('6', '1', '2017-10-12 12:35:20'),
	('7', '2', '2011-12-15 22:30:49'),
	('8', '2', '2012-03-17 14:56:41'),
	('9', '5', '2022-02-24 21:14:22'),
	('10', '1','2015-12-13 08:30:22');









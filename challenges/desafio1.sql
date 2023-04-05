DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE planos(
    plano_id INT AUTO_INCREMENT PRIMARY_KEY,
    plano_nome VARCHAR(255) NOT NULL,
    plano_valor DECIMAL(5,2) NOT NULL,
) engine = InnoDB;


CREATE TABLE users(
    user_id INT AUTO_INCREMENT PRIMARY_KEY,
    user_nome VARCHAR(255) NOT NULL,
    user_idade INT NOT NULL,
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

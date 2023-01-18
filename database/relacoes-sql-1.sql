-- Active: 1674045229274@@127.0.0.1@3306


-- Práticas
CREATE TABLE users (
  id TEXT PRIMARY KEY UNIQUE NOT NULL,
  name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL
);

CREATE TABLE phones (
  id TEXT PRIMARY KEY UNIQUE NOT NULL,
  phone_number TEXT UNIQUE NOT NULL,
  owner_id TEXT NOT NULL,
  FOREIGN KEY (owner_id) REFERENCES users (id)
);

INSERT INTO users (id, name, email, password)
VALUES 
      ("u001", "lais", "lais@email.com", "lais123"),
      ("u002", "joao", "joao@email.com", "joao123");

INSERT INTO phones (id, phone_number, owner_id)
VALUES 
      ("p001","5515899999", "u001"),
      ("p002","5500454684", "u001"),
      ("p003","5587454684", "u002");

INSERT INTO phones (id, phone_number, owner_id)
VALUES 
      ("p004","5515899999", "u003"); -- erro, pois u003 nao existe

SELECT * FROM users;

SELECT * FROM users --tabela A
INNER JOIN phones --tabela B
ON phones.owner_id = users.id;

-- pratica 3
CREATE TABLE licenses (
  id TEXT PRIMARY KEY UNIQUE NOT NULL,
  register_number TEXT UNIQUE NOT NULL,
  category TEXT NOT NULL
);

CREATE TABLE drivers (
  id TEXT PRIMARY KEY UNIQUE NOT NULL,
  name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  license_id TEXT UNIQUE NOT NULL,
  FOREIGN KEY (license_id) REFERENCES licenses (id)
);

INSERT INTO licenses (id, register_number, category)
VALUES
      ("l001", "11111111111", "A"),
      ("l002", "22222222222", "AB");

INSERT INTO drivers (id, name, email, password, license_id)
VALUES
      ("d001", "carlos", "carlos@email.com", "carlos123", "l001"),
      ("d002", "maria", "maria@email.com", "maria321", "l002");

SELECT * FROM licenses
INNER JOIN drivers
ON drivers.license_id = licenses.id


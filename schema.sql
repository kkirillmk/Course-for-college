CREATE DATABASE dns_auction
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;

USE dns_auction;

CREATE TABLE categories
(
    id             INT AUTO_INCREMENT PRIMARY KEY,
    name           VARCHAR(128) NOT NULL,
    character_code VARCHAR(24)
);
CREATE TABLE lots
(
    id             INT AUTO_INCREMENT PRIMARY KEY,
    id_category    INT,
    id_author      INT,
    id_winner      INT,
    date_created   DATE,
    name           VARCHAR(128) NOT NULL,
    description    TEXT,
    img            VARCHAR(256) UNIQUE,
    starting_price INT,
    date_end       DATE,
    bet_step       INT
);
CREATE TABLE bets
(
    id           INT AUTO_INCREMENT PRIMARY KEY,
    id_user      INT,
    id_lot       INT,
    date_placing DATETIME,
    bet_sum      INT
);
CREATE TABLE users
(
    id                INT AUTO_INCREMENT PRIMARY KEY,
    date_registration DATE,
    email             VARCHAR(128) UNIQUE,
    name              VARCHAR(128) NOT NULL,
    password          VARCHAR(128) NOT NULL,
    contacts          TEXT
);
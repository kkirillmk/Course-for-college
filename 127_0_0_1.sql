-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 10 2020 г., 06:14
-- Версия сервера: 5.7.25-log
-- Версия PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `dns_auction`
--
CREATE DATABASE IF NOT EXISTS `dns_auction` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dns_auction`;

-- --------------------------------------------------------

--
-- Структура таблицы `bets`
--

CREATE TABLE `bets` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_lot` int(11) DEFAULT NULL,
  `date_placing` datetime DEFAULT NULL,
  `bet_sum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bets`
--

INSERT INTO `bets` (`id`, `id_user`, `id_lot`, `date_placing`, `bet_sum`) VALUES
(1, 2, 2, '2020-01-16 17:15:43', 5000),
(2, 3, 2, '2020-03-10 09:56:07', 6000);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `character_code` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `character_code`) VALUES
(1, 'Комплектующие, компьютеры и ноутбуки', 'compnout'),
(2, 'Смартфоны, планшеты и фототехника', 'telephoto'),
(3, 'ТВ и Развлечения', 'tvenj');

-- --------------------------------------------------------

--
-- Структура таблицы `lots`
--

CREATE TABLE `lots` (
  `id` int(11) NOT NULL,
  `id_category` int(11) DEFAULT NULL,
  `id_author` int(11) DEFAULT NULL,
  `id_winner` int(11) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `description` text,
  `img` varchar(256) DEFAULT NULL,
  `starting_price` int(11) DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `bet_step` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `lots`
--

INSERT INTO `lots` (`id`, `id_category`, `id_author`, `id_winner`, `date_created`, `name`, `description`, `img`, `starting_price`, `date_end`, `bet_step`) VALUES
(2, 1, 1, NULL, '2019-12-26', 'Видеокарта MSI GeForce GTX 1050 OC [GTX 1050 2G OC]', 'Видеокарта MSI GeForce GTX 1050 OC адаптирована под особенности игрового компьютера, поэтому отличается энергоэффективностью в виду компактности, производительностью. Для подключения модель использует PCI-E 3.0', 'uploads/5e041e552d0c5.jpeg', 4000, '2020-05-01', 200);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `date_registration` date DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `contacts` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `date_registration`, `email`, `name`, `password`, `contacts`) VALUES
(1, '2019-12-24', 'q@q.q', 'q', '$2y$10$VRIJ0l3amdrOC5OwDd8Lc.mx5cH/pg/7bw86ALc/XLF4t7pUARpQG', 'q'),
(2, '2019-12-24', 'a@a.a', 'a', '$2y$10$97m0Hdoob5eUwO7s6.N6ZuVgDM6I7Sv6BDpgeQfagGB9dPGGDmtaW', 'a'),
(3, '2020-01-16', 's@s.s', 's', '$2y$10$hQzU.02XErmhiE4QSh192.NG6Q7pNkGI7cWQSjNSlHhyeQWbDdF/C', 's');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bets`
--
ALTER TABLE `bets`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `lots`
--
ALTER TABLE `lots`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `img` (`img`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bets`
--
ALTER TABLE `bets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `lots`
--
ALTER TABLE `lots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 09 2020 г., 06:36
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
(2, 3, 2, '2020-03-10 09:56:07', 6000),
(3, 3, 4, '2020-05-01 13:42:56', 5000);

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
(3, 'ТВ и Развлечения', 'tvenj'),
(4, 'Бытовая техника', 'bittech'),
(5, 'Офис и сеть', 'ofnet'),
(6, 'Аксессуары', 'accessor'),
(7, 'Автотовары', 'autoit'),
(8, 'Инструменты', 'tools');

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
(2, 1, 1, NULL, '2019-12-26', 'Видеокарта MSI GeForce GTX 1050 OC [GTX 1050 2G OC]', 'Видеокарта MSI GeForce GTX 1050 OC адаптирована под особенности игрового компьютера, поэтому отличается энергоэффективностью в виду компактности, производительностью. Для подключения модель использует PCI-E 3.0', 'uploads/5e041e552d0c5.jpeg', 4000, '2020-07-01', 200),
(3, 1, 1, NULL, '2020-05-01', '15.6\" Ноутбук ASUS F570ZD-DM102 черный', 'Ноутбук ASUS F570ZD-DM102 в классическом черном корпусе относится к производительным геймерским устройствам. В его основе – четырехъядерный процессор AMD Ryzen с архитектурой Zen, видеокарты GeForce GTX 1050 и Radeon RX Vega 8, а также оперативная память размером 8 ГБ. С таким функционалом «влет» можно проходить даже игры на «высоких» настройках.', 'uploads/5eabbc2f1eb15.jpeg', 10000, '2020-11-10', 200),
(4, 2, 1, NULL, '2020-05-01', '5\" Смартфон DEXP Senior 8 ГБ серый', 'Смартфон DEXP Senior продуман до мельчайших деталей. Так, приятное покрытие корпуса soft touch не даст устройству выскользнуть из рук. Благодаря специальному программному обеспечению с увеличенным шрифтом и крупными иконками приложений обеспечивается максимум удобства при использовании смартфона людьми со слабым зрением. Подставка-зарядная станция избавит вас от необходимости мучиться со шнурами и неудобными розетками. Мобильный аппарат оснащен инфракрасным портом, который вы можете использовать в качестве пульта для бытовой техники, скачав приложение по типу Mi Remote.', 'uploads/5eabbfed49944.jpeg', 2000, '2020-11-02', 100),
(5, 3, 1, NULL, '2020-05-01', '75\" (189 см) Телевизор LED Samsung QE75Q900RB черный', 'Прочувствуйте каждую сцену на экране Samsung QE75Q900RB с потрясающе точной цветопередачей, максимальной детализацией и непревзойденной глубиной изображения. Никогда еще происходящее на экране не было настолько реалистичным. Телевизор обеспечивает реалистичное трёхмерное изображение с глубокой перспективой. Ощущение объёма усиливается благодаря повышению резкости и точной проработке текстур. Изображение на экране телевизора Samsung QE75Q900RB настолько четкое, что вы не заметите пиксельную структуру даже на минимальном расстоянии от ТВ. Просто наслаждайтесь погружением в происходящее на экране. Больше деталей и потрясающая контрастность даже в самых динамичных сценах благодаря интеллектуальной регулировке яркости каждого фрагмента изображения. ', 'uploads/5eabc086b4fd5.jpeg', 350000, '2020-09-11', 20000),
(6, 5, 1, NULL, '2020-05-01', '3D принтер Wanhao Duplicator i3 mini', '3D-принтер Wanhao Duplicator i3 mini представляет собой компактное устройство, которое подходит использования в домашних условиях. Основное преимущество принтера – вы сможете по достоинству оценить его функционал сразу после распаковки, поскольку он идет практически в собранном виде.\r\nСкорость построения различных объектов составляет 70 мм/с. Wanhao Duplicator i3 mini совместим с различными операционными системами – Windows, MAC, Linux. В комплекте вы найдете стартовый набор пластика, а также шпатель для последующего снятия готовых экземпляров.', 'uploads/5eabc105498a7.jpeg', 18000, '2020-08-10', 1000),
(7, 7, 3, NULL, '2020-05-01', 'Автопроигрыватель MYSTERY MCD-989BC', 'Автопроигрыватель MYSTERY MCD-989BC имеет стильный дизайн и качественное изготовление. Слушать любимые сердцу композиции можно как с CD-диска, так и с мобильных устройств, подключаемых через порт USB. Изюминка этой модели – поддержка SD-карт памяти. Находиться в курсе событий позволит встроенный тюнер диапазонов: FM, СВ и УКВ.\r\nКачественный и объемный звук обеспечивает встроенный 4-канальный усилитель мощностью пятьдесят ватт на каждый канал. Кроме этого, MYSTERY MCD-989BC имеет эквалайзер для настройки желаемого тембра звука. Есть возможность совершать звонки в режиме \"Hands Free\". Важным фактором является наличие у данного ресивера пульта ДУ. Типоразмер проигрывателя – 2 DIN.', 'uploads/5eabc1e34c08b.jpeg', 3000, '2020-07-20', 100),
(8, 3, 3, NULL, '2020-05-01', 'test', 'test', 'uploads/5eabc2212322e.jpeg', 9999999, '2020-09-09', 9999);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `lots`
--
ALTER TABLE `lots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

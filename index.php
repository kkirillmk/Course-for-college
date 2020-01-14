<?php
require_once "helpers.php";
require_once "init.php";

$sql = "SELECT `lots`.`id`, `lots`.`name`, `starting_price`, `img`,
               MAX(`bets`.`bet_sum`) AS current_price,
               cats.`name`  AS category, `date_end`, 
               `users`.`name` AS name_author
        FROM `lots`
            LEFT JOIN `bets` 
                ON `bets`.`id_lot` = `lots`.`id`
            JOIN `categories` cats 
                ON cats.`id` = `lots`.`id_category`
            JOIN `users`
                ON `lots`.`id_author` = `users`.`id`

            WHERE `lots`.`date_end` > NOW()
            GROUP BY `lots`.`id` ORDER BY `lots`.`id` DESC";
$lots = sqlToArray($sql_connect, $sql);

$main_content = includeTemplate("main.php", [
    "lots" => $lots
]);
echo includeTemplate("layout.php", [
    "main_content" => $main_content,
]);

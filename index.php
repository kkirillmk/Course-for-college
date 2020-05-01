<?php
require_once "helpers.php";
require_once "init.php";

$cur_page = $_GET["page"] ?? 1;
$cur_page = mysqli_real_escape_string($sql_connect, $cur_page);
$page_items = 6;

$sql = "SELECT COUNT(`lots`.`id`) as cnt 
        FROM `lots`
            JOIN `categories`
                ON `categories`.`id` = `lots`.`id_category`
            WHERE `lots`.`date_end`";
$result = mysqli_query($sql_connect, $sql);
$items_count = mysqli_fetch_assoc($result)['cnt'];

$pages_count = ceil($items_count / $page_items);
$offset = ($cur_page - 1) * $page_items;
$pages = range(1, $pages_count);

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
            GROUP BY `lots`.`id` 
            ORDER BY `lots`.`id` DESC LIMIT {$page_items} OFFSET {$offset}";
$lots = sqlToArray($sql_connect, $sql);

$main_content = includeTemplate("main.php", [
    "lots" => $lots,
    "pages_count" => $pages_count,
    "pages" => $pages,
    "cur_page" => $cur_page
]);
echo includeTemplate("layout.php", [
    "main_content" => $main_content,
]);

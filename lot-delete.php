<?php
require_once "helpers.php";
require_once "init.php";

$id_lot = shieldedDataEntry($sql_connect, $_GET["id"]);
if (empty($id_lot)) {
    echo "Ошибка получения параметра запроса";
    exit;
}

$sql = "SELECT  `lots`.`id`, `id_author`, `date_end`
            FROM `lots`
                JOIN `users`
                    ON `lots`.`id_author` = `users`.`id`
            WHERE `lots`.`id` = '$id_lot'";
$lots = sqlToArray($sql_connect, $sql);
$categories = getCategories($sql_connect);

$lots_id_list = [];
foreach ($lots as $lot) {
    $lots_id_list[] = $lot["id"];
}
if (!in_array($id_lot, $lots_id_list)) {
    http_response_code(404);
    exit;
}

$id_user = $_SESSION["user"]["id"] ?? "";
if ($_SERVER["REQUEST_METHOD"] === "POST"
    && $lots[0]["id_author"] === $_SESSION["user"]["id"]
    && strtotime($lots[0]["date_end"]) > time()
    && $_SESSION) {


    $sql = "DELETE FROM lots WHERE `id` = $id_lot";
    if (!mysqli_query($sql_connect, $sql)) {
        echo mysqli_error($sql_connect);
        exit();
    }

    header("Location: /");
} else {
    http_response_code(403);
    exit;
}
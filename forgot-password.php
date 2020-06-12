<?php
require_once "helpers.php";
require_once "init.php";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    header("Location: /login.php");
}

$main_content = includeTemplate("forgot-password.php", []);
echo includeTemplate("layout.php", [
    "main_content" => $main_content,
]);
<?php
require_once "helpers.php";
require_once "init.php";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $form = filter_input_array(INPUT_POST, [
        "email" => FILTER_VALIDATE_EMAIL,
        "password" => FILTER_DEFAULT
    ], true
    );
    $rules = [
        "email" => function ($value) {
            return maxLength127($value);
        },
        "password" => function ($value) {
            return maxLength127($value);
        }
    ];
    foreach ($form as $key => $value) {
        if (isset($rules[$key])) {
            $rule = $rules[$key];
            $errors[$key] = $rule($value);
        }

        if (empty($value)) {
            $errors[$key] = "Поле " . htmlspecialchars($key) . " надо заполнить";
        }
    }
    if ($form["email"] === false) {
        $errors[] = "Введён некорректный email";
    }

    $email = mysqli_real_escape_string($sql_connect, $form["email"]);
    $sql = getUserByEmail($email);
    $res = mysqli_query($sql_connect, $sql);

    $user = $res ? mysqli_fetch_array($res, MYSQLI_ASSOC) : null;

    if (isset($user)) {
        if (password_verify($form["password"], $user["password"])) {
            $_SESSION["user"] = $user;
        } else {
            $errors["password"] = "Неверный пароль";
        }
    } else {
        $errors["email"] = "Такой пользователь не найден";
    }
    $errors = array_filter($errors);
    if (empty($errors)) {
        header("Location: /");
        exit();
    }

    $main_content = includeTemplate("login.php", [
        "form" => $form,
        "errors" => $errors
    ]);
} else {
    $main_content = includeTemplate("login.php", []);

    if (isset($_SESSION["user"])) {
        header("Location: /");
        exit();
    }
}

echo includeTemplate("layout.php", [
    "main_content" => $main_content
]);

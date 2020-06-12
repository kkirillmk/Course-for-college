<?php $classname = empty($errors) ? "" : "form--invalid"; ?>
<form class="form container <?= $classname; ?>" action="../login.php" method="post"> <!-- form--invalid -->
    <h2>Вход</h2>
    <?php $classname = isset($errors["email"]) ? "form__item--invalid" : ""; ?>
    <div class="form__item <?= $classname; ?>"> <!-- form__item--invalid -->
        <label for="email">E-mail <sup>*</sup></label>
        <input id="email" type="text" name="email" placeholder="Введите e-mail"
               value="<?= getPostVal("email") ?>">
        <span class="form__error">Введите e-mail</span>
    </div>
    <?php $classname = isset($errors["password"]) ? "form__item--invalid" : ""; ?>
    <div class="form__item form__item--last <?= $classname; ?>">
        <label for="password">Пароль <sup>*</sup></label>
        <input id="password" type="password" name="password" placeholder="Введите пароль"
               value="<?= getPostVal("password") ?>">
        <span class="form__error">Введите пароль</span>
    </div>
    <a href="../forgot-password.php" class="text-link">Забыли пароль?</a>
    <br>
    <br>
    <button type="submit" class="button">Войти</button>
    <br>
    <br>
    <span class="form__error form__error--bottom">Пожалуйста, исправьте ошибки в форме.</span>
    <ul>
        <?php if (!empty($errors)):
            foreach ($errors as $val): ?>
                <li><strong><?= $val; ?></strong></li>
            <?php endforeach; endif; ?>
    </ul>
</form>

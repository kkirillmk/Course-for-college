<?php $classname = empty($errors) ? "" : "form--invalid"; ?>
<form class="form container <?= $classname; ?>" action="../sign-up.php" method="post" autocomplete="off"> <!-- form
    --invalid -->
    <h2>Регистрация нового аккаунта</h2>
    <?php $classname = isset($errors["email"]) ? "form__item--invalid" : ""; ?>
    <div class="form__item <?= $classname; ?>"> <!-- form__item--invalid -->
        <label for="email">E-mail <sup>*</sup></label>
        <input id="email" type="text" name="email" placeholder="Введите e-mail" value="<?= getPostVal("email") ?>" required>
        <span class="form__error">Введите e-mail</span>
    </div>
    <?php $classname = isset($errors["password"]) ? "form__item--invalid" : ""; ?>
    <div class="form__item <?= $classname; ?>">
        <label for="password">Пароль <sup>*</sup></label>
        <input id="password" type="password" name="password" placeholder="Введите пароль" value="<?= getPostVal("password") ?>" required>
        <span class="form__error">Введите пароль</span>
    </div>
    <?php $classname = isset($errors["name"]) ? "form__item--invalid" : ""; ?>
    <div class="form__item <?= $classname; ?>">
        <label for="name">Имя <sup>*</sup></label>
        <input id="name" type="text" name="name" placeholder="Введите имя" value="<?= getPostVal("name") ?>" required>
        <span class="form__error">Введите имя</span>
    </div>
    <?php $classname = isset($errors["message"]) ? "form__item--invalid" : ""; ?>
    <div class="form__item <?= $classname; ?>">
        <label for="message">Контактные данные <sup>*</sup></label>
        <textarea id="message" name="message" placeholder="Напишите как с вами связаться" required><?= getPostVal("message") ?></textarea>
        <span class="form__error">Напишите как с вами связаться</span>
    </div>
    <span class="form__error form__error--bottom">Пожалуйста, исправьте ошибки в форме.</span>
    <ul>
        <?php if (!empty($errors)):
            foreach ($errors as $val): ?>
                <li><strong><?= $val; ?></strong></li>
            <?php endforeach; endif; ?>
    </ul>
    <button type="submit" class="button">Зарегистрироваться</button>
    <a class="text-link" href="#">Уже есть аккаунт</a>
</form>

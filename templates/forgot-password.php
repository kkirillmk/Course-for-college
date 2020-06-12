<form class="form container" action="forgot-password.php" method="post">
    <h2>Восстановление пароля</h2>
    <div class="form__item">
        <label for="email">E-mail <sup>*</sup></label>
        <input id="email" type="text" name="email" placeholder="Введите e-mail">
        <span class="form__error">Введите e-mail</span>
    </div>
    <br>
    <button type="submit" class="button"
            onclick="alert('Инструкция по смене пароля была отправлена на указанный email')">Далее</button>
</form>
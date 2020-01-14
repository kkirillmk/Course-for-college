<section class="lots">
    <div class="lots__header">
        <h2>Открытые лоты</h2>
    </div>
    <ul class="lots__list">
        <?php foreach ($lots as $lot): ?>
            <li class="lots__item lot">
                <div class="lot__image">
                    <img src="<?= $lot["img"]; ?>" width="350" height="260" alt="">
                </div>
                <div class="lot__info">
                    <p class="lot__category">Автор лота: <?= $lot["name_author"]; ?></p>
                    <span class="lot__category"><?= $lot["category"]; ?></span>
                    <h3 class="lot__title">
                        <a class="text-link"
                           href="../lot.php?id=<?= $lot["id"]; ?>"><?= htmlspecialchars($lot["name"]); ?></a>
                    </h3>
                    <div class="lot__state">
                        <div class="lot__rate">
                            <?php if ($lot["current_price"]): ?>
                                <span class="lot__amount">Текущая цена</span>
                                <span class="lot__cost"><?= priceFormat($lot["current_price"]); ?></span>
                            <?php else: ?>
                                <span class="lot__amount">Стартовая цена</span>
                                <span class="lot__cost"><?= priceFormat($lot["starting_price"]); ?></span>
                            <?php endif; ?>
                        </div>
                        <div class="lot__timer timer
                                    <?php if (strpos((dateEndOfLot($lot["date_end"])), "00:") === 0): ?>
                                    timer--finishing
                                    <?php endif; ?>">
                            <?= dateEndOfLot($lot["date_end"]); ?>
                        </div>
                    </div>
                </div>
            </li>
        <?php endforeach; ?>
        <li class="lots__item lot">
            <div class="lot__image">
                <img src="../img/lot1.jpg" width="350" height="260" alt="Сноуборд">
            </div>
            <div class="lot__info">
                <p class="lot__category">Автор лота: qqq</p>
                <span class="lot__category">Комплектующие, компьютеры и ноутбуки</span>
                <h3 class="lot__title"><a class="text-link" href="lot.html">15.6" Ноутбук ASUS F570ZD-DM102 черный</a></h3>
                <div class="lot__state">
                    <div class="lot__rate">
                        <span class="lot__amount">Стартовая цена</span>
                        <span class="lot__cost">15 999<b class="rub">р</b></span>
                    </div>
                    <div class="lot__timer timer">
                        16:54
                    </div>
                </div>
            </div>
        </li>
        <li class="lots__item lot">
            <div class="lot__image">
                <img src="../img/lot2.jpg" width="350" height="260" alt="Сноуборд">
            </div>
            <div class="lot__info">
                <p class="lot__category">Автор лота: qqq</p>
                <span class="lot__category">Смартфоны, планшеты и фототехника</span>
                <h3 class="lot__title"><a class="text-link" href="lot.html">5" Смартфон DEXP Senior 8 ГБ серый</a></h3>
                <div class="lot__state">
                    <div class="lot__rate">
                        <span class="lot__amount">12 ставок</span>
                        <span class="lot__cost">1 500<b class="rub">р</b></span>
                    </div>
                    <div class="lot__timer timer timer--finishing">
                        00:54
                    </div>
                </div>
            </div>
        </li>
        <li class="lots__item lot">
            <div class="lot__image">
                <img src="../img/lot3.jpg" width="350" height="260" alt="Крепления">
            </div>
            <div class="lot__info">
                <p class="lot__category">Автор лота: qqq</p>
                <span class="lot__category">ТВ и Развлечения </span>
                <h3 class="lot__title"><a class="text-link" href="lot.html">75" (189 см) Телевизор LED Samsung QE75Q900RB черный</a></h3>
                <div class="lot__state">
                    <div class="lot__rate">
                        <span class="lot__amount">7 ставок</span>
                        <span class="lot__cost">400 000<b class="rub">р</b></span>
                    </div>
                    <div class="lot__timer timer">
                        10:54
                    </div>
                </div>
            </div>
        </li>
        <li class="lots__item lot">
            <div class="lot__image">
                <img src="../img/lot4.jpg" width="350" height="260" alt="Ботинки">
            </div>
            <div class="lot__info">
                <p class="lot__category">Автор лота: qqq</p>
                <span class="lot__category">Офис и сеть</span>
                <h3 class="lot__title"><a class="text-link" href="lot.html">3D принтер Wanhao Duplicator i3 mini</a></h3>
                <div class="lot__state">
                    <div class="lot__rate">
                        <span class="lot__amount">12 ставок</span>
                        <span class="lot__cost">10 999<b class="rub">р</b></span>
                    </div>
                    <div class="lot__timer timer timer--finishing">
                        00:12
                    </div>
                </div>
            </div>
        </li>
        <li class="lots__item lot">
            <div class="lot__image">
                <img src="../img/lot5.jpg" width="350" height="260" alt="Куртка">
            </div>
            <div class="lot__info">
                <p class="lot__category">Автор лота: qqq</p>
                <span class="lot__category">Автотовары</span>
                <h3 class="lot__title"><a class="text-link" href="lot.html">Автопроигрыватель MYSTERY MCD-989BC</a></h3>
                <div class="lot__state">
                    <div class="lot__rate">
                        <span class="lot__amount">12 ставок</span>
                        <span class="lot__cost">4 999<b class="rub">р</b></span>
                    </div>
                    <div class="lot__timer timer">
                        01:12
                    </div>
                </div>
            </div>
        </li>
        <li class="lots__item lot">
            <div class="lot__image">
                <img src="../img/lot6.jpg" width="350" height="260" alt="Маска">
            </div>
            <div class="lot__info">
                <p class="lot__category">Автор лота: qqq</p>
                <span class="lot__category">Комплектующие, компьютеры и ноутбуки</span>
                <h3 class="lot__title"><a class="text-link" href="lot.html">Видеокарта MSI GeForce GTX 1050 OC [GTX 1050 2G OC]</a></h3>
                <div class="lot__state">
                    <div class="lot__rate">
                        <span class="lot__amount">Стартовая цена</span>
                        <span class="lot__cost">3 500<b class="rub">р</b></span>
                    </div>
                    <div class="lot__timer timer">
                        07:13
                    </div>
                </div>
            </div>
        </li>
    </ul>
</section>
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
    </ul>
</section>
<?php if ($pages_count > 1): ?>
    <ul class="pagination-list">
        <li class="pagination-item pagination-item-prev">
            <a href="/?page=<?= numberOfPreviousPage($cur_page); ?>">Назад</a>
        </li>
        <?php foreach ($pages as $page): ?>
            <li class="pagination-item <?php if ($page == $cur_page): ?>pagination-item-active<?php endif; ?>">
                <a href="/?&page=<?= $page; ?>">
                    <?= $page; ?></a>
            </li>
        <?php endforeach; ?>
        <li class="pagination-item pagination-item-next">
            <a href="/?page=<?= numberOfNextPage($cur_page, $pages_count); ?>">Вперед</a>
        </li>
    </ul>
<?php endif; ?>
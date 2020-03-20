 <section class="promo">
        <h2 class="promo__title">Нужен стафф для катки?</h2>
        <p class="promo__text">На нашем интернет-аукционе ты найдёшь самое эксклюзивное сноубордическое и горнолыжное снаряжение.</p>
        <ul class="promo__list">
            <? foreach ($categories as $val):?>
                <li class="promo__item promo__item--boards">
                    <a class="promo__link" href="pages/all-lots.html"><?=$val?></a>
                </li>
            <?endforeach?>
        </ul>
    </section>
    <section class="lots">
        <div class="lots__header">
            <h2>Открытые лоты</h2>
        </div>
        <ul class="lots__list">
            <?foreach ($ad as $k => $val):?>
                <li class="lots__item lot">
                    <div class="lot__image">
                        <img src="img/lot-<?=($k + 1)?>.jpg" width="350" height="260" alt="">
                    </div>
                    <div class="lot__info">
                        <span class="lot__category"><?=$categories[$val["categories"]]?></span>
                        <h3 class="lot__title"><a class="text-link" href="pages/lot.html"><?=$val["name"]?></a></h3>
                        <div class="lot__state">
                            <div class="lot__rate">
                                <span class="lot__amount">Стартовая цена</span>
                                <span class="lot__cost"><?=sum_format($val["price"],true)?><b class="rub">р</b></span>
                            </div>
                            <div class="lot__timer timer">
                                12:23
                            </div>
                        </div>
                    </div>
                </li>
            <?endforeach?>
        </ul>
    </section>

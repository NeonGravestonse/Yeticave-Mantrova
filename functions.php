<?php
$is_auth = rand(0, 1);

$user_name = 'Mantrova'; // укажите здесь ваше имя
$categories = [
    'Boards' => 'Доски и лыжи',
    'Bracing' => 'Крепления',
    'Boots' => "Ботинки",
    'Clothes' => "Одежда",
    'Tools' => 'Инструменты',
    'Other' => 'Другое'
];

$ad =[
    [
        'name' => '2014 Rossignol District Snowboard',
        'categories' => 'boards',
        'price' => 10999,
        'url' => 'img/lot-1.jpg'
    ],
    [
        'name' => 'DC Ply Mens 2016/2017 Snowboard',
        'categories' => 'boards',
        'price' => 159999,
        'url' => 'img/lot-2.jpg'
    ],
    [
        'name' => 'Крепления Union Contact Pro 2015 года размер L/XL',
        'categories' => 'bracing',
        'price' => 8000,
        'url' => 'img/lot-3.jpg'
    ],
    [
        'name' => 'Ботинки для сноуборда DC Mutiny Charocal',
        'categories' => 'boots',
        'price' => 10999,
        'url' => 'img/lot-4.jpg'
    ],
    [
        'name' => 'Куртка для сноуборда DC Mutiny Charocal',
        'categories' => 'clothes',
        'price' => 7500,
        'url' => 'img/lot-5.jpg'
    ],
    [
        'name' => 'Маска Oakley Canopy',
        'categories' => 'other',
        'price' => 5400,
        'url' => 'img/lot-6.jpg'
    ],
];
function sum_format($number, $withRubleElem = true){
    $number = ceil($number);

    if ($number >= 1000) {
        $price = number_format( $number ,  $decimals = 0 ,  $dec_point = "." ,  $thousands_sep = " ");
    }

    else {
        $price = $number;
    }

    if ($withRubleElem){
        return $price."<b class=\"rub\">р</b>";
    }
    else{
        return $price;
    }
}
function include_template($name, $data) {
    $name = 'templates/' . $name;
    $result = '';
    if (!file_exists($name)) {
        return $result;
    }
    ob_start();
    extract($data);
    require $name;

    $result = ob_get_clean();

    return $result;
}
?>


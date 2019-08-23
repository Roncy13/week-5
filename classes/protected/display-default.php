<?php

require("./simple-class.php");

$simpleClass = new SimpleClass("Hey Pls Change this to a new value");
$simpleClass->diplayNewVar();

$simpleClass->changeVar("Hey Access it");
$simpleClass->diplayNewVar();
?>
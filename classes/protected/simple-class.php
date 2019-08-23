<?php

require("./protected-class.php");

class SimpleClass extends ProtectedClass
{
    function __construct($initalValue = "") {
        $this->changeVar($initalValue);
    }
    
    function diplayNewVar() {
        echo $this->var."<br>";
    }
}
?>
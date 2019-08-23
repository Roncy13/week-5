<?php

class ProtectedClass 
{
    // property declaration
    protected $var = 'a default value';

    // method declaration
    function changeVar($var = "Change me Pls...!") {
        $this->var = $var;
    }
}
?>
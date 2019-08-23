<?php
require("./maintenace-interface.php");

class User Implements Maintenance {
  function construct(){
    parent::__construct();
  }
}

new User();
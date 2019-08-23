<?php
interface Maintenance {
  function create();
  function update();
  function delete();
  function readAll();
  function readByID();
}
 
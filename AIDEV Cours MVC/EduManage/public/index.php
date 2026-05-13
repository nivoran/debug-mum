<?php

session_start();

define('ROOT', dirname(__DIR__));

require ROOT .'/app/core/Database.php';
require ROOT .'/app/core/Model.php';
require ROOT .'/app/core/Controller.php';
require ROOT .'/app/core/Router.php';

$router = new Router();
$router->dispatch();

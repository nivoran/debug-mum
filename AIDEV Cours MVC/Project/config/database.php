<?php
$pdo = new PDO("mysql:host=localhost;dbname=mvc_tasks", "root", "");
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
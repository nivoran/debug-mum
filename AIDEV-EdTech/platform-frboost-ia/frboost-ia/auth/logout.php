<?php

session_start();

// Détruire toutes les variables de session
$_SESSION = [];

// Détruire la session
session_destroy();

// Retour au login
header("Location: login.php");
exit;
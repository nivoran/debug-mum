<?php
/*
------------------------------------------------------
login_process.php

Rôle :
- Vérifie les identifiants de l'utilisateur
- Crée la session
- Met à jour la dernière connexion
- Redirige vers l'application
------------------------------------------------------
*/

session_start();

require_once "../config/database.php";

// Vérifie que le formulaire a bien été envoyé
if ($_SERVER["REQUEST_METHOD"] != "POST") {
    header("Location: login.php");
    exit;
}

// Récupération des données
$email = trim($_POST["email"]);
$password = $_POST["password"];

// Recherche de l'utilisateur
$sql = "SELECT * FROM users WHERE email = ? AND actif = 1";

$stmt = $pdo->prepare($sql);
$stmt->execute([$email]);

$user = $stmt->fetch();

if (!$user) {
    $_SESSION["erreur"] = "Adresse e-mail ou mot de passe incorrect.";
    header("Location: login.php");
    exit;
}

// Vérification du mot de passe
if (!password_verify($password, $user["password"])) {
    $_SESSION["erreur"] = "Adresse e-mail ou mot de passe incorrect.";
    header("Location: login.php");
    exit;
}

// Création de la session
$_SESSION["user_id"] = $user["id"];
$_SESSION["nom"] = $user["nom"];
$_SESSION["prenom"] = $user["prenom"];
$_SESSION["role"] = $user["role"];
$_SESSION["niveau"] = $user["niveau"];

$sql = "UPDATE users
        SET dernier_acces = NOW()
        WHERE id = ?";

$stmt = $pdo->prepare($sql);
$stmt->execute([$user["id"]]);

// Redirection
header("Location: ../index.php");
exit;
<?php

require_once "../frboost-ia/config/database.php";

// =========================
// Paramètres administrateur
// =========================

$nom = "MICHEL";
$prenom = "Nivo";
$email = "admin@frboost.ai";
$motDePasse = "Admin1234";      // À modifier

$role = "admin";
$niveau = "C2";
$actif = 1;

// =========================
// Vérifier si l'admin existe
// =========================

$sql = "SELECT id FROM users WHERE email = ?";

$stmt = $pdo->prepare($sql);
$stmt->execute([$email]);

if ($stmt->fetch()) {
    die("Un administrateur possède déjà cette adresse e-mail.");
}

// =========================
// Création
// =========================

$passwordHash = password_hash($motDePasse, PASSWORD_DEFAULT);

$sql = "INSERT INTO users
(nom, prenom, email, password, role, niveau, actif)
VALUES
(?,?,?,?,?,?,?)";

$stmt = $pdo->prepare($sql);

$stmt->execute([
    $nom,
    $prenom,
    $email,
    $passwordHash,
    $role,
    $niveau,
    $actif
]);

echo "Administrateur créé avec succès.";
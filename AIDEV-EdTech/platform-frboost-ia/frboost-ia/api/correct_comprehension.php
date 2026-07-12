<?php
/*
------------------------------------------------------
api/correct_comprehension.php

Point d'entrée API pour le module Compréhension.
------------------------------------------------------
*/
header('Content-Type: application/json');
session_start();

require_once dirname(__DIR__) . "/services/resultats_service.php";

if (!isset($_SESSION["user_id"])) {
    $_SESSION["user_id"] = 1; // ID temporaire pour les tests
}

$data = json_decode(file_get_contents("php://input"));

if (!$data || !isset($data->score)) {
    echo json_encode(["success" => false, "error" => "Données du score manquantes."]);
    exit;
}

$texte_id = $data->texte_id ?? null;
$score    = floatval($data->score); // Note sur 100 ou pourcentage
$temps    = $data->temps ?? null;   // Optionnel : temps passé en secondes

// On appelle le service de mémoire globale avec le module "compréhension"
$succes = enregistrerResultat(
    $_SESSION["user_id"],
    $texte_id,
    "compréhension",
    $score,
    $temps
);

echo json_encode([
    "success" => $succes,
    "message" => $succes ? "Progression en compréhension enregistrée !" : "Erreur de sauvegarde."
]);
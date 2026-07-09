<?php
/*
------------------------------------------------------
api/corriger_dictee.php

Point d'entrée API pour la correction d'une dictée.
------------------------------------------------------
*/
header('Content-Type: application/json');
session_start();

// Importation de nos briques de services
require_once("../services/dictee_service.php");
require_once("../services/resultats_service.php");

// Simulation d'une session utilisateur si non définie pour les tests
if (!isset($_SESSION["user_id"])) {
    $_SESSION["user_id"] = 1; 
}

$data = json_decode(file_get_contents("php://input"));

if (!$data || !isset($data->correct) || !isset($data->eleve)) {
    echo json_encode(["success" => false, "error" => "Données incomplètes."]);
    exit;
}

// 1. Appel du service de correction linguistique
$analyse = corrigerDictee($data->correct, $data->eleve);

// 2. Appel du service de sauvegarde (La Mémoire de FrBoost AI)
$texte_id = $data->texte_id ?? null;
enregistrerResultat(
    $_SESSION["user_id"],
    $texte_id,
    "dictée",
    $analyse['note']
);

// 3. Envoi de la réponse à l'interface de l'élève
echo json_encode([
    "success" => true,
    "html" => $analyse['html'],
    "note" => $analyse['note']
]);
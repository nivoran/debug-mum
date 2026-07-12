<?php

session_start();

require_once "../services/resultats_service.php";

header("Content-Type: application/json");

if (!isset($_SESSION["user_id"])) {
    http_response_code(401);

    echo json_encode([
        "erreur" => "Utilisateur non connecté"
    ]);

    exit;
}

$historique = obtenirHistorique($_SESSION["user_id"]);

echo json_encode($historique);
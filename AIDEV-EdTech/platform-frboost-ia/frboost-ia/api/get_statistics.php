<?php

session_start();

require_once "../services/resultats_service.php";

header("Content-Type: application/json");

if(!isset($_SESSION["user_id"])){

    http_response_code(401);

    echo json_encode([
        "erreur"=>"Utilisateur non connecté"
    ]);

    exit;
}

echo json_encode(
    obtenirStatistiquesUtilisateur($_SESSION["user_id"])
);
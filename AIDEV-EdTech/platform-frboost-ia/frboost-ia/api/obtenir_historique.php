<?php
/*
------------------------------------------------------
api/obtenir_historique.php

Rôle :
Renvoyer l'historique des exercices de l'utilisateur connecté.
------------------------------------------------------
*/
header('Content-Type: application/json');
session_start();

require_once dirname(__DIR__) . "/services/resultats_service.php";

// Gestion de la session de test
if (!isset($_SESSION["user_id"])) {
    $_SESSION["user_id"] = 1; 
}

try {
    $historique = obtenirHistoriqueUtilisateur($_SESSION["user_id"]);
    
    echo json_encode([
        "success" => true,
        "historique" => $historique
    ]);
} catch (Exception $e) {
    echo json_encode([
        "success" => false,
        "error" => "Impossible de récupérer l'historique : " . $e->getMessage()
    ]);
}
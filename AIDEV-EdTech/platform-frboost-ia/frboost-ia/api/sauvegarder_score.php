<?php
/*
------------------------------------------------------
api/sauvegarder_score.php

Point d'entrée API pour enregistrer un score.
Reçoit les données en POST (JSON) et appelle le service.
------------------------------------------------------
*/

// On sécurise l'accès : cette API ne répond qu'en JSON
header('Content-Type: application/json');

// Démarrage de la session pour récupérer l'utilisateur connecté
session_start();

// Règle d'or : On inclut notre service pur
require_once __DIR__ . "/../services/resultats_service.php";

// Vérification de la session (l'utilisateur est-il connecté ?)
// Pour vos premiers tests, si l'authentification n'est pas finalisée,
// on peut simuler un ID utilisateur temporaire (ex: 1)
$user_id = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : 1; 

// Récupération des données envoyées en JSON par le JavaScript
$input = json_get_contents('php://input'); // à remplacer par file_get_contents dans votre code
$data = json_decode(file_get_contents('php://input'), true);

if (!$data) {
    echo json_encode(['success' => false, 'error' => 'Aucune donnée reçue.']);
    exit;
}

// Extraction et nettoyage élémentaire des variables
$texte_id = isset($data['texte_id']) ? intval($data['texte_id']) : null;
$module   = isset($data['module']) ? trim($data['module']) : 'dictee';
$score    = isset($data['score']) ? floatval($data['score']) : 0;
$temps    = isset($data['temps']) ? intval($data['temps']) : null;

try {
    // Appel de notre brique de service
    $succes = enregistrerResultat($user_id, $texte_id, $module, $score, $temps);
    
    if ($succes) {
        echo json_encode(['success' => true, 'message' => 'FrBoost AI a enregistré votre progression !']);
    } else {
        echo json_encode(['success' => false, 'error' => 'Erreur lors de l\'enregistrement en base de données.']);
    }
} catch (Exception $e) {
    echo json_encode(['success' => false, 'error' => 'Erreur serveur : ' . $e->getMessage()]);
}
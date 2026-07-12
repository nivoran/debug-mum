<?php
/*
------------------------------------------------------
api/corriger_redaction.php

Rôle :
Appeler le service IA pour évaluer la production écrite,
extraire le score pour la BDD et renvoyer le feedback au JS.
------------------------------------------------------
*/
header('Content-Type: application/json');
session_start();

// 1. Inclusion de nos briques de services (Mémoire globale + Logique IA)
require_once dirname(__DIR__) . "/services/resultats_service.php";
require_once dirname(__DIR__) . "/services/ai_service.php";

// Sécurité ou simulation de session utilisateur pour les tests
if (!isset($_SESSION["user_id"])) {
    $_SESSION["user_id"] = 1; 
}

// 2. Récupération de la rédaction envoyée par redaction.js
$data = json_decode(file_get_contents("php://input"), true);
$redaction = trim($data["redaction"] ?? "");

if (empty($redaction)) {
    echo json_encode([
        "success" => false,
        "error" => "Aucune rédaction reçue."
    ]);
    exit;
}

// 3. Appel de votre service linguistique IA existant
$texteIA = corrigerRedaction($redaction);

// 4. --- EXTRACTION ET MÉMOIRE ARCHITECTE ---
$note_sauvegardee = 0;

// Nettoyage rapide des backticks markdown pour assurer le décodage local
$json_nettoye = preg_replace('/^```json/i', '', $texteIA);
$json_nettoye = preg_replace('/```$/', '', $json_nettoye);
$json_nettoye = trim($json_nettoye);

$decodage = json_decode($json_nettoye, true);

if ($decodage && isset($decodage['note'])) {
    // Si la note est sur 20 (ex: 14), on la convertit sur 100 (ex: 70) 
    // pour que l'historique global reste cohérent et homogène.
    $note_sauvegardee = floatval($decodage['note']) * 5; 
}

// Extraction de l'ID du texte s'il est fourni par l'interface
$texte_id = $data['texte_id'] ?? null;

// Enregistrement automatique standardisé dans la table 'resultats'
enregistrerResultat(
    $_SESSION["user_id"],
    $texte_id,
    "rédaction",
    $note_sauvegardee
);
// --------------------------------------------

// 5. Envoi de la réponse structurée attendue par redaction.js
echo json_encode([
    "text" => $texteIA
]);
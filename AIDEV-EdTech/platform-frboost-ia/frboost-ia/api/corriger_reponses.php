<?php
/*
------------------------------------------------------
api/corriger_reponses.php

Rôle : 
Appeler Gemini en mode JSON strict pour corriger les réponses 
de compréhension et mémoriser le score global.
------------------------------------------------------
*/
header('Content-Type: application/json');
session_start();

// 1. Importation de notre brique de sauvegarde et de la configuration
require_once dirname(__DIR__) . "/services/resultats_service.php";
require_once dirname(__DIR__) . "/config/config.php";

// Sécurité ou simulation de session utilisateur pour les tests
if (!isset($_SESSION["user_id"])) {
    $_SESSION["user_id"] = 1; 
}

// 2. Récupération des données envoyées par comprehension.js
$data = json_decode(file_get_contents("php://input"), true);

if (!$data || !isset($data['texte']) || !isset($data['reponses'])) {
    echo json_encode(["success" => false, "error" => "Paramètres ou données incomplets."]);
    exit;
}

$texte = $data['texte'];
$reponses = $data['reponses'];

// 3. Préparation du prompt d'évaluation pour Gemini
$prompt = "Tu es un professeur de français. Lis le texte fourni et les réponses de l'élève. 
Corrige chaque réponse, donne un commentaire pédagogique détaillé et un score sur 20 pour chaque question. 
Calcule également le totalScore sur 100.
Tu dois impérativement respecter la structure JSON suivante :
{
  \"corrections\": [
    {\"question\":\"...\", \"reponse\":\"...\", \"correction\":\"...\", \"score\":...}
  ],
  \"totalScore\": ...
}

Texte : $texte

Réponses de l'élève : " . json_encode($reponses, JSON_UNESCAPED_UNICODE);

// 4. Construction du payload avec forçage du type de réponse JSON
$payload = [
    "contents" => [
        [
            "parts" => [
                ["text" => $prompt]
            ]
        ]
    ],
    // C'est ici que la magie opère : on force l'IA à répondre en JSON pur
    "generationConfig" => [
        "responseMimeType" => "application/json"
    ]
];

$apiKey = GEMINI_API_KEY;
$url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=" . $apiKey;

// 5. Exécution de la requête cURL
$ch = curl_init($url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, ["Content-Type: application/json"]);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($payload));

$response = curl_exec($ch);
curl_close($ch);

$result = json_decode($response, true);
$content = $result["candidates"][0]["content"]["parts"][0]["text"] ?? "";

// 6. Extraction et décodage du JSON structuré de l'IA
$iaData = json_decode(trim($content), true);
$totalScore = 0;
$corrections = [];

if ($iaData && isset($iaData['totalScore'])) {
    $totalScore = floatval($iaData['totalScore']);
    $corrections = $iaData['corrections'] ?? [];
} else {
    echo json_encode([
        "success" => false, 
        "error" => "L'assistant linguistique a rencontré une anomalie de structure.",
        "raw_debug" => $content // Permet de voir ce que l'IA a renvoyé en cas de problème structurel majeur
    ]);
    exit;
}

// --- LA BRIQUE DE MÉMOIRE (Règle d'or) ---
$texte_id = $data['texte_id'] ?? null; 

// Enregistrement standardisé dans la table 'resultats'
enregistrerResultat(
    $_SESSION["user_id"],
    $texte_id,
    "compréhension",
    $totalScore
);
// -----------------------------------------

// 7. Envoi de la réponse structurée au JavaScript de l'élève
echo json_encode([
    "corrections" => $corrections,
    "totalScore" => $totalScore
]);
<?php
header('Content-Type: application/json');
require_once "../config/config.php";

$data = json_decode(file_get_contents("php://input"), true);

if(!isset($data['texte']) || !isset($data['reponses'])){
    echo json_encode(["error"=>"Paramètres manquants"]);
    exit;
}

$texte = $data['texte'];
$reponses = $data['reponses'];

// Prépare le prompt pour Gemini
$prompt = "Tu es un professeur de français. Lis le texte ci-dessous et les réponses de l'élève. 
Corrige chaque réponse, donne un commentaire pédagogique et un score sur 20 pour chaque question. 
Réponds uniquement en JSON avec ce format :

{
  \"corrections\": [
    {\"question\":\"...\", \"reponse\":\"...\", \"correction\":\"...\", \"score\":...},
    ...
  ],
  \"totalScore\": ...
}

Texte : $texte

Réponses de l'élève : ".json_encode($reponses);

$payload = [
    "contents" => [
        [
            "parts" => [
                ["text" => $prompt]
            ]
        ]
    ]
];
$apiKey = GEMINI_API_KEY;
$url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=".$apiKey ;


$ch = curl_init($url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, ["Content-Type: application/json"]);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($payload));

$response = curl_exec($ch);
curl_close($ch);

$result = json_decode($response,true);

$content = $result["candidates"][0]["content"]["parts"][0]["text"] ?? "";

// Nettoyage éventuel des backticks
$content = preg_replace('/^```json/', '', $content);
$content = preg_replace('/```$/', '', $content);
$content = trim($content);

// Renvoie au JS
echo $content;
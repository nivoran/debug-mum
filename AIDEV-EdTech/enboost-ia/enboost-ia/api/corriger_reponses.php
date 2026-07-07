<?php
header('Content-Type: application/json');
require_once "../config/config.php";

$data = json_decode(file_get_contents("php://input"), true);

if(!isset($data['texte']) || !isset($data['reponses'])){
    echo json_encode(["error"=>"Missing parameters"]);
    exit;
}

$texte = $data['texte'];
$reponses = $data['reponses'];

// Prépare le prompt pour Gemini
$prompt = "You are an English teacher. Read the text below and the student's answers.\n"
        . "Correct each answer, provide educational feedback, and a score out of 20 for each question.\n"
        . "Respond ONLY in JSON with this format:\n\n"
        . "{\n"
        . "  \"corrections\": [\n"
        . "    {\"question\":\"...\", \"reponse\":\"...\", \"correction\":\"...\", \"score\":...},\n"
        . "    ...\n"
        . "  ],\n"
        . "  \"totalScore\": ...\n"
        . "}\n\n"
        . "Text: " . $texte . "\n\n"
        . "Student's answers: " . json_encode($reponses);

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
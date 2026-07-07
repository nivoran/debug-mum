<?php

header('Content-Type: application/json');

require_once "../config/config.php";

if(!isset($_POST['texte']) || trim($_POST['texte'])==""){
    echo json_encode(["error"=>"Texte manquant"]);
    exit;
}

$texte = $_POST["texte"];

$prompt = "Read this text and create 5 comprehension questions for a student learning English.\n\n"
        . "Types of questions:\n"
        . "- 1 general comprehension\n"
        . "- 2 detailed questions\n"
        . "- 1 vocabulary question\n"
        . "- 1 reflection question\n\n"
        . "Respond ONLY in JSON in this format:\n\n"
        . "[\n"
        . "  {\"question\":\"...\"},\n"
        . "  {\"question\":\"...\"},\n"
        . "  {\"question\":\"...\"},\n"
        . "  {\"question\":\"...\"},\n"
        . "  {\"question\":\"...\"}\n"
        . "]\n\n"
        . "Text:\n\n"
        . $texte;

$data = [
"contents" => [
[
"parts" => [
[
"text" => $prompt
]
]
]
]
];
$apiKey = GEMINI_API_KEY;
$url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=".$apiKey ;

$ch = curl_init($url);

curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POST, true);

curl_setopt($ch, CURLOPT_HTTPHEADER, [
"Content-Type: application/json"
]);

curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));

$response = curl_exec($ch);

curl_close($ch);

$result = json_decode($response,true);

$content = $result["candidates"][0]["content"]["parts"][0]["text"] ?? "";
// Retirer les ```json et ``` éventuels
$content = trim($content);
$content = preg_replace('/^```json/', '', $content);
$content = preg_replace('/```$/', '', $content);
$content = trim($content);
echo $content;
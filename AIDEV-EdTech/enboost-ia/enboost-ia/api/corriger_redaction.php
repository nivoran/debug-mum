<?php

header('Content-Type: application/json');

require_once("../services/ai_service.php"); // adapte le chemin si nécessaire

$input = json_decode(file_get_contents("php://input"), true);

$redaction = trim($input["redaction"] ?? "");

if(empty($redaction)){
        echo json_encode([
            "error" => "Aucune rédaction reçue."
        ]);
        exit;
    }

// appel IA
$texte = corrigerRedaction($redaction);
    // renvoyer le résultat au navigateur
    echo json_encode([
    "text" => $texte
]);
   
 

<?php

header('Content-Type: application/json; charset=utf-8');

require_once("../services/ai_service.php"); // même service IA


$input = json_decode(file_get_contents("php://input"), true);


$redaction = trim($input["redaction"] ?? "");


if(empty($redaction)){

    echo json_encode([
        "error" => "Aucune rédaction reçue."
    ]);

    exit;
}


// appel IA
$texte = ameliorerRedaction($redaction);


// renvoyer le résultat au navigateur
echo json_encode([
    "text" => $texte
], JSON_UNESCAPED_UNICODE);

?>
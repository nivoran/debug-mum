<?php

require_once("../services/ai_service.php");

ini_set('display_errors', 0);
// lire les données envoyées par Javascript
$data = json_decode(file_get_contents("php://input"), true);

// récupérer thème
$theme = $data["theme"] ?? "la mer";

// récupérer niveau
$niveau = $data["niveau"] ?? "A1";

// appel IA
$texte = demarrerConversation($theme, $niveau);
// renvoyer le résultat au navigateur
echo json_encode([
    "text" => $texte
]);
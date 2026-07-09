<?php
header('Content-Type: application/json');
require_once("../services/ai_service.php");

$data = json_decode(file_get_contents("php://input"), true);

$messages = $data["messages"] ?? [];

$texte = continuerConversation($messages);

echo json_encode([
    "text" => $texte
]);
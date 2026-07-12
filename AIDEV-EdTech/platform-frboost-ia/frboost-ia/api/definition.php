<?php

require_once("../config/database.php");

// Lire le JSON envoyé par JS
$data = json_decode(file_get_contents("php://input"), true);
$mot = strtolower(trim($data["mot"] ?? ""));

if(!$mot){
    echo json_encode(["definition"=>"Mot non fourni"]);
    exit;
}

try {

    // Recherche du mot dans la table dictionnaire
    $stmt = $pdo->prepare("SELECT definition FROM dictionnaire WHERE LOWER(mot) = LOWER(?)");
    $stmt->execute([$mot]);
   
    $result = $stmt->fetch(PDO::FETCH_ASSOC);

    if($result){
        $definition = $result["definition"];
    } else {
        $definition = "Définition non trouvée";
    }

    echo json_encode([
        "definition" => $definition
    ]);

} catch(PDOException $e){
    echo json_encode([
        "definition" => "Erreur BD"
    ]);
}
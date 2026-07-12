<?php

require_once("../services/ai_service.php");
require_once("../config/database.php");

ini_set('display_errors', 0);
// lire les données envoyées par Javascript
$data = json_decode(file_get_contents("php://input"), true);

// récupérer thème
$theme = $data["theme"] ?? "la mer";

// récupérer niveau
$niveau = $data["niveau"] ?? "A1";

// appel IA avec gestion d'erreur
try {

    $texte = genererTexte($theme, $niveau);
    if(!$texte){

        throw new Exception("Aucun texte généré par Gemini.");
    }

}
catch(Exception $e){

    echo json_encode([
        "error" => "Gemini est momentanément indisponible. Réessayez dans quelques instants."
    ]);

    exit;
}
// sauvegarde en base
$sql = "INSERT INTO dictees (theme, texte, niveau) VALUES (?, ?, ?)";
$stmt = $pdo->prepare($sql);
$stmt->execute([$theme, $texte, $niveau]);

// extraire mots utiles
$mots = extraireMotsUtiles($texte);
//$mots = array_slice(array_values($mots), 0, 15);

// générer définitions via IA
try {
    $definitions = genererDefinitions($mots);
}
catch(Exception $e){
    $definitions = [];
}

if(!$definitions){
    $definitions = [];
}

// insertion en base
$sql = "INSERT IGNORE INTO dictionnaire (mot, definition, niveau) VALUES (?, ?, ?)";
$stmt = $pdo->prepare($sql);

if(is_array($definitions)){
    foreach($definitions as $mot => $def){
        $stmt->execute([$mot, $def, $niveau]);
    }
}

// renvoyer le résultat au navigateur
header("Content-Type: application/json; charset=utf-8");
echo json_encode([
    "text" => $texte
]);

/*function extraireMotsUtiles($texte){

    // passer en minuscule
   // $texte = strtolower($texte);

    // enlever ponctuation
    $texte = preg_replace("/[^\p{L}\s]/u", "", $texte);
    $texte = mb_strtolower($texte);

    $mots = explode(" ", $texte);
    $mots = array_map('trim', $mots);
    $mots = array_filter($mots);

    // mots à ignorer
    $stopWords = [
        "le","la","les","un","une","des",
        "de","du","ce","cet","cette",
        "et","à","en","dans","sur","pour",
        "être","avoir","suis","es","est","sommes","êtes","sont",
        "ai","as","a","avons","avez","ont"
    ];

    // filtrer
    $mots = array_filter($mots, function($mot) use ($stopWords){
        return strlen($mot) > 2 && !in_array($mot, $stopWords);
    });

    // enlever doublons
    return array_unique($mots);
}*/
function extraireMotsUtiles($texte){
    
    // Normalisation UTF-8
    if(class_exists('Normalizer')){
        $texte = Normalizer::normalize($texte, Normalizer::FORM_C);
    }

    // minuscules
    $texte = mb_strtolower($texte, 'UTF-8');

    // remplacer les caractères bizarres par un espace
    $texte = preg_replace("/[^\p{L}\s'-]/u", " ", $texte);
  

    // nettoyer les espaces multiples
    $texte = preg_replace("/\s+/", " ", $texte);

    $mots = explode(" ", trim($texte));

   // $mots = explode(" ", $texte);
    $mots = array_map('trim', $mots);
    $mots = array_filter($mots);


    // mots à ignorer
    $stopWords = [
        "le","la","les","un","une","des",
        "de","du","ce","cet","cette",
        "et","à","en","dans","sur","pour",
        "être","avoir","suis","es","est","sommes","êtes","sont",
        "ai","as","a","avons","avez","ont"
    ];


    // filtrer
    $mots = array_filter($mots, function($mot) use ($stopWords){
        return strlen($mot) > 2 && !in_array($mot, $stopWords);
    });


    // réduction des pluriels simples
    $mots = array_map(function($mot){

        if(substr($mot, -1) == "s" && strlen($mot) > 3){
            $mot = substr($mot,0,-1);
        }

        return $mot;

    }, $mots);


    // enlever doublons
    return array_unique($mots);
}


?>
<?php

require "config/database.php";
require "config/gemini.php";


$theme=$_POST['theme'];
$niveau=$_POST['niveau'];

$prompt = "

Tu es un professeur de mathématiques.

Génère un exercice de démonstration.

Thème : $theme

Niveau : $niveau

Retourne uniquement un JSON :

{
titre:'',
enonce:'',
domaine:'',
niveau:'',
solution_modele:''
}


L'exercice doit demander une vraie démonstration.
";



$response=demanderGemini($prompt);

// récupération texte IA

/*$json =
$response['candidates'][0]['content']['parts'][0]['text'];*/
if(!isset($response['candidates'])){

    echo "<h2>Réponse Gemini inattendue</h2>";

    echo "<pre>";
    print_r($response);
    echo "</pre>";

    exit();

}


$json =
$response['candidates'][0]['content']['parts'][0]['text'];

// nettoyage éventuel

$json=str_replace(
["```json","```"],
"",
$json
);

$data=json_decode(
trim($json),
true
);

if(!$data){

die("Erreur génération IA");
}

$sql="
INSERT INTO exercices
(
titre,
enonce,
domaine,
niveau,
solution_modele
)

VALUES
(?,?,?,?,?)
";

$stmt=$pdo->prepare($sql);
$stmt->execute([
$data['titre'],
$data['enonce'],
$data['domaine'],
$data['niveau'],
$data['solution_modele']
]);



header("Location: exercices.php");

exit();

?>
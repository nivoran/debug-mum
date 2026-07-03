<?php

require "../config/database.php";


// données venant du formulaire

$exo=$_POST['exo'];
$texte=$_POST['solution'];


// 1) Enregistrer la démonstration

$sql="
INSERT INTO demonstrations
(exo_id, contenu, date_envoi)

VALUES
(?,?,NOW())
";


$stmt=$pdo->prepare($sql);

$stmt->execute([
    $exo,
    $texte
]);


// récupérer l'id créé

$demonstration_id=$pdo->lastInsertId();





// 2) ANALYSE IA (temporaire)
// plus tard remplacé par Gemini


$resume =
"Votre démonstration est globalement correcte. 
Quelques justifications doivent être précisées.";


$analyse_complete =
"Analyse automatique :\n\n
Points positifs :
- Bonne compréhension du problème.

Points à améliorer :
- Justifier davantage les étapes intermédiaires.
";



$score_logique=80;

$score_redaction=75;

$niveau_confiance=0.90;




// 3) Enregistrer l'analyse

$sql="
INSERT INTO analyses_ia
(
analyse_complete,
date_analyse,
demonstration_id,
niveau_confiance,
resume,
score_logique,
score_redaction
)

VALUES
(?,NOW(),?,?,?,?,?)
";



$stmt=$pdo->prepare($sql);


$stmt->execute([

$analyse_complete,
$demonstration_id,
$niveau_confiance,
$resume,
$score_logique,
$score_redaction

]);





header(
"Location: ../analyse.php?id=".$demonstration_id
);

exit();


?>
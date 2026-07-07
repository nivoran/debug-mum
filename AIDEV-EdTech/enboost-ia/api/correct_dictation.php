<?php
function decouperTexte($texte){
    // Capture mots simples, mots avec apostrophe ou trait d'union, nombres, ponctuation
    preg_match_all("/\p{L}+(?:['’]\p{L}+)?(?:-\p{L}+)?|\p{N}+|[.,;:!?]/u", $texte, $matches);
    return $matches[0];
}

$data = json_decode(file_get_contents("php://input"));

$correct = decouperTexte($data->correct);
$eleve = decouperTexte($data->eleve);

$i = 0;
$j = 0;

$html = "";
$erreurs = 0;

while($i < count($correct) || $j < count($eleve)){

    $c = $correct[$i] ?? null;
    $e = $eleve[$j] ?? null;

    if($c === $e){

        $html .= "<span>$c</span> ";
        $i++;
        $j++;

    }
    else{

        // ponctuation manquante
        if($c && in_array($c,[",",".",";",":","!","?"])){

            $html .= "<span style='color:red'>[$c]</span> ";
            $erreurs++;
            $i++;

        }
        else{

            $html .= "<span style='color:red' title='Correct : $c'>$e</span> ";
            $erreurs++;
            $i++;
            $j++;

        }

    }

}

$total = count($correct);

$note = round((($total - $erreurs) / $total) * 100);

echo json_encode([
    "html"=>$html,
    "note"=>$note
]);
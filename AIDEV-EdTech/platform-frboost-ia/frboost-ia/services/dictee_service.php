<?php
/*
------------------------------------------------------
services/dictee_service.php

Logique métier spécifique au module Dictée.
------------------------------------------------------
*/

/**
 * Découpe un texte en jetons (mots, apostrophes, ponctuation).
 */
function decouperTexte($texte) {
    preg_match_all("/\p{L}+(?:['’]\p{L}+)?(?:-\p{L}+)?|\p{N}+|[.,;:!?]/u", $texte, $matches);
    return $matches[0];
}

/**
 * Compare le texte de l'élève avec le texte correct.
 * Retourne un tableau contenant le score, le nombre d'erreurs et le code HTML de correction.
 */
function corrigerDictee($texteCorrect, $texteEleve) {
    $correct = decouperTexte($texteCorrect);
    $eleve = decouperTexte($texteEleve);

    $i = 0;
    $j = 0;
    $html = "";
    $erreurs = 0;

    while ($i < count($correct) || $j < count($eleve)) {
        $c = $correct[$i] ?? null;
        $e = $eleve[$j] ?? null;

        if ($c === $e) {
            $html .= "<span>$c</span> ";
            $i++;
            $j++;
        } else {
            // Ponctuation manquante
            if ($c && in_array($c, [",", ".", ";", ":", "!", "?"])) {
                $html .= "<span style='color:red'>[$c]</span> ";
                $erreurs++;
                $i++;
            } else {
                $html .= "<span style='color:red' title='Correct : $c'>$e</span> ";
                $erreurs++;
                $i++;
                $j++;
            }
        }
    }

    $total = count($correct);
    $note = $total > 0 ? round((($total - $erreurs) / $total) * 100) : 0;

    return [
        'note' => $note,
        'erreurs' => $erreurs,
        'html' => $html
    ];
}
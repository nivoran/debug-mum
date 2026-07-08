<?php
/*
------------------------------------------------------
resultats_service.php

Gestion des résultats des exercices de FrBoost AI

Fonctions disponibles :
- enregistrerResultat()

------------------------------------------------------
*/

require_once __DIR__ . "/../config/database.php";

/**
 * Enregistre le score d'un utilisateur pour un exercice spécifique
 * * @param int $user_id ID de l'apprenant
 * @param int|null $texte_id ID du texte travaillé (si applicable)
 * @param string $module Type d'exercice ('dictee', 'comprehension', etc.)
 * @param float|int $score Score ou pourcentage obtenu
 * @param int|null $temps Temps passé en secondes (optionnel)
 * @return bool True si l'enregistrement a réussi
 */
function enregistrerResultat($user_id, $texte_id, $module, $score, $temps = null)
{
    global $pdo;

    $sql = "INSERT INTO resultats 
            (user_id, texte_id, module, score, temps) 
            VALUES 
            (?, ?, ?, ?, ?)";

    $stmt = $pdo->prepare($sql);
    
    return $stmt->execute([
        $user_id,
        $texte_id,
        $module,
        $score,
        $temps
    ]);
}
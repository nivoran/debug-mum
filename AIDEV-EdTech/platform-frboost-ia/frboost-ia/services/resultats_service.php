<?php
/*
------------------------------------------------------
services/resultats_service.php

Rôle :
Gérer la persistance des résultats (Écriture et Lecture).
------------------------------------------------------
*/

require_once __DIR__ . "/../config/database.php";

// [FONCTION EXIStANTE] : Enregistrer un résultat
function enregistrerResultat($user_id, $texte_id, $module, $score, $temps = null) {
    global $pdo;

    $sql = "INSERT INTO resultats (user_id, texte_id, module, score, temps) VALUES (?, ?, ?, ?, ?)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$user_id, $texte_id, $module, $score, $temps]);
}

// ✨ [NOUVELLE FONCTION] : Récupérer l'historique d'un élève
function obtenirHistoriqueUtilisateur($user_id) {
    global $pdo;

    // On trie par date_creation décroissante pour avoir les exercices récents en premier
    $sql = "SELECT id, texte_id, module, score, temps, date_creation 
            FROM resultats 
            WHERE user_id = ? 
            ORDER BY date_creation DESC";
            
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$user_id]);
    
    return $stmt->fetchAll();
}
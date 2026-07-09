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
function obtenirHistorique($user_id, $limite = 10)
{
    global $pdo;

    $sql = "SELECT
                r.module,
                ROUND(r.score),
                r.date_passage,
                d.theme
            FROM resultats r
            INNER JOIN dictees d
                ON r.texte_id = d.id
            WHERE r.user_id = ?
            ORDER BY r.date_passage DESC
            LIMIT ?";

    $stmt = $pdo->prepare($sql);

    $stmt->bindValue(1, $user_id, PDO::PARAM_INT);
    $stmt->bindValue(2, $limite, PDO::PARAM_INT);

    $stmt->execute();

    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function obtenirStatistiquesUtilisateur($user_id)
{
    global $pdo;

    $sql = "
        SELECT
            COUNT(*) AS nb_exercices,
            ROUND(AVG(score)) AS moyenne,
            ROUND(MAX(score)) AS meilleur,
            COUNT(DISTINCT module) AS nb_modules
        FROM resultats
        WHERE user_id = ?
    ";

    $stmt = $pdo->prepare($sql);
    $stmt->execute([$user_id]);

    return $stmt->fetch(PDO::FETCH_ASSOC);
}
<?php
// ------------------------------------------------------------
// get_dictees.php - retourne les dictées enregistrées selon le niveau
// ------------------------------------------------------------

// ⚠️ Masquer les warnings pour éviter de casser le JSON
error_reporting(0);

// Définir le type de contenu JSON
header('Content-Type: application/json');

// Charger la connexion à la base
require_once("../config/database.php");

// Vérifier si la connexion $pdo existe
if(!isset($pdo)){
    echo json_encode([
        "error" => "Connexion à la base impossible"
    ]);
    exit;
}

try {

    // Récupérer le niveau passé en GET
    $niveau = $_GET['niveau'] ?? null;

    if($niveau){
        // Requête pour récupérer uniquement les dictées du niveau choisi
        $sql = "SELECT * FROM dictees WHERE niveau = :niveau ORDER BY date_creation DESC";
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['niveau' => $niveau]);
    } else {
        // Si aucun niveau précisé, récupérer toutes les dictées
        $sql = "SELECT * FROM dictees ORDER BY date_creation DESC";
        $stmt = $pdo->query($sql);
    }

    $dictées = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Si aucune dictée, renvoyer un tableau vide
    if(!$dictées){
        $dictées = [];
    }

    echo json_encode($dictées);

} catch(PDOException $e){
    // En cas d'erreur SQL
    echo json_encode([
        "error" => "Erreur SQL : ".$e->getMessage()
    ]);
    exit;
}
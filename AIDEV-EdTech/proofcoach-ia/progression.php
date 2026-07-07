<?php

session_start();

if(!isset($_SESSION['user_id'])){
    header("Location: login.php");
    exit();
}

require "config/database.php";

$user_id=$_SESSION['user_id'];

$sql=$pdo->prepare("
SELECT *
FROM progression
WHERE user_id=?
");

$sql->execute([$user_id]);

$progression=$sql->fetch();

if(!$progression){

    $pdo->prepare("
    INSERT INTO progression(user_id)
    VALUES(?)
    ")->execute([$user_id]);

    $sql->execute([$user_id]);
    $progression=$sql->fetch();
}

?>
<!DOCTYPE html>

<html lang="fr">

<head>

<meta charset="UTF-8">

<title>Ma progression</title>

<link rel="stylesheet" href="assets/css/style.css">

</head>

<body>

<div class="layout">

<!-- SIDEBAR -->

<aside class="sidebar">

<h2>🧠 ProofCoach AI</h2>

<a href="dashboard.php">🏠 Tableau de bord</a>

<a href="generer_exercice.php">➕ Nouvel exercice</a>

<a href="exercices.php">📚 Mes exercices</a>

<a href="statistiques.php">📊 Statistiques</a>

<a class="active">📈 Progression</a>

<a href="logout.php" class="logout">🚪 Déconnexion</a>

</aside>



<!-- CONTENU -->

<main class="main">

<h1>📈 Ma progression</h1>

<div class="stats-grid">

<div class="stat-card">

<h2><?= $progression['niveau'] ?></h2>

<p>Niveau actuel</p>

</div>


<div class="stat-card">

<h2><?= $progression['experience'] ?></h2>

<p>Points d'expérience</p>

</div>


<div class="stat-card">

<h2><?= round($progression['score_global']) ?>%</h2>

<p>Score global</p>

</div>


<div class="stat-card">

<h2><?= round($progression['score_logique']) ?>%</h2>

<p>Logique</p>

</div>


<div class="stat-card">

<h2><?= round($progression['score_redaction']) ?>%</h2>

<p>Rédaction</p>

</div>


<div class="stat-card">

<h2><?= $progression['serie_reussite'] ?></h2>

<p>Série de réussites</p>

</div>

</div>



<br><br>

<h2>Progression vers le niveau suivant</h2>

<?php

$xp=$progression['experience'];

$pourcentage=min(100,($xp%100));

?>

<div class="progress-bar">

<div class="progress-fill"

style="width:<?= $pourcentage ?>%">

</div>

</div>

<p>

<?= $pourcentage ?> %

vers le niveau suivant

</p>



<br>

<h2>Résumé</h2>

<div class="panel">

<p>

<strong>Exercices réalisés :</strong>

<?= $progression['exercices_realises'] ?>

</p>

<p>

<strong>Démonstrations réalisées :</strong>

<?= $progression['demonstrations_realisees'] ?>

</p>

<p>

<strong>Corrections IA :</strong>

<?= $progression['corrections_ia'] ?>

</p>

<p>

<strong>Meilleur score :</strong>

<?= round($progression['meilleur_score']) ?> %

</p>

<p>

<strong>Dernière activité :</strong>

<?= $progression['derniere_activite'] ?>

</p>

</div>

</main>

</div>

</body>

</html>
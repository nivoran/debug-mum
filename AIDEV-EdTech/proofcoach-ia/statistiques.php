<?php

session_start();

if(!isset($_SESSION['user_id'])){
    header("Location: login.php");
    exit();
}


require "config/database.php";


// nombre exercices

$stmt=$pdo->query(
"SELECT COUNT(*) FROM exercices"
);

$nb_exercices=$stmt->fetchColumn();



// nombre démonstrations

$stmt=$pdo->query(
"SELECT COUNT(*) FROM demonstrations"
);

$nb_demos=$stmt->fetchColumn();



// nombre analyses

$stmt=$pdo->query(
"SELECT COUNT(*) FROM analyses_ia"
);

$nb_analyses=$stmt->fetchColumn();




// scores moyens

$stmt=$pdo->query(
"
SELECT 
AVG(score_logique),
AVG(score_redaction)

FROM analyses_ia
"
);


$scores=$stmt->fetch();


$score_logique=
round($scores[0] ?? 0);


$score_redaction=
round($scores[1] ?? 0);



?>


<!DOCTYPE html>

<html lang="fr">

<head>

<meta charset="UTF-8">

<title>Statistiques</title>

<link rel="stylesheet" href="assets/css/style.css">

</head>


<body>


<div class="layout">



<aside class="sidebar">
    <h2>🧠 ProofCoach AI</h2>
    <a href="dashboard.php">▣ Tableau de bord</a>
    <a href="generer_exercice.php">⊕ Nouvel exercice</a>
    <a href="exercices.php">📝 Mes exercices</a>
    <a class="active">📊 Statistiques</a>
    <a href="progression.php">◉ Progression</a>
    <a href="logout.php" class="logout">Déconnexion</a>
</aside>

<main class="main">


<h1>
Mes statistiques
</h1>



<div class="stats-grid">
    <div class="stat-card">
        <h2><?= $nb_exercices ?></h2>
        <p>Exercices créés</p>
    </div>

    <div class="stat-card">
        <h2><?= $nb_demos ?></h2>
        <p>Démonstrations réalisées</p>
    </div>

    <div class="stat-card">
        <h2><?= $nb_analyses ?></h2>
        <p>Corrections IA</p>
    </div>

    <div class="stat-card">
        <h2><?= $score_logique ?>%</h2>
        <p>Score logique moyen</p>
    </div>

    <div class="stat-card">
        <h2><?= $score_redaction ?>%</h2>
        <p>Score rédaction moyen</p>

</div>



</div>


</main>


</div>


</body>

</html>
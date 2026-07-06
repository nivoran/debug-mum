<?php

session_start();


// Protection : accès seulement si connecté
if(!isset($_SESSION['user_id'])){

    header("Location: login.php");
    exit();
}

require "config/database.php";
$user=$_SESSION['user_id'];

// Exercices
$stmt=$pdo->query("
SELECT COUNT(*)
FROM exercices
");

$nbExercices=$stmt->fetchColumn();

// Démonstrations

$stmt=$pdo->query("
SELECT COUNT(*)
FROM demonstrations
");

$nbDemos=$stmt->fetchColumn();

// Analyses

$stmt=$pdo->query("
SELECT COUNT(*)
FROM analyses_ia
");

$nbAnalyses=$stmt->fetchColumn();

// Score moyen

$stmt=$pdo->query("
SELECT AVG(score_logique+score_redaction)/2
FROM analyses_ia
");

$score=round($stmt->fetchColumn());
// Progression

$stmt=$pdo->prepare("
SELECT *
FROM progression
WHERE user_id=?
");

$stmt->execute([$user]);

$progression=$stmt->fetch();

?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title>Dashboard - ProofCoach AI</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>


<body>
    <div class="layout">
        <!-- MENU GAUCHE -->
        <aside class="sidebar">
            <h2>🧠 ProofCoach AI</h2>
            <!--p>Coach IA de<br>démonstrations<br> mathématiques </p-->
            <a class="active" href="dashboard.php">▣ Tableau de bord</a>
            <a href="generer_exercice.php">⊕ Nouvel exercice</a>
            <!--a href="mes_demonstrations.php"-->
            <a href="exercices.php">▤ Mes exercices</a>
            <!--a href="#">✓ Mes corrections</a-->
            <a href="statistiques.php">▥ Statistiques</a>
            <a href="progression.php">◉ Progression</a>
            <a href="logout.php" class="logout">Déconnexion</a>
        </aside>

        <!-- CONTENU -->

        <main class="main">
            <div class="top">
                <div>
                    <h1>Bonjour <?= htmlspecialchars($_SESSION['nom']) ?>👋</h1>
                    <p>Prêt à progresser en démonstrations mathématiques ?</p>
                </div>

                <div>
                    👤 <?= htmlspecialchars($_SESSION['role']) ?>
                </div>
            </div>

            <!-- CARTES -->
           <div class="cards">
                <div class="card">
                    <h1><?= $nbExercices ?></h1>
                    <p>Exercices</p>
                </div>

                <div class="card">
                    <h1><?= $nbDemos ?></h1>
                    <p>Démonstrations</p>
                </div>

                <div class="card">
                    <h1><?= $nbAnalyses ?></h1>
                    <p>Corrections IA</p>
                </div>

                <div class="card">
                    <h1><?= $score ?>%</h1>
                    <p>Score moyen</p>
                </div>
        </div>
            <a href="exercices.php" class="big-btn">+ Commencer un nouvel exercice</a>

        </main>

    </div>

</body>

</html>
<?php

session_start();

if(!isset($_SESSION['user_id'])){
    header("Location: login.php");
    exit();
}


require "config/database.php";


// Dernière démonstration envoyée

$sql = "
SELECT
    d.*,
    e.titre,
    e.enonce,
    e.solution_modele,
    a.score_logique,
    a.score_redaction,
    a.resume,
    a.analyse_complete,
    a.niveau_confiance

FROM demonstrations d

JOIN exercices e
ON d.exo_id = e.id

LEFT JOIN analyses_ia a
ON a.demonstration_id = d.id

ORDER BY d.id DESC

LIMIT 1
";

$stmt = $pdo->query($sql);

$resultat = $stmt->fetch(PDO::FETCH_ASSOC);
$score = round(
(
($resultat['score_logique'] ?? 0)
+
($resultat['score_redaction'] ?? 0)
)/2
);
?>


<!DOCTYPE html>

<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Analyse IA - ProofCoach</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <script>
        window.MathJax = {
        tex: {
            inlineMath: [['$', '$'], ['\\(', '\\)']],
            displayMath: [['$$','$$'], ['\\[','\\]']]
        }
        };
    </script>
    <script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
</head>


<body>
<div class="layout">
    <aside class="sidebar">
        <h2>🧠 ProofCoach AI</h2>
        <a href="dashboard.php">▣ Tableau de bord</a>
        <a href="generer_exercice.php">⊕ Nouvel exercice</a>
        <a href="exercices.php">▤ Mes exercices</a>
        <!--a class="active">✓ Correction IA</a-->
        <a href="statistiques.php">▥ Statistiques</a>
        <a href="progression.php">◉ Progression</a>
        <a href="logout.php" class="logout">Déconnexion</a>
        <!--a href="logout.php">Déconnexion</a-->
    </aside>

<main class="main">

<h1>Analyse de votre démonstration 🤖</h1>

<div class="analysis-grid">

<!-- SCORE -->

<div class="score"><?= $score ?>%</div>
<p><?= htmlspecialchars($resultat['resume'] ?? "Analyse indisponible") ?></p>


<!-- POINTS POSITIFS -->

<div class="analysis-card">
    <h2>✅ Points forts</h2>
    <ul>
        <li>Bonne identification des hypothèses</li>
        <li>Utilisation correcte du théorème</li>
        <li>Conclusion cohérente</li>
    </ul>
</div>

<!-- ERREURS -->


<div class="analysis-card error-card">
    <h2>⚠ Points à améliorer</h2>
    <ul>
        <li>Certaines étapes manquent de justification</li>
        <li>Le passage vers la limite devrait être détaillé</li>
        <li>Préciser pourquoi ε est choisi</li>
    </ul>

</div>

</div>

<!-- REPONSE ETUDIANT -->

<div class="solution-box">
    <h2>Votre démonstration</h2>
        <div class="student-text"> <?= $resultat['contenu'] ?? "Aucune démonstration trouvée" ?></div>
</div>


<!-- MODELE -->
<div class="solution-box">
    <h2>📘 Démonstration modèle</h2>
    <div class="math-content">
        <?= nl2br($resultat['solution_modele'] ?? "Pas encore disponible") ?>
    </div>
</div>
<a href="exercices.php" class="big-btn">Nouvel exercice</a>

</main>
</div>

<script>
MathJax.typeset();
</script>
</body>


</html>
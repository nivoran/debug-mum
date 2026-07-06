<?php

session_start();

if(!isset($_SESSION['user_id'])){
    header("Location: login.php");
    exit();
}

require "config/database.php";

// récupérer les exercices

$sql="
SELECT 
    e.*,
    d.id AS demonstration_id

FROM exercices e

LEFT JOIN demonstrations d
ON e.id=d.exo_id

ORDER BY e.id DESC
";

$stmt=$pdo->query($sql);
$exercices=$stmt->fetchAll(PDO::FETCH_ASSOC);

?>


<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<title>Nouvel exercice</title>
<link rel="stylesheet" href="assets/css/style.css">
<script>
window.MathJax = {
  tex: {
    inlineMath: [['$', '$'], ['\\(', '\\)']],
    displayMath: [['$$','$$'], ['\\[','\\]']]
  }
};
</script>

<script 
src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>

</head>

<body>

<div class="layout">

    <aside class="sidebar">
        <h2>🧠 ProofCoach AI</h2>
        <a href="dashboard.php">▣ Tableau de bord</a>
        <!--a class="active">⊕ Nouvel exercice</a-->
        <a href="generer_exercice.php">⊕ Nouvel exercice</a>
        <!--a href="#">✓ Mes corrections</a-->
        <a class="active" href="exercices.php">▤ Mes exercices</a>
         <a href="statistiques.php">▥ Statistiques</a>
        <a href="progression.php">◉ Progression</a>
        <a href="logout.php" class="logout">Déconnexion</a>
        <!--a href="logout.php">Déconnexion</a-->
    </aside>

    <main class="main">
        <h1>Choisir un exercice</h1>
        <p>Sélectionnez un problème à démontrer.</p>

        <div class="exercise-grid">

            <?php foreach($exercices as $exo): ?>

            <div class="exercise-card">
                <h2>
                <?= htmlspecialchars($exo['titre']) ?>
                </h2>
               <div class="math-content">
                    <?= nl2br($exo['enonce']) ?>
                </div>

                <div class="tags">
                    <?= $exo['domaine'] ?>
                    -
                    <?= $exo['niveau'] ?>

                </div>

               <div class="action-buttons">

                    <?php if($exo['demonstration_id']): ?>
                        <a class="btn" href="voir_demonstration.php?id=<?= $exo['demonstration_id'] ?>"> Voir ma démonstration </a>
                    <?php else: ?>
                        <a class="btn" href="demonstration.php?id=<?= $exo['id'] ?>"> Commencer</a>
                    <?php endif; ?>
                    <a class="btn delete-btn" href="supprimer_exercice.php?id=<?= $exo['id'] ?>" onclick="return confirm('Supprimer définitivement cet exercice ?');"> Supprimer </a>
               </div>

            </div>

            <?php endforeach; ?>
        </div>

    </main>
</div>

</body>

</html>
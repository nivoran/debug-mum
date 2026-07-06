<?php

session_start();

if(!isset($_SESSION['user_id'])){
    header("Location: login.php");
    exit();
}

require "config/database.php";


$sql="
SELECT 
d.id,
d.contenu,
d.date_envoi,
e.titre,
e.domaine,
e.niveau

FROM demonstrations d

JOIN exercices e
ON d.exo_id=e.id

ORDER BY d.date_envoi DESC
";


$stmt=$pdo->query($sql);

$demos=$stmt->fetchAll(PDO::FETCH_ASSOC);


?>


<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Mes corrections</title>

<link rel="stylesheet" href="assets/css/style.css">

</head>


<body>


<div class="layout">


<aside class="sidebar">


<h2>
🧠 ProofCoach AI
</h2>


<a href="dashboard.php">
▣ Tableau de bord
</a>


<a href="exercices.php">
⊕ Nouvel exercice
</a>


<a class="active">
✓ Mes corrections
</a>


</aside>



<main class="main">


<h1>
Mes démonstrations
</h1>


<p>
Retrouvez vos travaux et vos analyses.
</p>



<?php foreach($demos as $demo): ?>


<div class="solution-box">


<h2>
<?= htmlspecialchars($demo['titre']) ?>
</h2>


<div class="tags">

<?= $demo['domaine'] ?>
-
<?= $demo['niveau'] ?>

</div>


<p>

Envoyé le :
<?= $demo['date_envoi'] ?>

</p>



<div class="student-text">

<?= $demo['contenu'] ?>

</div>



<a class="btn"
href="analyse.php?id=<?=$demo['id']?>">

Voir l'analyse

</a>


</div>



<?php endforeach; ?>


</main>


</div>


</body>

</html>
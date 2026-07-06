<?php

session_start();

if(!isset($_SESSION['user_id'])){
    header("Location: login.php");
    exit();
}


require "config/database.php";

$id=$_GET['id'];

$sql="SELECT d.*,e.titre,e.enonce FROM demonstrations d JOIN exercices e ON d.exo_id=e.id WHERE d.id=?";
$stmt=$pdo->prepare($sql);
$stmt->execute([$id]);
$demo=$stmt->fetch();
?>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Ma démonstration</title>
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
        <main class="main">
         <div class="solution-box">
            <h1><?= htmlspecialchars($demo['titre']) ?></h1>
            <h3>Énoncé :</h3>
            <p><?= nl2br($demo['enonce']) ?></p>
            <hr>
            <h3>Ma démonstration :</h3>
            <div class="student-text"><?= $demo['contenu'] ?></div>

            <div class="action-buttons">
                <a class="btn" href="analyse.php?id=<?=$demo['id']?>">Voir la correction IA</a>
                <a class="btn delete-btn" href="supprimer_demonstration.php?id=<?=$demo['id']?>" onclick="return confirm('Supprimer cette démonstration ? L’analyse IA sera également supprimée.');"> Supprimer ma démonstration</a></div>
        </div>
        </main>
    </div>


</body>

</html>
<?php

session_start();

if(!isset($_SESSION['user_id'])){
    header("Location: login.php");
    exit();
}

?>


<!DOCTYPE html>
<html lang="fr">
    <head>
    <meta charset="UTF-8">
    <title>Créer un exercice</title>
    <link rel="stylesheet" href="assets/css/style.css">
    </head>

<body>
    <div class="layout">
        <aside class="sidebar">
            <h2>🧠 ProofCoach AI</h2>
            <a href="dashboard.php"> ▣ Tableau de bord</a>
            <a class="active">⊕ Nouvel exercice</a>
            <a href="exercices.php">📝 Mes exercices</a>
            <a href="statistiques.php">▥ Statistiques</a>
            <a href="progression.php">◉ Progression</a>
            <a href="logout.php" class="logout">Déconnexion</a>
            <!--a href="logout.php">Déconnexion</a-->
        </aside>

        <main class="main">
            <div class="panel">
                <h1>Créer un nouvel exercice</h1>
                <p>Décrivez le type d'exercice que vous souhaitez travailler.</p>
                <form method="POST" action="generer_exercice_action.php">
                    <label>Thème mathématique</label>
                    <input type="text" name="theme" placeholder="Ex: Suites numériques, limites, dérivation..." required>
                    <label>Niveau</label>
                    <select name="niveau">
                        <option>Lycée</option>
                        <option>Licence</option>
                    </select>
                    <br><br>
                    <button class="btn-primary"> 🤖 Demander à l'IA de générer l'exercice</button>
                </form>
            </div>

        </main>
    </div>

</body>
</html>
<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Si l'utilisateur est déjà connecté, redirection vers l'application
if (isset($_SESSION['user_id'])) {
    header("Location: ../app.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion - FrBoost AI</title>
    
    <!-- Lien vers ton fichier CSS (avec une astuce anti-cache PHP pour forcer la mise à jour) -->
    <link rel="stylesheet" href="../assets/css/login.css?v=<?php echo time(); ?>">
</head>

<body>

    <!-- ========================================================== -->
    <!-- IMAGE EN ARRIÈRE-PLAN (PLEIN ÉCRAN)                       -->
    <!-- ========================================================== -->
       <img src="../assets/images/FrBoostAI.png" alt="FrBoost AI - Apprenez le français autrement" class="bg-fullscreen">

    <!-- ========================================================== -->
    <!-- BOITE DE CONNEXION POPUP                                   -->
    <!-- ========================================================== -->
    <div class="login-popup">

        <h2>Connexion</h2>

        <!-- Gestion de l'affichage de l'erreur PHP -->
        <?php
        if (isset($_SESSION["erreur"])) {
        ?>
            <div class="erreur">
                <?= $_SESSION["erreur"]; ?>
            </div>
        <?php
            unset($_SESSION["erreur"]);
        }
        ?>

        <!-- Formulaire de connexion -->
        <form action="login_process.php" method="post">

            <div class="champ">
                <label>Adresse e-mail</label>
                <input 
                    type="email" 
                    name="email" 
                    placeholder="exemple@email.com" 
                    required 
                    autofocus
                >
            </div>

            <div class="champ">
                <label>Mot de passe</label>
                <input 
                    type="password" 
                    name="password" 
                    placeholder="Votre mot de passe" 
                    required
                >
            </div>

            <button type="submit">
                Se connecter
            </button>

        </form>

        <!-- Mentions de bas de page -->
        <div class="footer-login">
            Connexion sécurisée 🔒
            <br><br>
            © 2026 AI&DEV Academy
        </div>

    </div>

</body>
</html>
<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Si déjà connecté
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

<link rel="stylesheet" href="../assets/css/login.css">

</head>

<body>

<div class="login-container">

    <!-- ========================= -->
    <!-- COLONNE GAUCHE            -->
    <!-- ========================= -->

    <div class="login-left">

       <div class="logo-circle">
            FR

        </div>

        <h1>FrBoost AI</h1>
            L'intelligence artificielle
            au service de votre maîtrise
            du français.
        <ul>

            <li>✓ Dictée intelligente</li>

            <li>✓ Compréhension de textes</li>

            <li>✓ Lecture guidée</li>

            <!--li>✓ Conversation assistée</li-->

            <li>✓ Rédaction</li>

        </ul>

        <div class="left-footer">

            Développé par<br>

            <strong>AI&DEV Academy</strong>

        </div>

    </div>

    <!-- ========================= -->
    <!-- COLONNE DROITE            -->
    <!-- ========================= -->

    <div class="login-right">

        <h2>Bon retour 👋</h2>

        <p>

            Connectez-vous pour retrouver votre espace d'apprentissage.

        </p>

<?php
if(isset($_SESSION["erreur"])){
?>

<div class="erreur">

<?= $_SESSION["erreur"]; ?>

</div>

<?php
unset($_SESSION["erreur"]);
}
?>

<form action="login_process.php" method="post">

<div class="champ">

<label>Adresse e-mail</label>

<input
type="email"
name="email"
placeholder="exemple@email.com"
required
autofocus>

</div>

<div class="champ">

<label>Mot de passe</label>

<input
type="password"
name="password"
placeholder="Votre mot de passe"
required>

</div>

<button type="submit">

Se connecter

</button>

</form>

<div class="footer-login">

Connexion sécurisée 🔒

<br><br>

© 2026 AI&DEV Academy

</div>

</div>

</div>

</body>

</html>
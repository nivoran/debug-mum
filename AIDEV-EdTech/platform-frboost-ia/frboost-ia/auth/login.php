<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Si l'utilisateur est déjà connecté
if (isset($_SESSION['user_id'])) {
    header("Location: ../app.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title>Connexion - FrBoost AI</title>
</head>

<body>

<h1>FrBoost AI</h1>
<h3>Connexion</h3>
<?php

if(isset($_SESSION["erreur"])){

    echo '<div style="
        color:#b00020;
        background:#ffe5e5;
        border:1px solid #ffb3b3;
        padding:10px;
        margin-bottom:15px;
        border-radius:6px;
    ">';

    echo $_SESSION["erreur"];

    echo "</div>";

    unset($_SESSION["erreur"]);
}
?>
<form action="login_process.php" method="post">

    <p>
        <label>Email</label><br>
        <input type="email" name="email" required autofocus>
    </p>

    <p>
        <label>Mot de passe</label><br>
        <input type="password" name="password" required>
    </p>

    <button type="submit">
        Se connecter
    </button>

</form>

</body>

</html>
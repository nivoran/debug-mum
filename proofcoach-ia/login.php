<?php

session_start();

require "config/database.php";


$message="";


if($_SERVER["REQUEST_METHOD"]=="POST"){


$email=$_POST['email'];
$mot_de_passe=$_POST['mot_de_passe'];


$sql="
SELECT * FROM utilisateurs 
WHERE email=?
";


$stmt=$pdo->prepare($sql);

$stmt->execute([$email]);


$user=$stmt->fetch(PDO::FETCH_ASSOC);



if($user){


    // Pour le MVP
    // comparaison simple

    if($mot_de_passe==$user['mot_de_passe']){


        $_SESSION['user_id']=$user['id'];
        $_SESSION['nom']=$user['nom'];
        $_SESSION['role']=$user['role'];


        header(
        "Location: dashboard.php"
        );

        exit();


    }else{

        $message="Mot de passe incorrect";

    }



}else{


    $message="Utilisateur introuvable";

}


}

?>


<!DOCTYPE html>

<html lang="fr">

<head>

<meta charset="UTF-8">

<title>Connexion - ProofCoach AI</title>

<link rel="stylesheet" href="assets/css/style.css">

</head>


<body>

<div class="login-container">
    <div class="login-image">
        <img src="assets/images/robot.png">
        <h1>ProofCoach AI</h1>
        <p> Votre coach intelligent pour les démonstrations mathématiques</p>
    </div>

    <div class="login-box">
        <h2>Connexion</h2>
        <?php if($message): ?>
        <p class="error"><?= $message ?></p>
        <?php endif; ?>
        <form method="POST">
            <label>Email</label>
            <input type="email" name="email" required>
            <label>Mot de passe</label>
            <input type="password" name="mot_de_passe" required>
            <button>Se connecter</button>
            </form>
    </div>
</div>

</body>

</html>
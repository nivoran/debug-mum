<?php

session_start();


if(!isset($_SESSION['user_id'])){

header("Location: login.php");
exit();

}


require "config/database.php";


$id=$_GET['id'];



// suppression démonstration
// analyse_ia sera supprimée automatiquement
// grâce au ON DELETE CASCADE


$sql="
DELETE FROM demonstrations
WHERE id=?
";


$stmt=$pdo->prepare($sql);

$stmt->execute([$id]);



// retour liste exercices

header("Location: exercices.php");

exit();


?>
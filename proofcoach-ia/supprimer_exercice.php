<?php

session_start();

if(!isset($_SESSION['user_id'])){
    header("Location: login.php");
    exit();
}


require "config/database.php";


$id=$_GET['id'];


$sql="
DELETE FROM exercices
WHERE id=?
";


$stmt=$pdo->prepare($sql);

$stmt->execute([$id]);


header("Location: exercices.php");

exit();

?>
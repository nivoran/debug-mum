<?php
require_once "../config/database.php";

$id = $_GET["id"];

$stmt = $pdo->prepare("SELECT texte FROM dictees WHERE id=?");
$stmt->execute([$id]);

$texte = $stmt->fetch(PDO::FETCH_ASSOC);

echo json_encode($texte);
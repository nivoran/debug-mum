<?php

require_once("../config/database.php");

$id = $_GET['id'] ?? null;

if(!$id){
echo json_encode(["texte"=>""]);
exit;
}

$stmt = $pdo->prepare("SELECT texte FROM dictees WHERE id=?");
$stmt->execute([$id]);

$row = $stmt->fetch(PDO::FETCH_ASSOC);

echo json_encode([
"texte"=>$row['texte']
]);
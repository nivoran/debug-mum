<?php
require_once "../config/database.php";
$niveau = $_GET['niveau'] ?? null;

if(!$niveau){
    echo "Niveau non défini";
    exit;
}

$stmt = $pdo->prepare("SELECT id, theme FROM dictees WHERE niveau = ?");
$stmt->execute([$niveau]);
$textes = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
<title>Lecture</title>
<link rel="stylesheet" href="../assets/css/style.css">
</head>

<body>

<p style="margin-top:20px;">
    <a href="../index.php" style="text-decoration:none; color:white;">← Retour à la page principale</a>
</p>

<h2>Exercice de lecture</h2>
<select id="texteSelect">
<option value="">Choisir un texte</option>
<?php
foreach($textes as $t){
echo "<option value='".$t['id']."'>".$t['theme']."</option>";
}
?>
</select>

<button onclick="chargerTexte()">Charger</button>

<hr>

<h3 id="phrase"></h3>

<button onclick="ecouter()">🔊 Ecouter</button>
<button onclick="parler()">🎤 Lire</button>
<!--button onclick="repeter()">🔁 Répéter</button-->
<button onclick="suivant()">➡ Phrase suivante</button>

<p id="reconnu"></p>

<h3 id="score"></h3>

<script src="../assets/js/lecture.js"></script>
<!--script src="../assets/js/comprehension.js"></script-->

</body>
</html>
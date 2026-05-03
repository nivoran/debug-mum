<!DOCTYPE html>
<html>
<head>
    <title>Mes tâches</title>
</head>
<body>

<h2>Liste des tâches</h2>

<form method="POST" action="index.php?action=add">
    <input type="text" name="task" placeholder="Nouvelle tâche">
    <button>Ajouter</button>
</form>

<ul>
<?php foreach ($tasks as $task): ?>
    <li><?= htmlspecialchars($task['title']) ?></li>
<?php endforeach; ?>
</ul>

</body>
</html>
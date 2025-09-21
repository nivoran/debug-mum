<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title><?= $title ?></title>
        <link href="../../public/css/cclass.css" rel="stylesheet" /> 
    </head>

<body class="e3"> 
	<h3><a href="index.php">Accueil </a></h3>
	<h3> <a href="index.php?action=profil&id=<?php echo($stud['id']) ?>>"> <?= $nam ?></a> </h3> 
	<?= $content ?>
</body>    

</html>
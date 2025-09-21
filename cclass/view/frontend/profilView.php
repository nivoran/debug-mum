<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />  
        <title> C-Class    </title> 
        <link rel="stylesheet" type="text/css" href="../../public/css/cclass.css" media="screen" />
               
  </head>


 <body class="cc"> 
 	
    <H1 class="titre"> Profil de <?php echo $stud['firstname'] ?>   </H1> 
    <a class="ser" href="index.php" > Accueil</a>
    <form id="preinscri" action ="maj.php" method="Post" >
      <p class="log">Nom 
      <input type="text" name="nom" id="nom" value=<?php echo $stud['lastname'] ?> /></p>
      <p class="log">Prénom 
      <input type="text" name="prenom" id="prenom" value=<?php echo $stud['firstname'] ?>  /> </p>
       <p class="log">e-mail
      <input type="email" name="email" id="email" value=<?php echo $stud['email'] ?>  /> </p>
      <p class="log">Télephone
      <input type="tel" name="tel" id="tel" value=<?php echo $stud['phone'] ?>  /> </p>
      <p class="log">Mot de passe actuel <input type="password" name="pwd" id="pwd"> </p>  
      <p class="log">Nouveau mot de passe  <input type="password" name="pwdnew" id="pwdnew" /></p> 
      <p class="log">Confirmez le nouveau mot de passe  <input type="password" name="pwdnew2" id="pwdnew2" /></p>
      <input type="hidden" name="id" id="id" value= <?php echo $stud['id'] ?> />
    <p><input type="submit"id="valid" value= "Validez votre nouveau mot de passe"/></p>
  </form>          	     	
  </body>
</html>
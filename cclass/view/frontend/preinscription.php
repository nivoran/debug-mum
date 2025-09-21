<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />  
        <title> C-CLASS     </title> 
        <link rel="stylesheet" type="text/css" href="public/css/cclass.css" media="screen" />
        <script src="public/js/jquery-3.4.1.js" type="text/javascript"></script>  
        <script src="public/js/changetexte.js"></script>       
  </head>


 <body class="labi"> 
  
  
  <H1 class="titre"> Inscription C-CLASS  </H1> 
  <form id="preinscri" action="index.php?action=inscription" method="Post" >
                 
   <!--p class="log">Veuillez remplir le formulaire et n\'oubliez pas de préciser le programme auquel vous voulez vous inscrire: </p-->
   <p><input type="radio" name="prog" id="prog" value="a1" checked="checked"/><label for="a1" class="log" >A1</label> <input type="radio" name="prog" id="prog" value="a2" /><label for="a2" class="log">A2</label> <input type="radio" name="prog" id="prog" value="b1" /><label for="b1" class="log">B1</label> </p>      
    <p class="log">Nom </p>
    <p><input type="text" name="lastname" id="lastname" /></p>
    <p class="log">Prénom </p>
    <p><input type="text" name="firstname" id="firstname" /> </p>
    <p class="log">Date de naissance </p>
    <p><input type="date" name="dateofbirth" id="dateofbirth" /></p>   
    <p class="log">Adresse </p>
    <p><input type="text" name="address" id="address" /></p>   
    <p class="log">Télephone </p>
    <p><input type="tel" name="phone"  id="phone"/></p>
    <p class="log">e-mail </p>
    <p><input type="email" name="email" id="email"/></p>
    
     <input type="hidden" name="id" id="id" value= <?php echo $_GET['id']?> />
    
     <input type="submit" value="Valider" />       
</form> 
 <div id="reponse"></div>               
                       
    
</body>
</html>
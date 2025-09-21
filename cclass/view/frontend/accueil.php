<!DOCTYPE html>
<html>
   <head>
	      <meta charset="utf-8" />	
        <title>  C-CLASS     </title>	
        <link rel="stylesheet" type="text/css" href="public/css/cclass.css" media="screen" />
        <script src="public/js/jquery-3.4.1.js" type="text/javascript"></script>  
        <script src="public/js/changetexte.js"></script>
   </head>
   <body class="labi">
        <div class="marge0">
           
            <img class="logo" src="public/img/logocclass.jpg"/>
            <div id="login"> 
                    
                        <p class="log">Pseudo C-CLASS</p>
			                  <p><input type="text" name="pseudo" id="pseudo"/></p>
                        <p class="log" >Mot de passe</p>
			                   <p><input type="password" name="passe" id="password_input" /></p>
                        <p id="connectSt"><a class="loga" href=# onclick='return checkPassword()'>Connexion étudiant </a></p> 
              			<p id="connectPr"><a class="loga" href=# onclick='return checkPasswordP()'>Connexion prof </a></p>
              			
                         <p id="pre"><a class="loga" href=# onclick='return checkPasswordpre()'> Inscription  </a>  </p>
              			 <p id="dem"><a class="demo" href="index.php?action=demo"> Demo  </a>  </p>
            </div>	
            
        </div>
  
     
 </body>	
</html>
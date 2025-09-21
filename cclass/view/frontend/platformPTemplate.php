<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Lektionen</title>
        <link href="../../public/css/cclass.css" rel="stylesheet" /> 
        <script type="text/javascript" src="public/js/jquery-3.4.1.js">></script>

    </head>

<body class="e3">  
	  <div id="envoi">
      <h3><a href="index.php">Accueil </a></h3>
       <form >
				    <select name='level' id='level' onchange="list()">
                   <?php 
                    while ($result=$rqp->fetch())
                        {?>
                        <option id='classid' value= <?=$result['progid'] ?> > <?=$result['classid']?> </option>  
                        <?php } // Fin de la boucle 
                    $rqp->closeCursor();?>
            </select>  
                <!--button type='button' onclick="liste()">Ouvrir</button--> 
                
			</form>	
		</div>	
    <div id="spaceCourses"> 
       <?php 
  	    while ($data = $req->fetch())
        {  
           echo '<div class="news">
             <p> 
             <a class="loga" href= "../../public/pdf/'.$help['progid'].'/'.$data['lesson'].'" target="ifram">'.$data['name'].'</a> <a class="chap" href="../../public/pdf/'.$help['progid'].'/'.$help['classid'].'_'.$data['lesson'].'" target="ifram">Kommentare </a>   
             </p>  
            </div>';
         
         } 
       $req->closeCursor();?>
    </div>
    
    <div id="container">  
          <iframe id="ifram" name="ifram"   width="804" height="654" frameborder="0" scrolling="no"></iframe>    
    </div>  

    <script>
    function list(){
       
        var sel=document.getElementById("level");
        var ind= sel.selectedIndex; 
        var text=sel.options[ind].value;
        var classid= sel.options[ind].text;
      //  var classid = JQuery(#level option:selected).text();
       
        var fd = new FormData();
        fd.append("prog",  text);
        fd.append("class",classid);
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
                if(this.readyState == 4 && this.status == 200){
                    document.getElementById("spaceCourses").innerHTML=this.responseText;
                }
            };
           
        xhr.open("POST","index.php?action=listCourses",true);
        xhr.send(fd);
            
        }
  </script>   

</body>    

</html>
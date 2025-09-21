<?php 
 $title = 'Gestion des cours';
 $nam= $stud['pseudo']; ?>
<?php ob_start(); ?>


 <div class="news">
   <?php 
    while ($parts = $req->fetch())
     {?>
     	<p> <a class="loga" target="ifram" href= "../../public/pdf/<?php echo $parts['idprog'].'/'.$parts['lesson']?>"> <?=$parts['name']?> </a>
            <a class="chap" target="ifram" href= "../../public/pdf/<?php echo $parts['idprog'].'/'.$stud['class'].'_'.$parts['lesson']?>"> Kommentare </a>
       </p> 
   <?php } ?>
       
       
 </div>
        
      
 <div id="container">  
    <iframe id="ifram" name="ifram" width="750" height="654" frameborder="0" scrolling="no"></iframe>
 </div>  
<?php $content = ob_get_clean(); ?>   

<?php require('platformTemplate.php'); ?>
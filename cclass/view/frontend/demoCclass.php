<?php $title = 'Demo'; ?>
<?php ob_start(); ?>


 <div class="news">
   <p> <a class="loga" href= "public/pdf/Uebung-B1.pdf" target="ifram"> Uebung B1 </a> </p>
  <?php $sr ="public/video/U2.mp4";?>
    
    <p><a class="loga" href="<?=$sr?>" target="ifram" >  Video: Wohnen in Berlin</a> </p>
    
 </div>
        
      
 <div id="container">  
    <iframe id="ifram" name="ifram" width="804" height="654" frameborder="0" scrolling="no"></iframe>
 </div>  
<?php $content = ob_get_clean(); ?>   
<?php require('platformTemplate.php'); ?>
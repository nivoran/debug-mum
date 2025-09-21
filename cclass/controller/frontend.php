<?php

// Chargement des classes
require_once('model/frontend/StudentManager.php');
require_once('model/frontend/PartManager.php');
require_once('model/frontend/ProfManager.php');

function accueil()
{
    require('view/frontend/accueil.php');
}

function authent($pseudo, $pwd)
{
   $studMan = new StudentManager();	
   $stud = $studMan->authentstud($pseudo, $pwd);
   return $stud;	
}
function authentP($pseudo, $pwd)
{
   $profMan = new ProfManager();	
   $prof = $profMan->authentprof($pseudo,$pwd);
   return $prof;
 }
function profil($id)
{
  $studMan = new StudentManager();  
  $stud=$studMan->getStudent($id);
  require('view/frontend/profilView.php');
}
function connexion($id)
{
    $studMan = new StudentManager();	
    $stud =$studMan->getStudent($id);

    $partMan = new PartManager ();
    $req = $partMan->getParts($stud['program']); 
    require('view/frontend/partViewCclass.php');
}
function connexionP($id)
{
    $profMan = new ProfManager();	
    $reqp =$profMan->getProg($id);
    $rqp= $profMan->getProg($id);
    $help=$reqp->fetch();
    

    $prof= $profMan->getProf($id);
    $partMan = new PartManager ();
    $req = $partMan->getParts($help['progid']);
   
    
    require('view/frontend/platformPTemplate.php');
}
function listCourses($prog,$clas)
{
  $partMan = new PartManager();
  $req=$partMan->getParts($prog);
  
  while ($data = $req->fetch())
        {  
       echo '<div class="news">
             <p> 
             <a class="loga" href= "../../public/pdf/'.$prog.'/'.$data['lesson'].'" target="ifram">'.$data['name'].'</a> <a class="chap" href="../../public/pdf/'.$prog.'/'.$clas.'_'.$data['lesson'].'" target="ifram">Kommentare </a>   
             </p>  
            </div>';
         
         } 
   $req->closeCursor();
}
function demo()
{
    require('view/frontend/demoCclass.php');
}
function preinscription($id)
{
	$studMan = new StudentManager();
	require('view/frontend/preinscription.php');
	//$studMan->updateStudent($id);
}
function inscription($id, $prog, $lastname, $firstname, $address, $dateofbirth, $phone, $email)
{
	$studMan = new StudentManager();
	$studMan->updateStudent($id, $prog, $lastname, $firstname, $address, $dateofbirth, $phone, $email);
	 require('view/frontend/endViewCclass.php');
}
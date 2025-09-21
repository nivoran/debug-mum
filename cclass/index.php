<?php
require('controller/frontend.php');

try{
    if (isset($_GET['action']))
     {    
    	
      		if ($_GET['action'] == 'preinscription' )
         	{       
     		 	if (isset($_GET['id']) && $_GET['id'] > 0 )
             	{
                    preinscription($_GET['id']);
             	}
             	else 
            	{
                  throw new Exception('Erreur : les champs ne sont pas tous remplis !');
             	}
        	} 
       
    		elseif ($_GET['action'] == 'connexion' )
         	{       
         		if (isset($_GET['id']) && $_GET['id'] > 0 )
             	{
                    connexion($_GET['id']);
             	}
         		else
             	{
                  throw new Exception('Erreur : les champs ne sont pas tous remplis !');
             	}
         	}
        
          elseif ($_GET['action'] == 'connexionP' )
             {       
             if (isset($_GET['id']) && $_GET['id'] > 0 )
             	{
               	connexionP($_GET['id']);
             	}
             else
             	{
             	throw new Exception('Erreur : les champs ne sont pas tous remplis !');
             	}
            }
     
          elseif ($_GET['action'] == 'listCourses') 
            {
                if (isset($_POST['prog']) && isset($_POST['class']) ) 
                 {
                    listCourses($_POST['prog'],$_POST['class']);
                 }
                else 
                {
                    throw new Exception('Erreur !');
                }
            }
       
         elseif ($_GET['action'] == 'demo' )
             {       
                demo();            
              } 
    
         elseif ($_GET['action'] == 'profil' )
             {       
             if (isset($_GET['id']) && $_GET['id'] > 0 )
                 {
                        profil($_GET['id']);
                 }
             else 
             	{
                    throw new Exception('Erreur : les champs ne sont pas tous remplis !');
               	}
           }
      
        elseif ($_GET['action'] == 'inscription') 
             {
                if (isset($_POST['id'])) 
                    $id=$_POST['id'];

                if (isset($_POST['prog']))
                  { if ($_POST['prog']=='a1')
                      $prog='A1';
                    else if ($_POST['prog']=='a2')
                      $prog='A2';
                    else if ($_POST['prog']=='b1')
                      $prog='B1';
                  }
                if (isset($_POST['lastname']))
                    $lastname=$_POST['lastname'];
                else    
                    $lastname='inconnu';

                if (isset($_POST['firstname']))
                    $firstname=$_POST['firstname'];
                else
                    $firstname='inconnu';

                if (isset($_POST['address']))
                    $address=$_POST['address'];
                else
                    $address='inconnue';    

                if (isset($_POST['dateofbirth']))
                    $dateofbirth=$_POST['dateofbirth'];
                else
                    $dateofbirth='1000-01-01';    

                if (isset($_POST['phone']))
                    $phone= $_POST['phone'];
                else
                    $phone= '';     

                if (isset($_POST['email']))
                    $email=$_POST['email'];
                else
                    $email='';    
           
                 inscription($id, $prog, $lastname, $firstname, $address, $dateofbirth, $phone, $email);
                 
                 }
            elseif ($_GET['action'] == 'authentprof' ) 
             {

                    header("Content-Type: application/json; charset=UTF-8");
                    $obj = json_decode($_POST["x"], false);  
                    class Message
                         {
                             public $_msg;
                             public $_id;
                         }

                   
                    if (isset($obj->pseudo) && isset($obj->pwd)) 
                       {
                        $prof=authentP($obj->pseudo, $obj->pwd);
                        if($prof)
                         {
                            $myObj=new Message;
                            $myObj->_msg = "OK";
                            $myObj->_id = $prof['id'];
                            $myJSON = json_encode($myObj);
                            echo $myJSON;
                          } 
                        
                        else 
                         {
                            $myObj->_msg = "échec";
                            $myObj->_id = "-1";
                            $myJSON = json_encode($myObj);
                            echo $myJSON;
                          }
                      }
                    else
                    {
                        $myObj->_msg = "échec";
                        $myObj->_id = "-2";
                        $myJSON = json_encode($myObj);
                        echo $myJSON;
                    }               
             }  

           elseif ($_GET['action'] == 'authent' ) 
             {
                     header("Content-Type: application/json; charset=UTF-8");
                     $obj = json_decode($_POST["x"], false);       
                     if (isset($obj->pseudo)&& isset($obj->pwd)) 
                     {
                      	 $stud=authent($obj->pseudo, $obj->pwd);
                       	class Message
                       	{
                           public $_msg;
                           public $_name;
                           public $_id;
                           public $_prog;
                        }
                      	$myObj=new Message;
                        if($stud)
                       		{
                            $myObj->_msg = "OK";
                            $myObj->_name = $stud['firstname'];
                            $myObj->_id = $stud['id'];
                            $myObj->_prog =$stud['program'];
                            $myJSON = json_encode($myObj);
                            echo $myJSON;
                            }
                        else 
                           {
                              $myObj->_msg = "échec";
                              $myObj->_id = "-1";
                              $myJSON = json_encode($myObj);
                              echo $myJSON;
                            }
                     }
                   else
                    {
                        $myObj->_msg = "échec";
                        $myObj->_id = "-2";
                        $myJSON = json_encode($myObj);
                        echo $myJSON;
                    }               
        	   }
       
           
    }
    else {    
    	accueil();
      }
  
   } 
catch(Exception $e) 
	{ // S'il y a eu une erreur, alors...    
    	echo $e->getMessage();
	}
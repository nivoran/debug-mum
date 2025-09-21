<?php
class ProfManager
{
    public function getProfs()
    {
        $db = $this->dbConnect();
        $req = $db->query('SELECT * FROM teacher');

        return $req;
    }

    public function getProf($profId)
    {
       $db = $this->dbConnect();
       $req = $db->prepare('SELECT * FROM teacher WHERE id = ?');
       $req->execute(array($profId));
       $prof = $req->fetch();
       return $prof;
    }
  public function getProg($profId)
    {
       $db = $this->dbConnect();
       $reqp = $db->prepare('SELECT * FROM teacherprog WHERE teachid = ?');
       $reqp->execute(array($profId));
      // $tprog = $req->fetch();
       return $reqp;
    }
 public function authentprof($pseudo,$pwd)
    {
       $db = $this->dbConnect();
       $req = $db->prepare('SELECT * FROM teacher WHERE pseudo=? and code=?');
       $req->execute(array($pseudo,$pwd));
       $prof = $req->fetch();
       return $prof;
    }

  private function dbConnect()
    {
        //$db = new PDO('mysql:host=localhost;dbname=labirint_cclass;charset=utf8', 'labirint_cclass', 'lishundAsup1966');
        $db = new PDO('mysql:host=localhost;dbname=cclass;charset=utf8', 'root', '');
        return $db;
    }

  public function updateProf($id, $lastname, $firstname, $phone, $email)
  {
     $db= $this->dbConnect();
     $req= $db->prepare('UPDATE student SET lastname=?, firstname=?,  email=? , phone=? ,  WHERE id= ?');
     $req->execute(array($lastname, $firstname,$email, $phone));
  } 
}
<?php
class StudentManager
{
    public function getStudents()
    {
        $db = $this->dbConnect();
         $req = $db->query('SELECT id, lastname, firstname, DATE_FORMAT(dateofbirth, \'%d/%m/%Y\') AS date_of_birth FROM student ORDER BY date_of_birth DESC LIMIT 0, 10');

        return $req;
    }

    public function getStudent($studId)
    {
       $db = $this->dbConnect();
       $req = $db->prepare('SELECT * FROM student WHERE id = ?');
       $req->execute(array($studId));
       $stud = $req->fetch();
       return $stud;
    }

     public function authentstud($pseudo,$pwd)
    {
       $db = $this->dbConnect();
       $req = $db->prepare('SELECT * FROM student WHERE pseudo=? and code=?');
       $req->execute(array($pseudo,$pwd));
       $stud = $req->fetch();
       return $stud;
    }

    private function dbConnect()
    {
       // $db = new PDO('mysql:host=localhost;dbname=labirint_cclass;charset=utf8', 'labirint_cclass', 'lishundAsup1966');
      $db = new PDO('mysql:host=localhost;dbname=cclass;charset=utf8', 'root', '');
        return $db;
    }

     public function updateStudent($id, $prog, $lastname, $firstname, $address, $dateofbirth, $phone, $email)
  {
     $db= $this->dbConnect();
     $req= $db->prepare('UPDATE student SET lastname=?, firstname=?, dateofbirth=?, email=? , phone=? , address=?, program=?  WHERE id= ?');
     $req->execute(array($lastname, $firstname, $dateofbirth,$email, $phone,$address, $prog,$id));
  } 
}
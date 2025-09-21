<?php
class PartManager
{
    public function getParts($prog)
    {
        $db = $this->dbConnect();
         $req = $db->query("SELECT * FROM part WHERE idprog='$prog' ORDER BY step ");

        return $req;
    }

   public function getPartcomment($partid, $classid)
    {
        $db = $this->dbConnect();
        $req = $db->query("SELECT * FROM partcomment WHERE partid='$partid' and classid='$classid'");
        $partc= $req->fetch();    
        return $partc;
    }


    
    private function dbConnect()
    {
       // $db = new PDO('mysql:host=localhost;dbname=labirint_cclass;charset=utf8', 'labirint_cclass', 'lishundAsup1966');
        $db = new PDO('mysql:host=localhost;dbname=labirint_cclass;charset=utf8', 'root', '');
        return $db;
    }

   
}
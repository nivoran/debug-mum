<?php

class User extends Model
{
    /*
    |-----------------------------------------
    | Récupérer tous les utilisateurs
    |-----------------------------------------
    */
    public function getAll()
    {
        $query = $this->db->query(
            "SELECT * FROM users ORDER BY id DESC"
        );

        return $query->fetchAll(PDO::FETCH_ASSOC);
    }

    /*
    |-----------------------------------------
    | Trouver un utilisateur par email
    |-----------------------------------------
    */
    public function findByEmail($email)
    {
        $sql = "SELECT * FROM users WHERE email = ?";

        $stmt = $this->db->prepare($sql);

        $stmt->execute([$email]);

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    /*
    |-----------------------------------------
    | Ajouter un utilisateur
    |-----------------------------------------
    */
    public function create($data)
    {
        $sql = "INSERT INTO users(email, password)
                VALUES(?, ?)";

        $stmt = $this->db->prepare($sql);

        return $stmt->execute([
            $data['email'],
            password_hash($data['password'], PASSWORD_DEFAULT)
        ]);
    }

    /*
    |-----------------------------------------
    | Supprimer un utilisateur
    |-----------------------------------------
    */
    public function delete($id)
    {
        $sql = "DELETE FROM users WHERE id = ?";

        $stmt = $this->db->prepare($sql);

        return $stmt->execute([$id]);
    }
}
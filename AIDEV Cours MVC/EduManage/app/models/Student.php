<?php

class Student extends Model
{
    public function getAll()
    {
        $query = $this->db->query(
            "SELECT * FROM students ORDER BY id DESC"
        );

        return $query->fetchAll(PDO::FETCH_ASSOC);
    }

    public function create($data)
    {
        $sql = "INSERT INTO students(
                    firstname,
                    lastname,
                    email,
                    phone,
                    birthdate,
                    photo
                )
                VALUES (?, ?, ?, ?, ?, ?)";

        $stmt = $this->db->prepare($sql);

        return $stmt->execute([
            $data['firstname'],
            $data['lastname'],
            $data['email'],
            $data['phone'],
            $data['birthdate'],
            $data['photo']
        ]);
    }
}
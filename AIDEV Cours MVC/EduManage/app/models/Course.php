<?php

class Course extends Model
{
    /*
    |-----------------------------------------
    | Liste des cours
    |-----------------------------------------
    */
    public function getAll()
    {
        $query = $this->db->query(
            "SELECT * FROM courses ORDER BY id DESC"
        );

        return $query->fetchAll(PDO::FETCH_ASSOC);
    }

    /*
    |-----------------------------------------
    | Ajouter un cours
    |-----------------------------------------
    */
    public function create($data)
    {
        $sql = "INSERT INTO courses(
                    title,
                    description,
                    duration,
                    level
                )
                VALUES (?, ?, ?, ?)";

        $stmt = $this->db->prepare($sql);

        return $stmt->execute([
            $data['title'],
            $data['description'],
            $data['duration'],
            $data['level']
        ]);
    }

    /*
    |-----------------------------------------
    | Trouver un cours
    |-----------------------------------------
    */
    public function find($id)
    {
        $sql = "SELECT * FROM courses WHERE id = ?";

        $stmt = $this->db->prepare($sql);

        $stmt->execute([$id]);

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    /*
    |-----------------------------------------
    | Modifier un cours
    |-----------------------------------------
    */
    public function update($data, $id)
    {
        $sql = "UPDATE courses
                SET title = ?,
                    description = ?,
                    duration = ?,
                    level = ?
                WHERE id = ?";

        $stmt = $this->db->prepare($sql);

        return $stmt->execute([
            $data['title'],
            $data['description'],
            $data['duration'],
            $data['level'],
            $id
        ]);
    }

    /*
    |-----------------------------------------
    | Supprimer un cours
    |-----------------------------------------
    */
    public function delete($id)
    {
        $sql = "DELETE FROM courses WHERE id = ?";

        $stmt = $this->db->prepare($sql);

        return $stmt->execute([$id]);
    }
}
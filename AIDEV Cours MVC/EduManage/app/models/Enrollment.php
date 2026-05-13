<?php

class Enrollment extends Model
{
    /*
    |-----------------------------------------
    | Liste des inscriptions
    |-----------------------------------------
    */
    public function getAll()
    {
        $sql = "SELECT 
                    enrollments.*,
                    students.firstname,
                    students.lastname,
                    courses.title
                FROM enrollments
                INNER JOIN students
                    ON enrollments.student_id = students.id
                INNER JOIN courses
                    ON enrollments.course_id = courses.id
                ORDER BY enrollments.id DESC";

        $query = $this->db->query($sql);

        return $query->fetchAll(PDO::FETCH_ASSOC);
    }

    /*
    |-----------------------------------------
    | Ajouter une inscription
    |-----------------------------------------
    */
    public function create($data)
    {
        $sql = "INSERT INTO enrollments(
                    student_id,
                    course_id,
                    enrollment_date,
                    status
                )
                VALUES (?, ?, ?, ?)";

        $stmt = $this->db->prepare($sql);

        return $stmt->execute([
            $data['student_id'],
            $data['course_id'],
            $data['enrollment_date'],
            $data['status']
        ]);
    }

    /*
    |-----------------------------------------
    | Supprimer une inscription
    |-----------------------------------------
    */
    public function delete($id)
    {
        $sql = "DELETE FROM enrollments WHERE id = ?";

        $stmt = $this->db->prepare($sql);

        return $stmt->execute([$id]);
    }
}
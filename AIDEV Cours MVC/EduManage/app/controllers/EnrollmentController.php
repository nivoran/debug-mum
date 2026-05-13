<?php

require ROOT .'/app/models/Enrollment.php';
require ROOT .'/app/models/Student.php';
require ROOT .'/app/models/Course.php';

class EnrollmentController extends Controller
{
    /*
    |-----------------------------------------
    | Liste des inscriptions
    |-----------------------------------------
    */
    public function index()
    {
        $enrollmentModel = new Enrollment();

        $enrollments = $enrollmentModel->getAll();

        $this->view('enrollments/index', [
            'enrollments' => $enrollments
        ]);
    }

    /*
    |-----------------------------------------
    | Ajouter une inscription
    |-----------------------------------------
    */
    public function create()
    {
        $studentModel = new Student();
        $courseModel = new Course();

        $students = $studentModel->getAll();
        $courses = $courseModel->getAll();

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {

            $enrollmentModel = new Enrollment();

            $enrollmentModel->create([
                'student_id' => $_POST['student_id'],
                'course_id' => $_POST['course_id'],
                'enrollment_date' => $_POST['enrollment_date'],
                'status' => $_POST['status']
            ]);

            header('Location: index.php?url=enrollment/index');
            exit;
        }

        $this->view('enrollments/create', [
            'students' => $students,
            'courses' => $courses
        ]);
    }

    /*
    |-----------------------------------------
    | Supprimer une inscription
    |-----------------------------------------
    */
    public function delete($id)
    {
        $enrollmentModel = new Enrollment();

        $enrollmentModel->delete($id);

        header('Location: index.php?url=enrollment/index');
        exit;
    }
}
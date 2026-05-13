<?php

require ROOT .'/app/models/Student.php';

class StudentController extends Controller
{
    public function index()
    {
        $studentModel = new Student();
        $students = $studentModel->getAll();

        $this->view('students/index', [
            'students' => $students
        ]);
    }

    public function create()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {

            $photo = $_FILES['photo']['name'];
            $tmp = $_FILES['photo']['tmp_name'];

            move_uploaded_file($tmp, '../public/uploads/' . $photo);

            $studentModel = new Student();

            $studentModel->create([
                'firstname' => $_POST['firstname'],
                'lastname' => $_POST['lastname'],
                'email' => $_POST['email'],
                'phone' => $_POST['phone'],
                'birthdate' => $_POST['birthdate'],
                'photo' => $photo
            ]);

            header('Location: index.php?url=student/index');
        }

        $this->view('students/create');
    }
}
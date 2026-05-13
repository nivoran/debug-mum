<?php

require ROOT .'/app/models/Course.php';

class CourseController extends Controller
{
    /*
    |-----------------------------------------
    | Liste des cours
    |-----------------------------------------
    */
    public function index()
    {
        $courseModel = new Course();

        $courses = $courseModel->getAll();

        $this->view('courses/index', [
            'courses' => $courses
        ]);
    }

    /*
    |-----------------------------------------
    | Ajouter un cours
    |-----------------------------------------
    */
    public function create()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {

            $courseModel = new Course();

            $courseModel->create([
                'title' => $_POST['title'],
                'description' => $_POST['description'],
                'duration' => $_POST['duration'],
                'level' => $_POST['level']
            ]);

            header('Location: index.php?url=course/index');
            exit;
        }

        $this->view('courses/create');
    }

    /*
    |-----------------------------------------
    | Modifier un cours
    |-----------------------------------------
    */
    public function edit($id)
    {
        $courseModel = new Course();

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {

            $courseModel->update([
                'title' => $_POST['title'],
                'description' => $_POST['description'],
                'duration' => $_POST['duration'],
                'level' => $_POST['level']
            ], $id);

            header('Location: index.php?url=course/index');
            exit;
        }

        $course = $courseModel->find($id);

        $this->view('courses/edit', [
            'course' => $course
        ]);
    }

    /*
    |-----------------------------------------
    | Supprimer un cours
    |-----------------------------------------
    */
    public function delete($id)
    {
        $courseModel = new Course();

        $courseModel->delete($id);

        header('Location: index.php?url=course/index');
        exit;
    }
}
<?php

require_once "models/Task.php";

class TaskController {

    private $model;

    public function __construct($pdo) {
        $this->model = new Task($pdo);
    }

    public function handleRequest() {

        $action = $_GET['action'] ?? 'list';

        switch ($action) {

            case 'add':
                if (isset($_POST['task'])) {
                    $this->model->addTask($_POST['task']);
                }
                header("Location: index.php?action=list");
                break;

            case 'list':
            default:
                $tasks = $this->model->getTasks();
                require "views/tasks.php";
                break;
        }
    }
}
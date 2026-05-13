<?php

class DashboardController extends Controller
{
    public function index()
    {
        // Protection : utilisateur connecté obligatoire
        if (!isset($_SESSION['user'])) {

            header('Location: index.php?url=auth/login');
            exit;
        }

        $this->view('dashboard/index', [
            'user' => $_SESSION['user']
        ]);
    }
}
<?php

require ROOT .'/app/models/User.php';

class AuthController extends Controller
{
    
    /*Inscription*/
    public function register()
    {
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {

        $userModel = new User();

        $userModel->create([
            'email' => $_POST['email'],
            'password' => $_POST['password']
        ]);

        header('Location: index.php?url=auth/login');
        exit;
    }

    $this->view('auth/register');
    }
    /*
    |-----------------------------------------
    | Formulaire de connexion
    |-----------------------------------------
    */
    public function login()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {

            $email = $_POST['email'];
            $password = $_POST['password'];

            $userModel = new User();

            $user = $userModel->findByEmail($email);

            if ($user && password_verify($password, $user['password'])) {

                $_SESSION['user'] = $user;

                header('Location: index.php?url=dashboard/index');
               
                exit;

            } else {

                $error = "Email ou mot de passe incorrect";

                $this->view('auth/login', [
                    'error' => $error
                ]);
            }
        }

        $this->view('auth/login');
    }

    /*
    |-----------------------------------------
    | Déconnexion
    |-----------------------------------------
    */
    public function logout()
    {
        session_destroy();

        header('Location: index.php?url=auth/login');
        exit;
    }
}
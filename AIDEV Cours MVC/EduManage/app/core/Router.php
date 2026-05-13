<?php

class Router
{
    public function dispatch()
    {
        $url = $_GET['url'] ?? 'auth/login';

        $url = explode('/', $url);

        $controllerName = ucfirst($url[0]) . 'Controller';
        $method = $url[1] ?? 'index';

        $controllerPath = ROOT . "/app/controllers/$controllerName.php";

        // Vérifie si le controller existe
        if (!file_exists($controllerPath)) {
            die("Controller introuvable : $controllerName");
        }

        require $controllerPath;

        $controller = new $controllerName();

        // Vérifie si la méthode existe (BONNE PRATIQUE)
        if (!method_exists($controller, $method)) {
            die("Méthode introuvable : $method");
        }

        call_user_func([$controller, $method]);
    }
}
<?php

class Controller
{
    public function view($path, $data = [])
    {
        extract($data);
        require ROOT ."/app/views/$path.php";
    }
}
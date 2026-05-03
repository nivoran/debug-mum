<?php

class Task {

    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function addTask($task) {
        $stmt = $this->pdo->prepare("INSERT INTO tasks (title) VALUES (?)");
        $stmt->execute([$task]);
    }

    public function getTasks() {
        $stmt = $this->pdo->query("SELECT * FROM tasks");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
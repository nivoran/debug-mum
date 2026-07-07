<?php
$apiKey = "AIzaSyDL3Slyyw2WPy-zj6brAI4PqM9m0jvQNuE";
$url = "https://generativelanguage.googleapis.com/v1beta/models?key=".$apiKey;

$ch = curl_init($url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$response = curl_exec($ch);
curl_close($ch);

echo $response; // Regardez bien les noms sous "name": "models/..."
?>
<?php

require_once("../config/config.php");

function generateText($theme){

    //$apiKey = "TA_CLE_API_OPENAI";   // mettre ta clé ici
     global $OPENAI_API_KEY;

    $prompt = "Écris une dictée de 120 mots pour un étudiant apprenant le français sur le thème : $theme.";

    $data = [
        "model" => "gpt-4.1-mini",
        "messages" => [
            [
                "role" => "user",
                "content" => $prompt
            ]
        ]
    ];

    $ch = curl_init();

    curl_setopt($ch, CURLOPT_URL, "https://api.openai.com/v1/chat/completions");
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);

    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        "Content-Type: application/json",
        "Authorization: Bearer " . $OPENAI_API_KEY
    ]);

    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));

    $response = curl_exec($ch);

    curl_close($ch);

    $result = json_decode($response, true);

    return $result["choices"][0]["message"]["content"];
}

?>
<?php

require_once __DIR__ . '/../config/config.php';

function genererTexte($theme, $niveau){

$prompt = "Write a British English dictation text for level ".$niveau." without any additional instructions, of approximately 120 words on the theme: ".$theme;

return appelerGemini($prompt);
}

function genererDefinitions($mots){

    $liste = implode(", ", $mots);

    $prompt = $prompt = "For each of the following words: ".$liste.", provide a very simple definition in English (A2-B1 level). Respond ONLY in valid JSON with no surrounding text: {\"word\":\"short definition\"}";

    // appel à ton IA (comme genererTexte)
    $reponse = appelerGemini($prompt);
    $reponse = nettoyerJSON($reponse);
    $json = json_decode($reponse, true);

    return json_decode($reponse, true);
}

function appelerGemini($prompt){

    $apiKey = GEMINI_API_KEY;
    $url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=".$apiKey;

    $data = [
        "contents" => [
            [
                "parts" => [
                    ["text" => $prompt]
                ]
            ]
        ]
    ];

    $options = [
        "http" => [
            "header"  => "Content-Type: application/json",
            "method"  => "POST",
            "content" => json_encode($data)
        ]
    ];

    $context  = stream_context_create($options);
    $response = file_get_contents($url, false, $context);
   //$response = @file_get_contents($url);
    if ($response === false) {
        $error = error_get_last();
        return "Gemini error : " .
           ($error['message'] ?? 'Unknown error');
    }
    
    $result = json_decode($response, true);

    //return $result["candidates"][0]["content"]["parts"][0]["text"] ?? "";
    if(isset($result["candidates"][0]["content"]["parts"][0]["text"])){
    return $result["candidates"][0]["content"]["parts"][0]["text"];
}

return "";
}

function nettoyerJSON($texte){

    if(preg_match('/\{.*\}/s', $texte, $match)){
        return $match[0];
    }

    return null;
}

function demarrerConversation($theme, $niveau){
$prompt = "
You are a British English conversation partner.

The theme of the discussion is: ".$theme."

Never ask for the topic of the conversation.

Start the discussion immediately.

Speak naturally.

Ask only one question at a time.

Adapt your level to an English learner.
";
return appelerGemini($prompt);
}

function continuerConversation($messages)
{
    $prompt = "";

    foreach ($messages as $message) {

        if ($message["role"] == "system") {
            $prompt .= "Instructions : "
                    . $message["content"]
                    . "\n\n";
        }

        elseif ($message["role"] == "assistant") {
            $prompt .= "IA : "
                    . $message["content"]
                    . "\n";
        }

        elseif ($message["role"] == "user") {
            $prompt .= "Étudiant : "
                    . $message["content"]
                    . "\n";
        }
    }
    
    $dernierMessageEtudiant = $message["content"];
    $prompt .= "\n Naturally continue this conversation."; 
    $prompt .= "Reply to the student whose message is ".$dernierMessageEtudiant." then ask a single question to keep the conversation going.";

    return appelerGemini($prompt);
}

function corrigerRedaction($redaction){
 $prompt = "You are an English as a Foreign Language (EFL) corrector. Analyze the following essay. Provide:\n"
        . "- a score out of 20\n"
        . "- a list of the main mistakes\n"
        . "- advice for improvement\n\n"
        . "Respond ONLY in the following JSON format:\n\n"
        . "{\n"
        . "  \"score\": 15,\n"
        . "  \"mistakes\": [\n"
        . "      \"Agreement error in...\",\n"
        . "      \"Tense error in...\"\n"
        . "  ],\n"
        . "  \"advice\": [\n"
        . "      \"Vary your vocabulary more\",\n"
        . "      \"Use more logical connectors\"\n"
        . "  ]\n"
        . "}\n\n"
        . "Essay:\n\n"
        . $redaction;
 return appelerGemini($prompt);

}

function ameliorerRedaction($redaction){

$prompt = "
You are an expert assistant in written expression and pedagogy.

Your mission is to improve the following piece of writing.

You must:
- preserve the student's original ideas;
- do not change the meaning of the text;
- improve the fluency of sentences;
- enrich the vocabulary;
- correct awkward or unclear phrasing;
- improve logical connectors;
- make the text clearer and more natural;
- adapt the level to a student.

Reply ONLY with the improved text.
Do not provide any explanation.
Do not add any comment before or after the text.

Original writing:

$redaction
";
return appelerGemini($prompt);

}
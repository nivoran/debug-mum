<?php

require_once __DIR__ . '/../config/config.php';

function genererTexte($theme, $niveau){

$prompt = "Écris un texte de dictée de niveau ".$niveau."  en français sans instructions supplémentaires, de 120 mots sur le thème : ".$theme;

return appelerGemini($prompt);
}

function genererDefinitions($mots){

    $liste = implode(", ", $mots);

    $prompt = "Pour chaque mot suivant : $liste, donne une définition très simple en français (niveau A2-B1).
    Réponds UNIQUEMENT en JSON valide sans texte autour :
    {\"mot\":\"definition courte\"}";

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
        return "Erreur Gemini : " .
           ($error['message'] ?? 'Erreur inconnue');
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
Tu es un partenaire de conversation en français.

Le thème de la discussion est :". $theme.

" Ne demande jamais le sujet de la conversation.

Commence immédiatement la discussion.

Parle naturellement.

Pose une seule question à la fois.

Adapte ton niveau à un apprenant de français.
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
    $prompt .= "\nContinue naturellement cette conversation. ";
    $prompt .= "Réponds à l'étudiant dont le message est ". $dernierMessageEtudiant ." puis pose une seule question pour poursuivre l'échange.";

    return appelerGemini($prompt);
}

function corrigerRedaction($redaction){
 $prompt = "
Tu es un correcteur de français langue étrangère. Analyse la rédaction suivante.Attribue :
- une note sur 20
- une liste des principales fautes
- des conseils d'amélioration

Réponds UNIQUEMENT au format JSON suivant :

{
  \"note\": 15,
  \"fautes\": [
      \"Erreur d'accord dans ...\",
      \"Erreur de conjugaison dans ...\"
  ],
  \"conseils\": [
      \"Varier davantage le vocabulaire\",
      \"Utiliser plus de connecteurs logiques\"
  ]
}

Rédaction :

$redaction
";
 return appelerGemini($prompt);

}
function ameliorerRedaction($redaction){

$prompt = "
Tu es un assistant expert en expression écrite française et en pédagogie.

Ta mission est d'améliorer la rédaction suivante.

Tu dois :
- conserver les idées originales de l'étudiant ;
- ne pas changer le sens du texte ;
- améliorer la fluidité des phrases ;
- enrichir le vocabulaire ;
- corriger les formulations maladroites ;
- améliorer les connecteurs logiques ;
- rendre le texte plus clair et plus naturel ;
- adapter le niveau à un étudiant.

Réponds UNIQUEMENT avec le texte amélioré.
Ne donne aucune explication.
Ne mets pas de commentaire avant ou après.

Rédaction originale :

$redaction
";

return appelerGemini($prompt);

}
<?php

require "../config/database.php";
require "../config/gemini.php";

if ($_SERVER["REQUEST_METHOD"] != "POST") {
    die("Accès interdit.");
}


// ===========================
// Récupération des données
// ===========================

$exo = intval($_POST["exo"]);
$texte = trim($_POST["solution"]);

if ($exo <= 0 || empty($texte)) {
    die("Données invalides.");
}


// ===========================
// Récupérer l'énoncé
// ===========================

$stmt = $pdo->prepare("
SELECT enonce
FROM exercices
WHERE id = ?
");

$stmt->execute([$exo]);

$enonce = $stmt->fetchColumn();

if (!$enonce) {
    die("Exercice introuvable.");
}


// ===========================
// Enregistrer la démonstration
// ===========================

$stmt = $pdo->prepare("
INSERT INTO demonstrations
(exo_id, contenu, date_envoi)

VALUES
(?,?,NOW())
");

$stmt->execute([
    $exo,
    $texte
]);

$demonstration_id = $pdo->lastInsertId();


// ===========================
// Construire le prompt
// ===========================

$prompt = "

Tu es ProofCoach AI, un professeur de mathématiques expérimenté spécialisé dans les démonstrations.

Tu dois corriger la démonstration d'un étudiant de manière bienveillante, rigoureuse et pédagogique.

================================================

ÉNONCÉ

$enonce

================================================

DÉMONSTRATION DE L'ÉTUDIANT

$texte

================================================

Ta mission :

1. Évaluer la logique de la démonstration sur 100.

2. Évaluer la qualité de la rédaction sur 100.

3. Donner un niveau de confiance compris entre 0 et 1.

4. Rédiger un résumé en 2 ou 3 phrases.

5. Produire une analyse détaillée.

6. Lister exactement trois points forts.

7. Lister exactement trois points à améliorer.

8. Rédiger une démonstration modèle complète.

IMPORTANT :

La démonstration modèle doit être directement affichable dans une page HTML.

Les formules mathématiques doivent uniquement utiliser les délimiteurs
\$...\$ ou \$\$...\$\$.

Ne produis jamais un document LaTeX complet.

N'utilise jamais les commandes suivantes :

\documentclass
\usepackage
\begin
\end
\section
\subsection
\chapter
\maketitle

Le champ solution_modele doit contenir uniquement le corps de la démonstration, prêt à être affiché dans une page HTML.

La réponse doit être du texte simple pouvant être affiché directement dans une page HTML.

Ne réponds JAMAIS avec une simple définition ou un rappel de théorème.

================================================

Retourne UNIQUEMENT le JSON suivant :

{
  \"score_logique\":85,
  \"score_redaction\":80,
  \"niveau_confiance\":0.93,

  \"resume\":\"...\",

  \"analyse_complete\":\"...\",

  \"points_forts\":[
      \"...\",
      \"...\",
      \"...\"
  ],

  \"points_a_ameliorer\":[
      \"...\",
      \"...\",
      \"...\"
  ],

  \"solution_modele\":\"...\"
}
Retourne UNIQUEMENT un objet JSON valide.

Ne mets jamais :

- de balises Markdown (``` ou ```json),
- de document LaTeX,
- de commentaires,
- de texte avant le JSON,
- de texte après le JSON.


";

// ===========================
// Appel Gemini
// ===========================

$response = demanderGemini($prompt);


// ===========================
// Vérification réponse
// ===========================

if (!isset($response["candidates"])) {

    if (isset($response["error"])) {

    $code = $response["error"]["code"] ?? "";
    $message = $response["error"]["message"] ?? "Erreur inconnue";

    if ($code == 503) {
        die("
        <h2>🤖 Gemini est momentanément indisponible</h2>

        <p>
        Les serveurs Gemini sont actuellement très sollicités.
        Veuillez réessayer dans quelques instants.
        </p>

        <a href='javascript:history.back()'>
            ← Retour
        </a>
        ");
    }

    die($message);
}
    echo "<pre>";
    print_r($response);
    echo "</pre>";

    exit();
}


// ===========================
// Texte renvoyé
// ===========================

$json = $response["candidates"][0]["content"]["parts"][0]["text"] ?? "";

$json = str_replace(
    ["```json", "```"],
    "",
    $json
);

$json = trim($json);


// ===========================
// Décodage JSON
// ===========================

$data = json_decode($json, true);

if (json_last_error() !== JSON_ERROR_NONE) {

    echo "<h2>Erreur JSON :</h2>";

    echo json_last_error_msg();

    echo "<hr>";

    echo "<pre>";

    echo htmlspecialchars($json);

    echo "</pre>";

    exit();

}


// ===========================
// Récupération des champs
// ===========================

$analyse_complete = $data["analyse_complete"] ?? "";

$resume = $data["resume"] ?? "";

$score_logique = intval($data["score_logique"] ?? 0);

$score_redaction = intval($data["score_redaction"] ?? 0);

$niveau_confiance = floatval($data["niveau_confiance"] ?? 0);


// ===========================
// Enregistrer l'analyse
// ===========================

$stmt = $pdo->prepare("
INSERT INTO analyses_ia
(
analyse_complete,
date_analyse,
demonstration_id,
niveau_confiance,
resume,
score_logique,
score_redaction
)

VALUES
(
?,
NOW(),
?,
?,
?,
?,
?
)
");

$stmt->execute([

    $analyse_complete,
    $demonstration_id,
    $niveau_confiance,
    $resume,
    $score_logique,
    $score_redaction

]);


// ===========================
// Redirection
// ===========================

header("Location: ../analyse.php?id=".$demonstration_id);

exit();
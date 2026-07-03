<?php

session_start();

if(!isset($_SESSION['user_id'])){
    header("Location: login.php");
    exit();
}


require "config/database.php";

$id=$_GET['id'];
$stmt=$pdo->prepare("SELECT * FROM exercices WHERE id=?");
$stmt->execute([$id]);
$exo=$stmt->fetch();
?>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Démonstration - ProofCoach AI</title>
        <link rel="stylesheet" href="assets/css/style.css">
        <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">

        <script>
        window.MathJax = {
            tex: {
                inlineMath: [['$', '$'], ['\\(', '\\)']],
                displayMath: [['$$','$$'], ['\\[','\\]']]
            }
            };
        </script>

    <script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
    </head>
<body>

<div class="layout">

<!-- MENU -->
    <aside class="sidebar">
        <h2>🧠 ProofCoach AI</h2>
        <a href="dashboard.php">▣ Tableau de bord</a>
        <!--a class="active">⊕ Nouvel exercice</a-->
        <a href="generer_exercice.php">⊕ Nouvel exercice</a>
        <!--a href="#">✓ Mes corrections</a-->
        <a class="active" href="exercices.php">▤ Mes exercices</a>
         <a href="statistiques.php">▥ Statistiques</a>
        <a href="#">◉ Progression</a>
        <a href="logout.php" class="logout">Déconnexion</a>
        <!--a href="logout.php">Déconnexion</a-->
    </aside>

<!-- CONTENU -->
    <main class="main">

        <a href="exercices.php">← Retour aux exercices</a>

        <div class="demo-header">
            <h1><?= htmlspecialchars($exo['titre']) ?></h1>

            <div class="badges">
                <span><?= $exo['domaine'] ?></span>
                <span><?= $exo['theme'] ?></span>
                <span><?= $exo['niveau'] ?></span>
            </div>
            <h3><?= htmlspecialchars($exo['enonce']) ?></h3>

        </div>

        <div class="demo-layout">
        <!-- AIDE -->
            <div>
                <div class="panel">
                    <h3>💡 Aide & rappels</h3>
                    <ul>
                        <li>Relire les définitions</li>
                        <li>Identifier les hypothèses</li>
                        <li>Choisir le bon théorème</li>
                    </ul>

                    <div class="hint">Besoin d'aide ? L'IA pourra bientôt vous guider.</div>
                </div>
            </div>

            <!-- REDACTION -->

            <div class="panel">
                <form action="api/submit_solution.php" method="POST">
                    <input type="hidden" name="exo" value="<?=$id?>">

                    <!--div class="editor-box"-->
                    <div class="editor-header">
                        <h2>✍️ Votre démonstration</h2>
                        <button type="button" class="delete-btn">🗑 Effacer</button>
                    </div>
                    <!--div id="toolbar">
                        <span class="ql-formats">
                            <button class="ql-bold"></button>
                            <button class="ql-italic"></button>
                            <button class="ql-underline"></button>
                        </span>
                        <span class="ql-formats">
                            <button class="ql-list" value="ordered"></button>
                            <button class="ql-list" value="bullet"></button>
                        </span>
                        <span class="ql-formats">
                            <button class="ql-script" value="sub"></button>
                            <button class="ql-script" value="super"></button>
                        </span>
                        <span class="ql-formats">
                            <button class="ql-blockquote"></button>
                        </span>
                    </div-->
                    <div id="toolbar">
                        <span class="ql-formats">
                            <button class="ql-bold"></button>
                            <button class="ql-italic"></button>
                            <button class="ql-underline"></button>
                        </span>
                        <span class="ql-formats">
                            <button class="ql-list" value="ordered"></button>
                            <button class="ql-list" value="bullet"></button>
                        </span>
                        <span class="ql-formats">
                            <button class="ql-script" value="sub"></button>
                            <button class="ql-script" value="super"></button>
                        </span>
                <!-- FORMULES -->
                        <span class="math-toolbar">
                            <button type="button" onclick="insertMath('∈')">∈</button>
                            <button type="button" onclick="insertMath('∉')">∉</button>
                            <button type="button" onclick="insertMath('⊂')">⊂</button>
                            <button type="button" onclick="insertMath('⊆')">⊆</button>

                            <button type="button" onclick="insertMath('ℕ')">ℕ</button>
                            <button type="button" onclick="insertMath('ℤ')">ℤ</button>
                            <button type="button" onclick="insertMath('ℚ')">ℚ</button>
                            <button type="button" onclick="insertMath('ℝ')">ℝ</button>


                            <button type="button" onclick="insertMath('∀')">∀</button>
                            <button type="button" onclick="insertMath('∃')">∃</button>
                            <button type="button" onclick="insertMath('⇒')">⇒</button>
                            <button type="button" onclick="insertMath('⇔')">⇔</button>


                            <button type="button" onclick="insertMath('≤')">≤</button>
                            <button type="button" onclick="insertMath('≥')">≥</button>
                            <button type="button" onclick="insertMath('≠')">≠</button>

                            <button type="button" onclick="insertMath('∞')">∞</button>
                            <button type="button" onclick="insertMath('∑')">∑</button>
                            <button type="button" onclick="insertMath('∏')">∏</button>
                            <button type="button" onclick="insertMath('√')">√</button>

                            <button type="button" onclick="insertMath('α')">α</button>
                            <button type="button" onclick="insertMath('β')">β</button>
                            <button type="button" onclick="insertMath('γ')">γ</button>
                            <button type="button" onclick="insertMath('δ')">δ</button>
                            <button type="button" onclick="insertMath('λ')">λ</button>
                            <button type="button" onclick="insertMath('μ')">μ</button>
                            <button type="button" onclick="insertMath('π')">π</button>

                            <button type="button" onclick="insertMath('→')">→</button>
                            <button type="button" onclick="insertMath('←')">←</button>
                        </span>
                    </div>
                    <div id="editor">
                        <p>Rédigez votre démonstration ici...</p>
                        <p>Utilisez la barre d'outils pour ajouter des formules mathématiques.</p>
                    </div>

                    <input type="hidden" name="solution" id="solution">
                        <div class="editor-footer">
                            <span id="counter">0 mots</span>
                            <button class="btn-primary" type="submit"> 🚀 Soumettre à l'IA pour correction</button>
                        </div>

<!--/div-->        <br><br>
                </form>

            </div>

        </div>

    </main>

</div>

<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>

<script>
var quill = new Quill('#editor', {

theme:'snow',

modules:{

toolbar:'#toolbar'

}

});
function insertMath(symbol){


let range = quill.getSelection();


if(range){


quill.insertText(
range.index,
symbol
);


quill.setSelection(
range.index + symbol.length
);


}


}


function countWords(text){

let words=text.trim().split(/\s+/);

return text.trim()==="" ? 0 : words.length;

}



quill.on('text-change', function(){


let texte = quill.getText();


document.getElementById("counter")
.innerHTML =
countWords(texte)+" mots";



document.getElementById("solution")
.value =
quill.root.innerHTML;


});



document.querySelector(".delete-btn")
.onclick=function(){

quill.setContents([]);

}


</script>
</body>

</html>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title>EnglishBoost IA</title>

    <link rel="stylesheet" href="assets/css/style.css">
    
</head>

<body>

<div class="app-container">

    <!-- ================= MENU ================= -->

    <header class="app-header">
        <!--img src="assets/images/logo_ai_dev.png" alt="AI&DEV Academy" class="logo"-->
        <h1 class="titre-app">EnglishBoost AI</h1>
        <p> by AI&Dev Academy </p>
        
        <nav class="horizontal-menu">
            <div class="menu-item" id="btn-dictee" onclick="showModule('dictee')">✍ Dictation </div>
            <div class="menu-item" id="btn-comprehension" onclick="showModule('comprehension')"> 📘 Reading comprehension </div>
            <div class="menu-item" id="btn-redaction" onclick="showModule('redaction')">✒️ Writing</div>
            <div class="menu-item" id="btn-lecture" onclick="showModule('lecture')">📖 Oral reading</div>
            <div class="menu-item" id="btn-conversation" onclick="showModule('conversation')">🎤 Conversation</div>
        </nav>
    </header>

    <!-- ================= CONTENU PRINCIPAL ================= -->

    <div class="main-content">
        <div class="top-section">
            <!-- Choix niveau -->
            <div class="bande-niveau">
                <div class="choix-niveau">
                    <a href="#" class="niveau-link" data-niveau="A1">A1</a>
                    <a href="#" class="niveau-link" data-niveau="A2">A2</a>
                    <a href="#" class="niveau-link" data-niveau="B1">B1</a>
                    <a href="#" class="niveau-link" data-niveau="B2">B2</a>
                    <a href="#" class="niveau-link" data-niveau="C1">C1</a>
                    <a href="#" class="niveau-link" data-niveau="C2">C2</a>
                </div>
            </div>
            <hr>

            <!-- ================= GESTION TEXTES ================= -->

            <div class="text-management">
                <div class="bloc-texte">
                    <input type="text" id="theme">
                    <p>Enter a topic and <a href="#" onclick="generateText(); return false;" class="action-link">generate text with AI</a></p>              </div>
                <div class="bloc-texte">
                     <select id="listeDictees">
                        <option value=""></option>
                    </select>
                    <p>Select a text and <a href="#" onclick="chargerDictee(); return false;" class="action-link">load</a></p>
                </div>
            </div>

            <div id="texte"></div>
                <!-- ===== SECTION VARIABLE ===== -->
            <div class="bottom-section">
                    <!-- ================= DICTEE ================= -->
                <div id="module-dictee" style="display:none;">
                    
                    <div class="dictation-controls">
                        <button onclick="startDictation()">▶️</button>
                        <button onclick="repeatSentence()">🔁</button>
                        <button onclick="nextSentence()">⏭</button>
                        <button onclick="stopDictation()">⏹</button>
                    </div>

                <p class="instruction-dictee"> Write what you hear:</p>
                <textarea id="studentText" rows="10"></textarea>
                <br>
                <div class="centre-bouton">
                    <button onclick="corrigerDictee()">Check</button>
                    <div id="result"></div>
                </div>
                <!--h3>Résultat</h3>
                <div id="result"></div-->
             </div>

            <!-- ================= COMPREHENSION ================= -->

            <div id="module-comprehension" style="display:none;">

                <div id="zoneTexte" style="border:1px solid gray;padding:10px;margin-top:15px;background:#f5f5f5;"> </div>
                <br>
                <div id="zoneQuestions"></div>
                <div class="actions-comprehension">

                    📘 <a href="#" id="btn-questions" class="action-link" onclick="genererQuestions(); return false;">Generate questions</a>
                    ✅ <a href="#" class="action-link" onclick="corriger(); return false;">Check</a>
                </div>
                <!-- Résultat -->
                <div id="resultat" style="margin-top:15px;"></div>

            </div>

            <!--=================REDACTION=======================-->
            <div id="module-redaction" class="module-content" style="display: none; margin-top: 20px; font-family: sans-serif;">
                <div class="instruction-box" style="background-color: #f4f6f9; padding: 15px; border-left: 4px solid #007bff; font-size: 12px;margin-bottom: 15px;">
                    <strong>📝 Instructions :</strong> Please write a text of around <strong>200 </strong>words on the chosen topic.
                </div>

                <div class="textarea-container" style="position: relative; margin-bottom: 15px;">
                    <textarea id="redaction-textarea" placeholder="Start writing your text here..." oninput="compterMots()" style="width: 100%; height: 200px; padding: 12px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; resize: vertical; font-size: 15px;"></textarea>
                        <div style="text-align: right; margin-top: 5px; color: #555; font-size: 14px;">
                            Word count:<span id="word-count" style="font-weight: bold; color: #007bff;">0</span> / 200
                        </div>
                </div>

                <div class="actions-container" style="margin-bottom: 20px;">
                    <a href="#" onclick="corrigerRedaction(event)" style="display: inline-block; margin-right: 15px; color: #dc3545; font-weight: bold; text-decoration: none;font-siez:12px">🔍 Correct errors</a>
                    <a href="#" onclick="suggererAmelioration(event)" style="display: inline-block; color: #28a745; font-weight: bold; text-decoration: none;">💡 Suggestions for improvement</a>
                </div>

                <div id="result-zone-redaction" style="display: none; border: 1px solid #ddd; border-radius: 4px; padding: 15px; background-color: #fff;">
                <div id="redaction-grade" style="font-size: 18px; font-weight: bold; margin-bottom: 10px;"></div>
                <div id="redaction-feedback" style="white-space: pre-wrap; line-height: 1.5; color: #333;"></div>
            </div>

</div>




            <!-- ================= LECTURE ================= -->

            <div id="module-lecture" style="display:none;">
        
                <div id="lectureTexte" style="border:1px solid #ccc;padding:15px;background:#f8fafc;border-radius:8px;margin-bottom:20px;"></div>
                <div id="phraseLecture" style="font-size:15px;font-weight:normal;color:#1e293b;text-align:center;padding:20px;background:white;border-radius:8px;margin-bottom:20px;"></div>
                <div style="text-align:center;">
                    <div class="actions-lecture">
                        🔊 <a href="#" class="action-link" onclick="lirePhraseLecture(); return false;">Read sentence</a>
                        ⏭ <a href="#"  class="action-link" onclick="phraseSuivanteLecture(); return false;">Next sentence</a>
                        ⏹ <a href="#" class="action-link"  onclick="arreterLecture(); return false;">Stop</a>
                    </div>
                </div>

                <div id="messageLecture" style="margin-top:10px;text-align:center;font-weight:bold;color:#2563eb;"></div>
                <div id="scorePrononciation"></div>
                <div id="erreursPrononciation"></div>

            </div>
                
                    

            <!-- ================= CONVERSATION ================= -->

            <div id="module-conversation" style="display:none;">
                <a href="#" class="action-link" onclick="demarrerConversation(); return false;">
                    🎤 Start</a>
                <div id="conversation"></div>
                   
        </div>

    </div>

</div>

<!-- ================= JS ================= -->

<script>

    function niveauSelectionne(){

       if(!niveauChoisi){

            alert("Please select a level !");

        return false;
        }

    return true;
}
    

function showModule(module){

    // ==========================
    // Vérification niveau
    // ==========================
    if(!niveauSelectionne()){
        alert("Please select a level !");
        return;
    }


    // ==========================
    // Vérification texte chargé
    // ==========================
    if(!generatedText){

        alert("Please generate or load a text first.");
        return;
    }



    // ==========================
    // Réinitialiser les boutons
    // ==========================
    document.querySelectorAll(".menu-item")
    .forEach(item => {
        item.classList.remove("actif");
    });


    // Activer le bouton choisi
    const bouton = document.getElementById("btn-" + module);

    if(bouton){
        bouton.classList.add("actif");
    }



    // ==========================
    // Cacher tous les modules
    // ==========================
    document.querySelectorAll("[id^='module-']")
    .forEach(div => {
        div.style.display = "none";
    });



    // ==========================
    // Afficher le module demandé
    // ==========================
    const moduleChoisi =
        document.getElementById("module-" + module);

    if(moduleChoisi){
        moduleChoisi.style.display = "block";
    }



    // ==========================
    // Traitement compréhension
    // ==========================
    if(module === "comprehension"){

        let html = generatedText.replace(
            /\b([\p{L}']+)\b/gu,
            '<span class="mot">$1</span>'
        );

        html = html.replace(/\n/g,"<br>");

        document.getElementById("zoneTexte").innerHTML = html;

        activerDefinitions();
    }



    // ==========================
    // Traitement lecture
    // ==========================
    if(module === "lecture"){

        initialiserLecture();

    }


}
</script>

<script src="assets/js/app.js"></script>
<script src="assets/js/comprehension.js"></script>
<script src="assets/js/lecture.js"></script>
<script src="assets/js/conversation.js"></script>
<script src="assets/js/redaction.js"></script>

</body>
</html>
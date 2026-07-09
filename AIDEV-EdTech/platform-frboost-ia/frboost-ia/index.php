<?php
require_once "auth/check.php";
?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title>FrançaisBoost IA</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>

<div class="app-container">

    <header class="app-header">
        <div style="float: right; font-size: 14px; text-align: right; margin-top: 10px;">
            Bonjour <strong><?= htmlspecialchars($_SESSION["prenom"]) ?></strong> (<?= htmlspecialchars($_SESSION["role"]) ?>) | 
            <a href="auth/logout.php" style="color: #dc3545; text-decoration: none; font-weight: bold;">Déconnexion</a>
        </div>
        <h1 class="titre-app" style="margin-bottom: 5px;">FrançaisBoost AI</h1>
        <p style="margin-top: 0; color: gray;">Par AI&Dev Academy</p>
        
        <nav class="horizontal-menu">
            <div class="menu-item actif" id="btn-accueil" onclick="showModule('accueil')">🏠 Accueil</div>
            <div class="menu-item" id="btn-dictee" onclick="showModule('dictee')">✍ Dictée </div>
            <div class="menu-item" id="btn-comprehension" onclick="showModule('comprehension')"> 📘 Compréhension </div>
            <div class="menu-item" id="btn-redaction" onclick="showModule('redaction')">✒️ Rédaction</div>
            <div class="menu-item" id="btn-lecture" onclick="showModule('lecture')">📖 Lecture</div>
            <!--div class="menu-item" id="btn-conversation" onclick="showModule('conversation')">🎤 Conversation</div-->
        </nav>
    </header>

    <div class="main-content">
        
        <div id="zone-preparation-exercice" style="display: none;">
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

            <div class="text-management">
                <div class="bloc-texte">
                    <input type="text" id="theme" placeholder="Ex: Voyage, Cuisine...">
                    <p>Entrer un thème et <a href="#" onclick="generateText(); return false;" class="action-link">générer un texte avec l'IA</a></p>
                </div>
                <div class="bloc-texte">
                     <select id="listeDictees">
                        <option value=""></option>
                    </select>
                    <p>Sélectionner un texte et <a href="#" onclick="chargerDictee(); return false;" class="action-link">charger</a></p>
                </div>
            </div>

            <div id="texte"></div>
        </div>

        <div class="bottom-section">

            <div id="module-accueil" style="display: block;">
                <div style="background: white; padding: 25px; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.06); margin-top: 15px;">
                    <h2 style="color: #007bff; margin-top: 0; display: flex; align-items: center; gap: 10px;">📊 Mon Tableau de Bord</h2>
                    <p style="color: #555;">Bienvenue dans votre espace d'apprentissage personnalisé. Voici le résumé de vos récents efforts :</p>
                    
                    <div id="zone-statistiques" class="stats-dashboard">
                        <div class="stat-card">
                            <div class="stat-valeur" id="stat-exercices">0</div>
                            <div class="stat-titre">Exercices</div>
                        </div>

                        <div class="stat-card">
                            <div class="stat-valeur" id="stat-moyenne">0%</div>
                            <div class="stat-titre">Moyenne</div>
                        </div>

                        <div class="stat-card">
                            <div class="stat-valeur" id="stat-record">0%</div>
                            <div class="stat-titre">Record</div>
                        </div>

                        <div class="stat-card">
                            <div class="stat-valeur" id="stat-modules">0</div>
                            <div class="stat-titre">Modules</div>
                        </div>

                </div>

                <h3 style="margin-top:30px;">Historique récent</h3>
                    
                    <div id="zone-historique" style="margin-top: 20px;">
                        <p style="color: gray; font-style: italic;">Chargement de votre historique...</p>
                    </div>
                </div>
            </div>

            <div id="module-dictee" style="display: none;">
                <div class="dictation-controls">
                    <button onclick="startDictation()">▶️</button>
                    <button onclick="repeatSentence()">🔁</button>
                    <button onclick="nextSentence()">⏭</button>
                    <button onclick="stopDictation()">⏹</button>
                </div>

                <p class="instruction-dictee"> Écris ce que tu entends :</p>
                <textarea id="studentText" rows="10"></textarea>
                <br>
                <div class="centre-bouton">
                    <button onclick="corrigerDictee()">Corriger</button>
                    <div id="result"></div>
                </div>
            </div>

            <div id="module-comprehension" style="display: none;">
                <div id="zoneTexte" style="border:1px solid gray;padding:10px;margin-top:15px;background:#f5f5f5;"> </div>
                <br>
                <div id="zoneQuestions"></div>
                <div class="actions-comprehension">
                    📘 <a href="#" id="btn-questions" class="action-link" onclick="genererQuestions(); return false;">Générer les questions</a>
                    ✅ <a href="#" class="action-link" onclick="corriger(); return false;">Corriger</a>
                </div>
                <div id="resultat" style="margin-top:15px;"></div>
            </div>

            <div id="module-redaction" class="module-content" style="display: none; margin-top: 20px; font-family: sans-serif;">
                <div class="instruction-box" style="background-color: #f4f6f9; padding: 15px; border-left: 4px solid #007bff; font-size: 12px;margin-bottom: 15px;">
                    <strong>📝 Consigne :</strong> Veuillez rédiger un texte d'environ <strong>200 mots</strong> sur le thème choisi.
                </div>

                <div class="textarea-container" style="position: relative; margin-bottom: 15px;">
                    <textarea id="redaction-textarea" placeholder="Commencez à rédiger votre texte ici..." oninput="compterMots()" style="width: 100%; height: 200px; padding: 12px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; resize: vertical; font-size: 15px;"></textarea>
                    <div style="text-align: right; margin-top: 5px; color: #555; font-size: 14px;">
                        Nombre de mots : <span id="word-count" style="font-weight: bold; color: #007bff;">0</span> / 200
                    </div>
                </div>

                <div class="actions-container" style="margin-bottom: 20px;">
                    <a href="#" onclick="corrigerRedaction(event)" style="display: inline-block; margin-right: 15px; color: #dc3545; font-weight: bold; text-decoration: none;">🔍 Corriger les fautes</a>
                    <a href="#" onclick="suggererAmelioration(event)" style="display: inline-block; color: #28a745; font-weight: bold; text-decoration: none;">💡 Suggestions d'amélioration</a>
                </div>

                <div id="result-zone-redaction" style="display: none; border: 1px solid #ddd; border-radius: 4px; padding: 15px; background-color: #fff;">
                    <div id="redaction-grade" style="font-size: 18px; font-weight: bold; margin-bottom: 10px;"></div>
                    <div id="redaction-feedback" style="white-space: pre-wrap; line-height: 1.5; color: #333;"></div>
                </div>
            </div>

            <div id="module-lecture" style="display: none;">
                <div id="lectureTexte" style="border:1px solid #ccc;padding:15px;background:#f8fafc;border-radius:8px;margin-bottom:20px;"></div>
                <div id="phraseLecture" style="font-size:15px;font-weight:normal;color:#1e293b;text-align:center;padding:20px;background:white;border-radius:8px;margin-bottom:20px;"></div>
                <div style="text-align:center;">
                    <div class="actions-lecture">
                        🔊 <a href="#" class="action-link" onclick="lirePhraseLecture(); return false;">Lire la phrase</a>
                        ⏭ <a href="#" class="action-link" onclick="phraseSuivanteLecture(); return false;">Phrase suivante</a>
                        ⏹ <a href="#" class="action-link" onclick="arreterLecture(); return false;">Arrêter</a>
                    </div>
                </div>
                <div id="messageLecture" style="margin-top:10px;text-align:center;font-weight:bold;color:#2563eb;"></div>
                <div id="scorePrononciation"></div>
                <div id="erreursPrononciation"></div>
            </div>

            <!--div id="module-conversation" style="display: none;">
                <a href="#" class="action-link" onclick="demarrerConversation(); return false;">🎤 Démarrer</a>
                <div id="conversation"></div-->
            </div>
    
        </div>
    </div>
</div>

<script>
//let niveauChoisi = ""; 
//let generatedText = ""; 

function niveauSelectionne(){
    if(!niveauChoisi){
        alert("Veuillez sélectionner un niveau !");
        return false;
    }
    return true;
}

function showModule(module){
    const zonePreparation = document.getElementById('zone-preparation-exercice');
    const dashboard= document.getElementById('module-accueil'); //moi Nivo

    // ========================================================
    // GESTION DE LA ZONE DE PRÉPARATION (NIVEAU & TEXTES)
    // ========================================================
    if (module === 'accueil') {
        // Sur l'accueil, on cache tout le panneau supérieur
        if(zonePreparation) zonePreparation.style.display = "none";
        if (typeof chargerHistoriqueDashboard === 'function') {
            chargerHistoriqueDashboard();
            chargerStatistiquesDashboard();
        }
    } else {
        // Sur un exercice (dictée, compréhension...), on affiche IMMÉDIATEMENT 
        // le panneau supérieur pour que l'élève voie les niveaux et les thèmes !
        if(zonePreparation) zonePreparation.style.display = "block";
        if(!niveauChoisi) alert("Veuillez svp sélectionner un niveau !");
        dashboard.style.display="none";
                    
    }

    // ==========================
    // Réinitialiser l'état des onglets
    // ==========================
    document.querySelectorAll(".menu-item").forEach(item => {
        item.classList.remove("actif");
    });

    const bouton = document.getElementById("btn-" + module);
    if(bouton){
        bouton.classList.add("actif");
    }

    // ==========================
    // Basculer l'affichage du module sélectionné
    // ==========================
    document.querySelectorAll("[id^='module-']").forEach(div => {
        div.style.display = "none";
    });

    const moduleChoisi = document.getElementById("module-" + module);
    if(moduleChoisi){
        moduleChoisi.style.display = "block";
    }

    // ========================================================
    // Déclenchement du rafraîchissement dynamique de l'accueil
    // ========================================================
    if (module === 'accueil') {
        if (typeof chargerHistoriqueDashboard === 'function') {
            chargerHistoriqueDashboard();
        }
    }

    // Logique spécifique : Compréhension
    if(module === "comprehension" && generatedText){
        let html = generatedText.replace(/\b([\p{L}']+)\b/gu, '<span class="mot">$1</span>');
        html = html.replace(/\n/g,"<br>");
        document.getElementById("zoneTexte").innerHTML = html;
        if(typeof activerDefinitions === 'function') {
            activerDefinitions();
        }
    }

    // Logique spécifique : Lecture
    if(module === "lecture"){
        if(typeof initialiserLecture === 'function') {
            initialiserLecture();
        }
    }
}

// ========================================================
// INITIALISATION DYNAMIQUE DES BOUTONS DE NIVEAU
// ========================================================
document.addEventListener("DOMContentLoaded", () => {
    const liensNiveau = document.querySelectorAll(".niveau-link");
    
    liensNiveau.forEach(link => {
        link.addEventListener("click", (e) => {
            e.preventDefault();
            
            // 1. Mettre à jour visuellement l'état actif des boutons de niveau
            liensNiveau.forEach(l => l.classList.remove("actif"));
            link.classList.add("actif");
            
            // 2. Mettre à jour la variable globale attendue par app.js
            niveauChoisi = link.getAttribute("data-niveau");
            console.log("Niveau sélectionné : " + niveauChoisi);
            
            // 3. RÉVEIL DU SELECT : On appelle votre vraie fonction d'origine !
            if (typeof loadDictations === 'function') {
                loadDictations();
            }
        });
    });
});
</script>

<script src="assets/js/app.js"></script>
<script src="assets/js/comprehension.js"></script>
<script src="assets/js/lecture.js"></script>
<!--script src="assets/js/conversation.js"></script-->
<script src="assets/js/redaction.js"></script>

<script>
document.addEventListener("DOMContentLoaded", () => {
    if (typeof chargerHistoriqueDashboard === "function") {
        chargerHistoriqueDashboard();
        chargerStatistiquesDashboard();
    }
});
</script>

</body>
</html>
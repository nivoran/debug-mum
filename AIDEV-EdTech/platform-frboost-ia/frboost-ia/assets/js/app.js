let niveauChoisi = null;
let generatedText = "";
let generatedTextId= null;
let phrases = [];
let indexPhrase = 0;
let phraseActuelle = "";
let themeConversation = "";

async function generateText() {

    // Effacer ancien message
    document.getElementById("texte").innerHTML = "";

     // Vérification niveau
    if(!niveauChoisi){

        alert("Veuillez d'abord choisir un niveau (A1 à C2).");

        return;
    }
    const theme = document.getElementById("theme").value;
    if(!theme){

        alert("Veuillez entrer un thème avant de générer un texte.");

        return;
    }

     // Message pendant l'attente IA
    document.getElementById("texte").innerHTML =
        "<div class='message-info'>⏳ Génération du texte par l'IA en cours...</div>";
    try {

        const response = await fetch("./api/generate_text.php", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
           body: JSON.stringify({ 
           theme: theme,
           niveau: niveauChoisi})
        });

        // Vérifie si la requête a réussi
        if (!response.ok) {

            throw new Error("Erreur serveur");
        }

        
        const data = await response.json();
        console.log("Réponse API: ", data);
        // Si le PHP renvoie une erreur Gemini
        if(data.error){
            document.getElementById("texte").innerHTML =
            "<span style='color:red;font-weight:bold;'>⚠️ "
            + data.error +
            "</span>";
        return;
    }

    // Si aucun texte reçu
    if (!data || !data.text) {
        document.getElementById("texte").innerHTML =
        "<span style='color:red;font-weight:bold;'>⚠️ Aucun texte généré.</span>";
        return;
    }

    // Stockage du texte
    generatedText = data.text;
    viderZoneTravail();
    viderListeDictees();
        // Message de succès
     document.getElementById("theme").value = "";
     document.getElementById("texte").innerHTML =
            "<span style='color:green;font-weight:bold;'>✅ Texte généré. Choisis maintenant un module pour travailler.</span>";
        
     themeConversation = theme;
              
    } catch (error) {

    console.error(error);
    document.getElementById("texte").innerHTML =
            "<span style='color:red;font-weight:bold;'>❌ Erreur lors de la génération du texte.</span>";

    } finally {
       
    }
}

//--------------------------------------------------------------------------
function startDictation(){

    const texte = generatedText;

    if(!texte){
        alert("Aucune dictée disponible");
        return;
    }

    phrases = texte.split(".");
    indexPhrase = 0;

    lirePhrase();
}


function lirePhrase(){

    if(indexPhrase >= phrases.length){
        alert("Dictée terminée !");
        return;
    }

    phraseActuelle = phrases[indexPhrase].trim();

    if(phraseActuelle === ""){
        indexPhrase++;
        lirePhrase();
        return;
    }

    const utterance = new SpeechSynthesisUtterance(phraseActuelle);
    utterance.lang = "fr-FR";
   // utterance.rate = 0.85;
    utterance.rate = 0.5;

    utterance.onend = () => {

        // pause puis répétition
        setTimeout(() => {

            const repetition = new SpeechSynthesisUtterance(phraseActuelle);
            repetition.lang = "fr-FR";
            repetition.rate = 0.85;

            speechSynthesis.speak(repetition);

        }, 2000);

    };

    speechSynthesis.speak(utterance);
}


function repeatSentence(){

    if(!phraseActuelle) return;

    const utterance = new SpeechSynthesisUtterance(phraseActuelle);
    utterance.lang = "fr-FR";
    utterance.rate = 0.85;

    speechSynthesis.speak(utterance);
}


function nextSentence(){

    indexPhrase++;
    lirePhrase();
}


function stopDictation(){
    speechSynthesis.cancel();
}
//---------------------------------------------------------------------

async function loadDictations(){

    console.log("loadDictations appelée");
    const select = document.getElementById("listeDictees");
    console.log(select);
    
   // const select = document.getElementById("listeDictees");
    if(!select) return;

    // récupérer le niveau sélectionné

    if(!niveauChoisi){
        alert("Veuillez sélectionner un niveau !");
        return;
    }
    
    const res = await fetch(
        "./api/get_dictees.php?niveau=" + niveauChoisi
    );
    if(!niveauChoisi){
        return;
    }
    const data = await res.json();
    
    // vider la liste

    select.innerHTML = `
        <option value="">
            
        </option>
    `;

    // remplir
    data.forEach(d => {
        const option = document.createElement("option");
        option.value = d.id;
       /* option.textContent = d.theme + " (" + d.date_creation + ")";*/
        option.textContent = d.theme;
        option.dataset.texte = d.texte;
        option.dataset.theme = d.theme;
        select.appendChild(option);
    });
}

function chargerDictee(){

    const select = document.getElementById("listeDictees");

    // Vérifie qu'on n'est pas sur la première option
    if(select.selectedIndex === -1 || select.value === ""){
        alert("Veuillez choisir une dictée");
        return;
    }

    const option = select.options[select.selectedIndex];
    const theme = option.dataset.theme;
        // alert("chargerDictee "+theme)

    console.log("Option sélectionnée :", option);
    console.log("Texte :", option.dataset.texte);

    // Charger le texte
    generatedText = option.dataset.texte;
    generatedTextId = option.value;
    viderZoneTravail();
   
    document.getElementById("texte").innerHTML =
    "<div class='message-info'>✓ Texte \"" 
    + theme +
    "\" chargé. .</div>";
}


async function corrigerDictee(){

    
    const texteCorrect = generatedText;
    const texteId = generatedTextId;
    if(!texteCorrect){
        alert("dictée vide");
        return;
    }
    const texteEleve =
        document.getElementById("studentText").value;
       
    const res = await fetch("./api/correct_dictation.php",{

        method:"POST",

        headers:{
            "Content-Type":"application/json"
        },

        body:JSON.stringify({
            texte_id: texteId,
            correct: texteCorrect,
            eleve: texteEleve
        })

    });

    const data = await res.json();

  document.getElementById("result").innerHTML =
        data.html + "<h3>Note : " + data.note + "/100</h3>";
        

}


// Exemple d'utilisation
//console.log(getNiveauSelectionne()); // "B1" ou null si rien n'est sélectionné*/
let dictationsLoaded = false;

document.addEventListener("DOMContentLoaded", ()=>{

    const liste = document.getElementById("listeDictees");

    if(liste){

        liste.addEventListener("mousedown", async ()=>{

            if(!dictationsLoaded){

                await loadDictations();

                dictationsLoaded = true;
            }

        });

    }

});

//-----Gestionnaire de clic sur les niveaux
//let niveauChoisi = null;

document.querySelectorAll(".niveau-link").forEach(lien => {

    lien.addEventListener("click", async function(e){
        e.preventDefault();
        niveauChoisi = this.dataset.niveau;
        viderListeDictees();
        await loadDictations();
    });

});


function viderListeDictees(){

    const select = document.getElementById("listeDictees");
    const texte = document.getElementById("texte");

    if(select){
        select.innerHTML =
        '<option value="">-- Choisir un texte --</option>';
    }

    if(texte){
        texte.innerHTML="";
    }

    generatedText = "";
    dictationsLoaded = false;
}

function viderZoneTravail(){

    // Cacher les modules
    document.querySelectorAll("[id^='module-']")
    .forEach(div => {
        div.style.display = "none";
    });


    // Dictée
    const studentText = document.getElementById("studentText");
    if(studentText){
        studentText.value = "";
    }

    const result = document.getElementById("result");
    if(result){
        result.innerHTML = "";
    }


    // Compréhension
    const zoneTexte = document.getElementById("zoneTexte");
    const zoneQuestions = document.getElementById("zoneQuestions");
    
    if(zoneTexte){
        zoneTexte.innerHTML = "";
    }
   
    if(zoneQuestions){
        zoneQuestions.innerHTML = "";
    }

    const resultat = document.getElementById("resultat");
    if(resultat){
        resultat.innerHTML = "";
    }


    // Lecture
    const phraseLecture = document.getElementById("phraseLecture");
    if(phraseLecture){
        phraseLecture.innerHTML = "";
    }

    const scorePrononciation =
        document.getElementById("scorePrononciation");

    if(scorePrononciation){
        scorePrononciation.innerHTML = "";
    }


    // Conversation
    const conversationZone =
        document.getElementById("conversation");

    if(conversationZone){
        conversation.innerHTML = "";
    }

}
function iconeModule(module){

    switch(module){

        case "dictee":
            return "📝 Dictée";

        case "comprehension":
            return "📚 Compréhension";

        case "lecture":
            return "📖 Lecture";

        case "conversation":
            return "💬 Conversation";

        case "redaction":
            return "✍️ Rédaction";

        default:
            return module;
    }

}

async function chargerHistoriqueDashboard(){

    const res = await fetch("./api/get_history.php");

    const data = await res.json();

    const zone = document.getElementById("zone-historique");

    zone.innerHTML = "";

    if(data.length === 0){

        zone.innerHTML =
            "<p>Aucun exercice réalisé pour le moment.</p>";

        return;
    }

    data.forEach(item=>{

        const carte = document.createElement("div");

        carte.className = "carteHistorique";

        carte.innerHTML = `
            <h4>${iconeModule(item.module)}</h4>
            <p>${item.theme}</p>
            <strong>🏆 ${item.score}%</strong>

            <br>
            <small>📅 ${item.date_passage}</small>
        `;

        zone.appendChild(carte);

    });

}

async function chargerStatistiquesDashboard(){

    const res = await fetch("./api/get_statistics.php");

    const data = await res.json();

    document.getElementById("stat-exercices").textContent =
        data.nb_exercices;

    document.getElementById("stat-moyenne").textContent =
        data.moyenne + "%";

    document.getElementById("stat-record").textContent =
        data.meilleur + "%";

    document.getElementById("stat-modules").textContent =
        data.nb_modules;

}
let generatedText = "";
let phrases = [];
let indexPhrase = 0;
let phraseActuelle = "";
let themeConversation = "";

async function generateText() {

   
    // Effacer ancien message
    document.getElementById("texte").innerHTML = "";

     // Vérification niveau
    if(!niveauChoisi){

        alert("Please select a level first (A1 to C2).");

        return;
    }
    const theme = document.getElementById("theme").value;
    if(!theme){

        alert("Please enter a topic before generating text.");

        return;
    }

     // Message pendant l'attente IA
    document.getElementById("texte").innerHTML =
        "<div class='message-info'>⏳ AI text generation in progress...</div>";
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

            throw new Error("Server error");
        }

        
        const data = await response.json();
        console.log("API response: ", data);
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
        "<span style='color:red;font-weight:bold;'>⚠️ No text generated.</span>";

    return;
}

        // Stockage du texte
        generatedText = data.text;
        viderZoneTravail();
        viderListeDictees();
        // Message de succès
        document.getElementById("theme").value = "";
        document.getElementById("texte").innerHTML =
            "<span style='color:green;font-weight:bold;'>✅ Text generated. Now choose a module to work with.</span>";
        
        themeConversation = theme;
       
       
    } catch (error) {

        console.error(error);

        document.getElementById("texte").innerHTML =
            "<span style='color:red;font-weight:bold;'>❌ Error generating text.</span>";

    } finally {

       
    }
}

function startDictation(){

    const texte = generatedText;

    if(!texte){
        alert("No dictations available");
        return;
    }

    phrases = texte.split(".");
    indexPhrase = 0;

    lirePhrase();
}


function lirePhrase(){

    if(indexPhrase >= phrases.length){
        alert("Dictation completed !");
        return;
    }

    phraseActuelle = phrases[indexPhrase].trim();

    if(phraseActuelle === ""){
        indexPhrase++;
        lirePhrase();
        return;
    }

   /* const utterance = new SpeechSynthesisUtterance(phraseActuelle);
    utterance.lang = "fr-FR";
   // utterance.rate = 0.85;
    utterance.rate = 0.5;

    utterance.onend = () => {

        // pause puis répétition
        setTimeout(() => {

            const repetition = new SpeechSynthesisUtterance(phraseActuelle);
            repetition.lang = "en-GB";
            repetition.rate = 0.85;

            speechSynthesis.speak(repetition);

        }, 2000);

    };

    speechSynthesis.speak(utterance);*/

    const repetition = new SpeechSynthesisUtterance(phraseActuelle);

    // 1. On change la langue pour l'anglais britannique
    repetition.lang = "en-GB";
    repetition.rate = 0.85;

    // 2. Optionnel mais recommandé : Forcer une voix proprement britannique
    const voices = window.speechSynthesis.getVoices();
    // On cherche une voix qui contient "en-GB" dans son code langue
    const britishVoice = voices.find(voice => voice.lang === "en-GB" || voice.lang.startsWith("en-GB"));

    if (britishVoice) {
        repetition.voice = britishVoice;
        }
    //speechSynthesis.speak(utterance);
    speechSynthesis.speak(repetition);
}


function repeatSentence(){

    if(!phraseActuelle) return;

    const utterance = new SpeechSynthesisUtterance(phraseActuelle);
    utterance.lang = "en-GB";
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


async function loadDictations(){

    //alert('hi 1');
    const select = document.getElementById("listeDictees");
   
    if(!select) return;

    // récupérer le niveau sélectionné

    // TEST const niveauSelectionne = niveauChoisi;

    if(!niveauChoisi){

        alert("Please select a level !");

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
        alert("Please select a dictation");
        return;
    }

    const option = select.options[select.selectedIndex];
    const theme = option.dataset.theme;
    // alert("chargerDictee "+theme)

    console.log("Option sélectionnée :", option);
    console.log("Texte :", option.dataset.texte);

    // Charger le texte
    generatedText = option.dataset.texte;
    viderZoneTravail();
   
    document.getElementById("texte").innerHTML =
    "<div class='message-info'>✓ Text \"" 
    + theme +
    "\" loaded!</div>";
}


async function corrigerDictee(){

    //const texteCorrect = option.dataset.texte;
    const texteCorrect = generatedText;
     
    if(!texteCorrect){
        alert("Empty dictation");
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


let niveauChoisi = null;

document.querySelectorAll(".niveau-link").forEach(lien => {

    lien.addEventListener("click", function(e){

        e.preventDefault();

        document.querySelectorAll(".niveau-link")
            .forEach(l => l.classList.remove("actif"));

        this.classList.add("actif");

        niveauChoisi = this.dataset.niveau;

        console.log("Niveau :", niveauChoisi);

        // éventuellement :
        viderListeDictees();
    });

});

function viderListeDictees(){

    const select = document.getElementById("listeDictees");
    const texte = document.getElementById("texte");

    if(select){
        select.innerHTML =
        '<option value="">-- Select a text --</option>';
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
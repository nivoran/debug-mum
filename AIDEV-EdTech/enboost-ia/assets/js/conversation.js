let conversationEnCours = false;
let ecouteActive = false;
let iaEnCours = false;
async function demarrerConversation() {
    conversationEnCours = true;
    // alert('demarrerConversation');
    document.getElementById("conversation").innerHTML =
        "<p>⏳ Démarrage de la conversation...</p>";

    const theme = document.getElementById("theme").value;//theme n'est pas connu
    //alert(theme);
     historiqueConversation = [
        {
            role: "system",
            content: `Tu es un partenaire de conversation en français. Le thème de la discussion est : ${theme}. 
            Corrige discrètement les erreurs importantes. Pose une seule question à la fois.
            Encourage l'apprenant à parler davantage.`
        }
    ];
    try {

        const response = await fetch("./api/demarrer_conversation.php", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ theme: theme })
        });

        // Vérifie si la requête a réussi
        if (!response.ok) {

            throw new Error("Erreur serveur");
        }

        const data = await response.json();
       
        console.log("Réponse API: ", data);

        if (!data || !data.text) {
             document.getElementById("conversation").innerHTML =
             "<span style='color:red;font-weight:bold;'>⚠️ Démarrage conversation échoué (API indisponible). Réessayez.</span>";

            return; // IMPORTANT : pas de throw
         }
         historiqueConversation.push({
                role: "assistant",
                content: data.text
            });
        

        // Conversation
        document.getElementById("conversation").innerHTML =
            "<span style='color:green;font-weight:bold;'>"+ data.text+ "</span>";
        const utterance = new SpeechSynthesisUtterance(data.text);
        utterance.lang = "en-GB";
        utterance.rate = 0.9;
        utterance.pitch = 1;
        speechSynthesis.speak(utterance);
       /* utterance.onend = function() {
        ecouterUtilisateur();*/
        utterance.onend = function() {
        if(!conversationEnCours){
        return;
        }

        setTimeout(() => {
            ecouterUtilisateur();
        }, 800);

    };
//};
        
       

    } catch (error) {

        console.error(error);

        document.getElementById("conversation").innerHTML =
            "<span style='color:red;font-weight:bold;'>❌ Erreur lors de la génération du texte.</span>";

    } finally {

    }
  
    
}

async function ecouterUtilisateur() {

    if(ecouteActive){
        console.log("Ecoute déjà active");
        return;
    }

    ecouteActive = true;
    console.log("ecouterUtilisateur appelée");
    const SpeechRecognition =
        window.SpeechRecognition ||
        window.webkitSpeechRecognition;

    if (!SpeechRecognition) {

        alert("La reconnaissance vocale n'est pas supportée par ce navigateur.");

        return;
    }

    const recognition = new SpeechRecognition();

    recognition.lang = "en-GB";
    recognition.continuous = false;
    recognition.interimResults = false;
    recognition.maxAlternatives = 1;

    /*document.getElementById("conversation").innerHTML +=
        "<br><span style='color:blue;'>🎤 Je t' écoute...</span>";*/
    recognition.onstart = function(){

    document.getElementById("conversation").innerHTML +=
    "<br><span style='color:blue;'>🎤 Je t'écoute...</span>";

};

    //recognition.start();

    recognition.onresult = async function(event) {
        ecouteActive = false;
        const texteUtilisateur =
            event.results[0][0].transcript;

        console.log("Réponse utilisateur :", texteUtilisateur);

        document.getElementById("conversation").innerHTML +=
            `<br><b>Vous :</b> ${texteUtilisateur}`;

        // Ajout à l'historique
        historiqueConversation.push({
            role: "user",
            content: texteUtilisateur
        });

        // Envoi à l'IA
        await envoyerReponseIA();
    };

    recognition.onerror = function(event) {
        ecouteActive = false;
        //console.error(event.error);
        console.error("Erreur reconnaissance :", event.error);
        document.getElementById("conversation").innerHTML +=
            "<br><span style='color:red;'>❌ Erreur microphone.</span>";
    };

    recognition.onend = function() {
        ecouteActive = false;
        console.log("Reconnaissance terminée");

    };

    recognition.start();
}

/*async function envoyerReponseIA() {
    console.log("Envoi à l'IA...");
    const response = await fetch("./api/continuer_conversation.php", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            messages: historiqueConversation
        })
    });
    console.log("Status:", response.status);
  

const texteBrut = await response.text();

console.log("Réponse brute :", texteBrut);

try {

    const data = JSON.parse(texteBrut);
    if (!data.text) {
        document.getElementById("conversation").innerHTML +=
        "<br><span style='color:red;'>⚠️ L'IA n'a pas répondu.</span>";
    return;
    }
    if (data.text.includes("problème de connexion")) {

    document.getElementById("conversation").innerHTML +=
        "<br><span style='color:red;'>Conversation interrompue.</span>";

    return; // IMPORTANT : ne pas relancer l'écoute
    }
    console.log("Réponse IA reçue :", data);

    historiqueConversation.push({
        role: "assistant",
        content: data.text
    });

    document.getElementById("conversation").innerHTML +=
        `<br><span style="color:green;"><b>IA :</b> ${data.text}</span>`;

    const utterance = new SpeechSynthesisUtterance(data.text);

    utterance.lang = "fr-FR";

    speechSynthesis.speak(utterance);

    utterance.onend = function() {

    if(conversationEnCours){

        setTimeout(() => {
            ecouterUtilisateur();
        },1000);

    }

    };

}
catch(error) {

    console.error("Réponse non JSON :", texteBrut);
}


  
}
*/
async function envoyerReponseIA() {

    if(iaEnCours){
        console.log("IA déjà en train de répondre");
        return;
    }

    iaEnCours = true;

    try {

        const response = await fetch("./api/continuer_conversation.php", {
            method: "POST",
            headers:{
                "Content-Type":"application/json"
            },
            body: JSON.stringify({
                messages: historiqueConversation
            })
        });


        const texteBrut = await response.text();

        console.log("Réponse brute :", texteBrut);


        const data = JSON.parse(texteBrut);


        if(!data.text){
            return;
        }


        historiqueConversation.push({
            role:"assistant",
            content:data.text
        });


        document.getElementById("conversation").innerHTML +=
        `<br><span style="color:green;"><b>IA :</b> ${data.text}</span>`;


        const utterance =
            new SpeechSynthesisUtterance(data.text);


        utterance.lang="en-GB";


        utterance.onend=function(){

            setTimeout(()=>{

                ecouterUtilisateur();

            },1000);

        };


        speechSynthesis.speak(utterance);


    } catch(error){

        console.error(error);

    } finally {

        iaEnCours=false;

    }

}


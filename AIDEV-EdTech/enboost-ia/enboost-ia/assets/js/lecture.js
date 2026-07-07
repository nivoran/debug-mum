let phrasesLecture = [];

let indexLecture = 0;

function initialiserLecture(){

    if(!generatedText) return;

    phrasesLecture = generatedText
        .split(/[.!?]+/)
        .map(p => p.trim())
        .filter(p => p.length > 0);

    indexLecture = 0;

    document.getElementById("lectureTexte")
        .innerHTML = generatedText.replace(/\n/g,"<br>");

    afficherPhraseLecture();
}

function afficherPhraseLecture(){

    const zone =
        document.getElementById("phraseLecture");

    if(indexLecture >= phrasesLecture.length){

        zone.innerHTML = "✅ Lecture terminée";

        return;
    }

    zone.innerHTML =
        phrasesLecture[indexLecture];
}

let reconnaissance;

function lirePhraseLecture(){

    speechSynthesis.cancel();


    if(indexLecture >= phrasesLecture.length)
        return;


    let phrase = phrasesLecture[indexLecture];


    const utterance =
        new SpeechSynthesisUtterance(phrase);


    utterance.lang="en-GB";

    utterance.rate=0.8;


    utterance.onend=function(){

        console.log("Lecture terminée");

        setTimeout(()=>{

            demarrerEcoute();

        },500);

    };


    speechSynthesis.speak(utterance);

}

function demarrerEcoute(){


    if(!('webkitSpeechRecognition' in window)){

        alert("Reconnaissance vocale non disponible sur ce navigateur");

        return;
    }


    reconnaissance = new webkitSpeechRecognition();


    reconnaissance.lang = "en-GB";

    reconnaissance.continuous = false;

    reconnaissance.interimResults = false;



    reconnaissance.onstart = function(){

        console.log("🎤 Micro activé");

    };



    reconnaissance.onresult = function(event){


        let textePrononce =
            event.results[0][0].transcript;



        console.log(
            "Etudiant a dit :",
            textePrononce
        );



        verifierPrononciation(
            phrasesLecture[indexLecture],
            textePrononce
        );


    };



    reconnaissance.onerror = function(event){

        console.log(
            "Erreur micro :",
            event.error
        );

    };



    reconnaissance.onend = function(){

        console.log("Micro arrêté");

    };



    // IMPORTANT : après les événements
    reconnaissance.start();

}



function phraseSuivanteLecture(){

    indexLecture++;

    afficherPhraseLecture();
}

function arreterLecture(){

    speechSynthesis.cancel();
}

function ecouterEtComparer(){

    if(indexLecture >= phrasesLecture.length)
        return;

    const phraseAttendue =
        phrasesLecture[indexLecture];

    const recognition =
        new webkitSpeechRecognition();

    recognition.lang = "fr-FR";

    recognition.start();

    recognition.onresult = function(event){

        let texteReconnu =
            event.results[0][0].transcript;

        verifierPrononciation(
            phraseAttendue,
            texteReconnu
        );
    };
}

function verifierPrononciation(
    attendu,
    reconnu
){

    attendu =
        attendu.toLowerCase();

    reconnu =
        reconnu.toLowerCase();

    let motsAttendus =
        attendu.split(" ");

    let motsReconnu =
        reconnu.split(" ");

    let corrects = 0;

    motsAttendus.forEach(mot => {

        if(motsReconnu.includes(mot))
            corrects++;
    });

    let score =
        Math.round(
            corrects /
            motsAttendus.length * 100
        );

    document
        .getElementById(
            "scorePrononciation"
        )
        .innerHTML =
        "Prononciation : "
        + score + "%";

        let resultat = "";

motsAttendus.forEach(mot => {

    if(motsReconnu.includes(mot)){

        resultat +=
            "<span style='color:green'>" +
            mot +
            "</span> ";

    }else{

        resultat +=
            "<span style='color:red;font-weight:bold'>" +
            mot +
            "</span> ";
    }
});

document.getElementById(
    "erreursPrononciation"
).innerHTML = resultat;
}
// Génération des questions (existant)
function genererQuestions() {
    let texte = document.getElementById("zoneTexte").innerText;

   /* document.getElementById("messageQuestions").innerHTML =
    "<span class='message-info'>⏳ Génération des questions en cours...</span>";
    document.getElementById("zoneQuestions").innerHTML = "";*/
    
    const btn = document.getElementById("btnQuestions");
    //btn.disabled = true;
    //btn.innerText = "⏳ Génération...";

    fetch("./api/generer_questions.php", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: "texte=" + encodeURIComponent(texte)
    })
    .then(r => r.json())
    .then(data => {
        let html = "";
        data.forEach((q,i) => {
            html += "<p>"+q.question+"</p>";
            html += "<textarea id='rep"+i+"' rows='5' cols='80'></textarea>";
        });
        document.getElementById("zoneQuestions").innerHTML = html;
       /* document.getElementById("messageQuestions").innerHTML = "";*/
       // btn.disabled = false;
        //btn.innerText = "Générer les questions";
    });
}

// Corriger réponses (existant)
function corriger() {
    let texte = document.getElementById("zoneTexte").innerText;

    let reponses = [];
    document.querySelectorAll("#zoneQuestions textarea").forEach((ta,i)=>{
        reponses.push({
            question: document.querySelectorAll("#zoneQuestions p")[i].innerText,
            reponse: ta.value
        });
    });

    fetch("./api/corriger_reponses.php", {
        method:"POST",
        headers: { "Content-Type":"application/json" },
        body: JSON.stringify({ texte, reponses })
    })
    .then(r=>r.json())
    .then(data => {
        if(data.error){
            document.getElementById("resultat").innerHTML = "<p style='color:red;'>"+data.error+"</p>";
            return;
        }
        let html = "<h3>Correction</h3>";
        data.corrections.forEach((c,i)=>{
            html += "<p><strong>"+c.question+"</strong></p>";
            html += "<p>Votre réponse : "+c.reponse+"</p>";
            html += "<p>Correction : "+c.correction+"</p>";
            html += "<p>Score : "+c.score+"/20</p><hr>";
        });
        html += "<p><strong>Note totale : "+data.totalScore+"/100</strong></p>";
        document.getElementById("resultat").innerHTML = html;
    });
}


async function obtenirDefinition(mot){

    const res = await fetch("./api/definition.php",{
        method:"POST",
        headers:{
            "Content-Type":"application/json"
        },
        body:JSON.stringify({mot:mot})
    });

    const data = await res.json();

    return data.definition;
}

async function activerDefinitions(){

    const mots = document.querySelectorAll("#zoneTexte .mot");

    mots.forEach(span => {

        span.addEventListener("mouseenter", async () => {

            // Éviter de refaire la requête
            if(span.dataset.definition) return;

            const mot = span.innerText;

            try{

                const definition = await obtenirDefinition(mot);

                span.title = definition;

                span.dataset.definition = definition;

            }catch(e){

                console.error(e);

            }

        });

    });

}
let writtenText = "";
// 1. COMPTEUR DE MOTS AUTOMATIQUE
function compterMots() {
    const text = document.getElementById('redaction-textarea').value.trim();
    // Sépare le texte par les espaces, retours à la ligne ou tirets
    const mots = text ? text.split(/[\s\-'\s]+/) : [];
    
    // Filtrer pour éviter de compter les éléments vides
    const nbMots = mots.filter(mot => mot.length > 0).length;
    
    document.getElementById('word-count').innerText = nbMots;
}

// 2. ACTION : CORRIGER LES FAUTES
async function corrigerRedaction(event) {
    event.preventDefault(); // Empêche le lien de recharger la page
    const texteEtudiant = document.getElementById('redaction-textarea').value.trim();
    
    if (!texteEtudiant) {
        alert("Veuillez d'abord rédiger un texte avant de lancer la correction.");
        return;
    }

    writtenText= texteEtudiant;

    const zoneResultat = document.getElementById('result-zone-redaction');
    const zoneNote = document.getElementById('redaction-grade');
    const zoneFeedback = document.getElementById('redaction-feedback');

    // Affichage de la zone de résultats
    zoneResultat.style.display = 'block';
    zoneResultat.style.borderColor = '#dc3545';
    
    // Simulation du traitement (À connecter plus tard avec votre logique IA FrançaisBoost)
   /* zoneNote.innerHTML = "Note : <span style='color: #dc3545;'>14 / 20</span>";
    zoneFeedback.innerHTML = "<strong>Remarques d'orthographe et de grammaire :</strong>\n" +
                             "- « *les thèmes choisi* » -> Attention à l'accord, écrivez plutôt : « les thèmes choisi**s** ».\n" +
                             "- Vos phrases sont globalement bien structurées, mais veillez à varier vos connecteurs logiques.";*/

 
    try {

        const response = await fetch("./api/corriger_redaction.php", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ redaction: writtenText })
        });
        
        // Vérifie si la requête a réussi
        if (!response.ok) {

            throw new Error("Erreur serveur");
        }
         // On récupère d'abord le texte brut pour diagnostiquer
        const raw = await response.text();
        console.log("Réponse brute serveur :", raw);
        try {
            data = JSON.parse(raw);
        } catch(e) {
            throw new Error("Le serveur ne renvoie pas du JSON : " + raw);
        }

        // const data = await response.json();
        console.log("Réponse API: ", data);

        if (!data || !data.text) {
            document.getElementById("redaction-feedback").innerHTML =
            "Correction impossible.";
            return;
        }

         // Récupération du JSON contenu dans text
        let resultat = data.text;
         resultat = resultat
        .replace(/```json\s*/i, "")
        .replace(/```/g, "")
        .trim();

         let correction;

         try {
            correction = JSON.parse(resultat);
        } catch(e) {
            console.error("JSON IA invalide :", resultat);
            zoneFeedback.innerHTML = 
            "<pre>" + resultat + "</pre>";
            return;
         }


          // Affichage note
         zoneNote.innerHTML =
                "Note : <span style='color:#198754;font-size:22px;font-weight:bold;'>" +
                correction.note +
                " / 20</span>";
         
        let html = "";
        html += "<h4 style='color:#dc3545;'>🔎 Points à corriger</h4>";
        if (correction.fautes && correction.fautes.length) {
            html += "<ul>";
            correction.fautes.forEach(f => {
                html += "<li>" + f + "</li>";
            });
            html += "</ul>";

        } else {
            html += "<p>Aucune faute détectée 🎉</p>";
        }

         html += "<h4 style='color:#198754;'>💡 Conseils d'amélioration</h4>";
        if (correction.conseils) {
            html += "<ul>";
            correction.conseils.forEach(c => {
            html += "<li>" + c + "</li>";
        });
        html += "</ul>";
         }

        zoneFeedback.innerHTML = html;

    } catch (error) {
           console.error(error);
           zoneFeedback.innerHTML =
                "<span style='color:red;font-weight:bold;'>❌ " 
                + error.message +
            "</span>";

        } finally {

        // Réactiver bouton
        //btn.disabled = false;
        //btn.innerText = "Corriger le texte";
    }
}


// 3. ACTION : SUGGESTIONS D'AMÉLIORATION
async function suggererAmelioration(event) {

    event.preventDefault();

    const texteEtudiant = document
        .getElementById('redaction-textarea')
        .value
        .trim();


    if (!texteEtudiant) {

        alert("Veuillez d'abord rédiger un texte pour obtenir des suggestions.");

        return;
    }


    const zoneResultat = document.getElementById('result-zone-redaction');
    const zoneNote = document.getElementById('redaction-grade');
    const zoneFeedback = document.getElementById('redaction-feedback');


    zoneResultat.style.display = 'block';
    zoneResultat.style.borderColor = '#28a745';


    zoneNote.innerHTML =
        "<span style='color:#28a745;'>✨ Version améliorée (Style & Vocabulaire)</span>";


    zoneFeedback.innerHTML =
        "<em>Amélioration en cours...</em>";



    try {


        const response = await fetch("./api/ameliorer_redaction.php", {

            method: "POST",

            headers: {
                "Content-Type": "application/json"
            },

            body: JSON.stringify({

                redaction: texteEtudiant

            })

        });



        if (!response.ok) {

            throw new Error("Erreur serveur");

        }



        const data = await response.json();


        console.log("Réponse amélioration :", data);



        if (!data || !data.text) {

            zoneFeedback.innerHTML =
                "Aucune amélioration reçue.";

            return;

        }



        // nettoyage éventuel markdown
        let texteAmeliore = data.text
            .replace(/```/g, "")
            .trim();



        zoneFeedback.innerHTML =

            "<h4 style='color:#198754;'>✨ Proposition améliorée</h4>" +

            "<div style='background:#f8f9fa;padding:15px;border-radius:10px;line-height:1.6;'>" +

            texteAmeliore +

            "</div>";



    } catch(error) {


        console.error(error);


        zoneFeedback.innerHTML =

        "<span style='color:red;font-weight:bold;'>❌ Erreur lors de l'amélioration du texte.</span>";

    }

}
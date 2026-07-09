    <link rel="stylesheet" href="../assets/css/style.css">
    <!--p style="margin-top:20px;">
    <a href="../index.php" style="text-decoration:none; color:white;">← Retour à la page principale</a>
    </p-->
    
    <div class="container">
        <h2>Module Dictée</h2>
           
      
        <label>Thème :</label>
        <input type="text" id="theme">
        <button id="generateBtn" onclick="generateText()"> Générer le texte </button>
        <hr>
     
       <h3>Ou choisir une dictée existante</h3>
        <select id="listeDictees"> 
            <option value="">-- Choisir une dictée --</option>
        </select>
        <button onclick="chargerDictee()"> Charger cette dictée </button>

    
        <div id="texte"></div>
        <br>
    
        <button onclick="startDictation()">▶️</button>
        <button onclick="repeatSentence()">🔁</button>
        <button onclick="nextSentence()">⏭</button>
        <button onclick="stopDictation()">⏹</button>
    
        <h3>Écris ce que tu entends :</h3>

        <textarea id="studentText" rows="10" cols="80"></textarea>

        <br><br>

        <button onclick="corrigerDictee()">Corriger</button>

        <h3>Résultat</h3>

        <div id="result"></div>
 


<script src="../assets/js/app.js"></script>
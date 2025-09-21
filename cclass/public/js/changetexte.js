function checkPassword(){
      
       var xmlhttp = new XMLHttpRequest();
       var obj={pseudo:$('#pseudo').val(),pwd:$('#password_input').val() };
       var dbParam = JSON.stringify(obj);
       

       xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) 
          {
                var myObj = JSON.parse(this.responseText);
               // alert(this.responseText);
                if(myObj._msg.localeCompare("OK")==0)
                {  
                    document.getElementById("connectSt").innerHTML='<a id="continue" class="log" href="index.php?action=connexion&id='+myObj._id+'" > Bonjour! Cliquez ici pour continuer</a>';
                    document.getElementById("continue").style.color = 'orange';
                    document.getElementById("pre").style.display = 'none';
                    document.getElementById("connectPr").style.display = 'none';
                }
                else
                {
                  alert('Accès refusé');
                }
         }
        }; 
        xmlhttp.open("POST", "index.php?action=authent", true);
        xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xmlhttp.send("x=" + dbParam);

    } 


   	function checkPasswordP(){
       
       var xmlhttp = new XMLHttpRequest();
       var obj={pseudo:$('#pseudo').val(),pwd:$('#password_input').val() };
       var dbParam = JSON.stringify(obj);
      

       xmlhttp.onreadystatechange = function() {
         
          if (this.readyState == 4 && this.status == 200) 
          {
                var myObj = JSON.parse(this.responseText);
               // alert(this.responseText);
                if(myObj._msg.localeCompare("OK")==0)
                {  
                    document.getElementById("connectPr").innerHTML='<a id="continue" class="log" href="index.php?action=connexionP&id='+myObj._id+'" > Bonjour! Cliquez ici pour continuer</a>';
                    document.getElementById("continue").style.color = 'orange';
                    document.getElementById("pre").style.display = 'none';
                    document.getElementById("connectSt").style.display = 'none';
                }
                else
                {
                  alert('Accès refusé');
                }
         }
        
      };
       
        xmlhttp.open("POST", "index.php?action=authentprof", true);
        xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xmlhttp.send("x=" + dbParam);

        }  

   function checkPasswordpre(){
      
       var xmlhttp = new XMLHttpRequest();
       var obj={pseudo:$('#pseudo').val(),pwd:$('#password_input').val()  };
       var dbParam = JSON.stringify(obj);
       
       xmlhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    var myObj = JSON.parse(this.responseText);
                if(myObj._msg.localeCompare("OK")==0){    
                    if(myObj._prog!='pre')
                       alert('Vous êtes déjà inscrit!'); 
                  else
                  { 
                    document.getElementById("pre").innerHTML='<a id="continue" class="log" href="index.php?action=preinscription&id='+myObj._id+' "> Bonjour! Cliquez ici pour continuer</a>';
                   // document.getElementById("connecte3").innerHTML='<a id="continue" class="log" href=# onclick='return sendid(myObj._id)'> Bonjour '+myObj._nom+'! Clique ici pour continuer</a>';
                    document.getElementById("continue").style.color = 'orange';
                  }
                }
                else
                {
                  alert('Accès refusé');
                }
              }
           };
       
        xmlhttp.open("POST", "index.php?action=authent", true);
        xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xmlhttp.send("x=" + dbParam);
       

        }  


 function inscription(){
            alert('heyx');
            const formData = getFormData();
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function(){

                if(this.readyState == 4 && this.status == 200){
                    alert('xxx'.this.response);
                    document.getElementById("btn").style.display='none';
                }
            };
           
            xhr.open("POST","index.php?action=inscription",true);
            xhr.send(formData);
        }

function getFormData(){
           
            var fd = new FormData();
            fd.append("lastname",  document.querySelector('[name="lastname"]').value);
            fd.append('firstname', document.querySelector('[name="firstname"]').value);
            fd.append('dateofbirth', document.querySelector('[name="dateofbirth"]').value);
            fd.append('email', document.querySelector('[name="email"]').value);
            fd.append('address', document.querySelector('[name="address"]').value);
            fd.append('phone', document.querySelector('[name="phone"]').value);
            fd.append("id", document.querySelector('[name="id"]').value);
            return fd;
        }
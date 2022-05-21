const requ = new XMLHttpRequest();
/* route vers la page liste api avec la methode post*/ 
requ.open('POST', 'index.php?codePage=listeAPI', true);
requ.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
//var args = "idPersonne=2";
 var args = "idAnimal=1&animal1=2";
requ.send(args);

requ.onreadystatechange = function(event) {
    // XMLHttpRequest.DONE === 4
    if (this.readyState === XMLHttpRequest.DONE) {
        if (this.status === 200) {
            console.log("Réponse reçue: %s", this.responseText);
            var divCount  = document.getElementById("anim");
            reponse=JSON.parse(this.responseText);
            console.log(reponse);
         
        } else {
            console.log("Status de la réponse: %d (%s)", this.status, this.statusText);
        }
    }
};


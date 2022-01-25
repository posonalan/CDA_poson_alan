const requ = new XMLHttpRequest();
/* route vers la page liste api */ 
requ.open('GET', 'index.php?codePage=listeAPI', true);

requ.send(null);

requ.onreadystatechange = function(event) {
    // XMLHttpRequest.DONE === 4
    if (this.readyState === XMLHttpRequest.DONE) {
        if (this.status === 200) {
            console.log("Réponse reçue: %s", this.responseText);
            var divCount  = document.getElementById("anim");
            reponse=JSON.parse(this.responseText);
            console.log(reponse);
            divCount.innerHTML=reponse.nb;
        } else {
            console.log("Status de la réponse: %d (%s)", this.status, this.statusText);
        }
    }
};


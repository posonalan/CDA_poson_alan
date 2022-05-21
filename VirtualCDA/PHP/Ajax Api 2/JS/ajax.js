// Utilisation de l'Ajax pour appeler l'API et récuperer les enregistrements
var contenu = document.getElementById("contenu");
var enregs; // contient la reponse de l'API
// on définit une requete
const req = new XMLHttpRequest();

reqText = "https://gallica.bnf.fr/SRU?version=1.2&operation=searchRetrieve&query="
//on envoi la requête

// document.getElementById("villeCherchee").addEventListener("change",function(){
//     req.open('GET', reqText+this.value, true);
//     req.send(null);
// })


//on vérifie les changements d'états de la requête
req.onreadystatechange = function (event) {
    if (this.readyState === XMLHttpRequest.DONE) {
        if (this.status === 200) {
            // la requete a abouti et a fournit une reponse
            //on décode la réponse, pour obtenir un objet
            reponse = JSON.parse(this.responseText);
            console.log(this.responseText);
            document.getElementById("libelleValue").textContent = reponse.libelleValue;
            document.getElementById("howMany").textContent = reponse.main.howMany;
            document.getElementById("value").textContent=reponse.wind.value;
    } else {
            console.log("Status de la réponse: %d (%s)", this.status, this.statusText);
        }
    }
};


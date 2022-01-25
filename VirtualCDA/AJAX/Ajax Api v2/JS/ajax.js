// Utilisation de l'Ajax pour appeler l'API et récuperer les enregistrements
var contenu = document.getElementById("contenu");
var enregs; // contient la reponse de l'API
// on définit une requete
const req = new XMLHttpRequest();

var section = document.getElementById("sec"); 

reqText ="https://anapioficeandfire.com/api/characters/"
//on envoi la requête

document.getElementById("namePerso").addEventListener("change", function () {
    // console.log(reqText+this.value);
    req.open('GET', reqText , true);
    req.send(null);
})


// //on vérifie les changements d'états de la requête
// req.onreadystatechange = function (event) {
//     if (this.readyState === XMLHttpRequest.DONE) {
//         if (this.status === 200) {
//             // la requete a abouti et a fournit une reponse
//             //on décode la réponse, pour obtenir un objet
//             reponse = JSON.parse(this.responseText);
//             console.log(this.responseText);
//             console.log(reponse);
//             for (let i = 0; i < )
//             document.getElementById("name").textContent = reponse.name;
//             document.getElementById("titles").textContent = reponse.titles;
//             document.getElementById("playedBy").textContent=reponse.playedBy;
//     } else {
//             console.log("Status de la réponse: %d (%s)", this.status, this.statusText);
//         }
//     }
// };


//on vérifie les changements d'états de la requête
req.onreadystatechange = function (event) {
    if (this.readyState === XMLHttpRequest.DONE) {
        if (this.status === 200) {
            // la requete a abouti et a fournit une reponse
            //on décode la réponse, pour obtenir un objet
            reponse = JSON.parse(this.responseText);
            console.log(this.response);
            // la requete a abouti et a fournit une reponse
            //on décode la réponse, pour obtenir un objet
            // reponse = JSON.parse(this.responseText);

            for (let i = 0; i < reponse.length; i++) {

                
                console.log(reponse[i].name);

                ligne = document.createElement("div");
                console.log(ligne);
                ligne.setAttribute("class", "grid");
                console.log(ligne);
                console.log(reponse[i]);

                elm = document.createElement("div");
                elm.setAttribute("class", "elm");
                elm.innerHTML = "Nom du personnage :";
                ligne.appendChild(elm);


                elm = document.createElement("div");
                elm.setAttribute("class", "elm");
                elm.innerHTML = reponse[i].name;
                ligne.appendChild(elm);

                elm = document.createElement("div");
                elm.setAttribute("class", "elm");
                elm.innerHTML = "titre de noblesse :";
                ligne.appendChild(elm);

                elm = document.createElement("div");
                elm.setAttribute("class", "elm");
                elm.innerHTML = reponse[i].titles;
                ligne.appendChild(elm);

                elm = document.createElement("div");
                elm.setAttribute("class", "elm");
                elm.innerHTML = "Acteur :";
                ligne.appendChild(elm);

                elm = document.createElement("div");
                elm.setAttribute("class", "elm");
                elm.innerHTML = reponse[i].playedBy[0];
                ligne.appendChild(elm);

              

                section.appendChild(ligne);
            }

        } else {
            console.log("Status de la réponse: %d (%s)", this.status, this.statusText);
        }
    }
}

const requ = new XMLHttpRequest();
var listeStagiaire = document.getElementsByClassName("listeStagiaire")[0];
var select = document.getElementsByTagName("select")[0];

select.addEventListener("change", changeBillet);

/**** GET */
// requ.open('GET', 'https://localhost:44334/api/Billeteries', true);
// requ.send();


/**** GET by ID  */
// requ.open('GET', 'https://localhost:44334/api/Billeteries/1', true);
// requ.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
// requ.send();


// /**** POST */
// requ.open('POST', 'https://localhost:44334/api/Billeteries', true);
// requ.setRequestHeader("Content-Type", "application/json");
// var args={
//     "idBillet": 0,
//     "libelleBillet": "nouveau"
//   }
//   requ.send(JSON.stringify(args));

//   /**** PUT */
//   requ.open('PUT', 'https://localhost:44334/api/Billeteries/1', true);
//   requ.setRequestHeader("Content-Type", "application/json");
//   var args={
//       "idBillet": 1,
//       "libelleBillet": "test"
//     }
//     requ.send(JSON.stringify(args));


// /**** Delete  */
// requ.open('DELETE', 'https://localhost:44334/api/Billeteries/6', true);
// requ.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
// requ.send();

/***************************************************************************** */

/**** GET */
requ.open('GET', 'https://localhost:44334/api/Stagiaires', true);
requ.send();


/**** GET by ID  */
// requ.open('GET', 'https://localhost:44334/api/Stagiaires/1', true);
// requ.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
// requ.send();


// /**** POST */
// requ.open('POST', 'https://localhost:44334/api/Stagiaires', true);
// requ.setRequestHeader("Content-Type", "application/json");
// var args={
//     "idStagiaire": 0,
//     "nom": "paris",
//     "prenom": "paris",
//     "idBilleterie": 1

//   }
//   requ.send(JSON.stringify(args));

  /**** PUT */
//   requ.open('PUT', 'https://localhost:44334/api/Stagiaires/1', true);
//   requ.setRequestHeader("Content-Type", "application/json");
//   var args={
//    "idStagiaire": 1,
//     "nom": "paris",
//     "prenom": "paris",
//     "idBilleterie": 1
//     }
//     requ.send(JSON.stringify(args));


// /**** Delete  */
// requ.open('DELETE', 'https://localhost:44334/api/Stagiaires/6', true);
// requ.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
// requ.send();


requ.onreadystatechange = function(event) {
    if (this.readyState === XMLHttpRequest.DONE) {
        if (this.status === 200) {
            console.log("Réponse reçue: %s", this.responseText);
            console.log("Réponse reçue: %s", this.responseText);
           
            reponse=JSON.parse(this.responseText);
            listeStage.innerHTML = "";

            for (let i = 0; i < reponse.length; i++) { //on traite les éléments de la liste ....
                ajoutStagiaire(reponse[i].nom,reponse[i].prenom, reponse[i].idStagiaire);
            }
            
        } else {
            console.log("Status de la réponse: %d (%s)", this.status, this.statusText);
        }
    }
};




/**************************FUNCTIONS **********/
function changeBillet(e) {
    if (select.value != "defaut") // si c'est pas le choix par defaut
    {
        // je lance une requete Ajax
        requ.open('POST', 'index.php?page=listeAPI', true);
        requ.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        var id = select.value; // id de la région choisie
        var args = "idBillet=" + id;
        requ.send(args);
    }

}

function ajoutStagiaire(libDepart, idDepart) {

    let stage = document.createElement("div");
    stage.setAttribute("class", "unStage");
    stage.setAttribute("id", idDepart);
    stage.innerHTML = libDepart;
    listeStage.appendChild(stage);
}
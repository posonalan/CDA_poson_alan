
var contenu = document.querySelector(".contenu");
const requ = new XMLHttpRequest();

/**** GET */
// requ.open('GET', 'https://localhost:44398/api/Billeteries', true);
// requ.send();


/**** GET by ID  */
// requ.open('GET', 'https://localhost:44398/api/Billeteries/1', true);
// requ.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
// requ.send();


// /**** POST */
// requ.open('POST', 'https://localhost:44398/api/Billeteries', true);
// requ.setRequestHeader("Content-Type", "application/json");
// var args={
//     "idBillet": 0,
//     "libelleBillet": "nouveau"
//   }
//   requ.send(JSON.stringify(args));

//   /**** PUT */
//   requ.open('PUT', 'https://localhost:44398/api/Billeteries/1', true);
//   requ.setRequestHeader("Content-Type", "application/json");
//   var args={
//       "idBillet": 1,
//       "libelleBillet": "test"
//     }
//     requ.send(JSON.stringify(args));


// /**** Delete  */
// requ.open('DELETE', 'https://localhost:44398/api/Billeteries/6', true);
// requ.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
// requ.send();

/***************************************************************************** */

/**** GET */
requ.open('GET', 'https://localhost:44398/api/Stagiaires', true);
requ.send();


/**** GET by ID  */
// requ.open('GET', 'https://localhost:44398/api/Stagiaires/1', true);
// requ.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
// requ.send();


// /**** POST */
// requ.open('POST', 'https://localhost:44398/api/Stagiaires', true);
// requ.setRequestHeader("Content-Type", "application/json");
// var args={
//     "idStagiaire": 0,
//     "nom": "paris",
//     "prenom": "paris",
//     "idBilleterie": 1

//   }
//   requ.send(JSON.stringify(args));

  /**** PUT */
//   requ.open('PUT', 'https://localhost:44398/api/Stagiaires/1', true);
//   requ.setRequestHeader("Content-Type", "application/json");
//   var args={
//    "idStagiaire": 1,
//     "nom": "paris",
//     "prenom": "paris",
//     "idBilleterie": 1
//     }
//     requ.send(JSON.stringify(args));


// /**** Delete  */
// requ.open('DELETE', 'https://localhost:44398/api/Stagiaires/6', true);
// requ.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
// requ.send();


requ.onreadystatechange = function(event) {
    if (this.readyState === XMLHttpRequest.DONE) {
        if (this.status === 200) {
            console.log("Réponse reçue: %s", this.responseText);;
            console.log(this.responseText);
            reponse=JSON.parse(this.responseText);
            
            
        } else {
            console.log("Status de la réponse: %d (%s)", this.status, this.statusText);
        }
    }
};

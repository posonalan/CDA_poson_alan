//Variables
const requ = new XMLHttpRequest();
var listeJeux = document.querySelector(".listeJeux");
var select = document.querySelector("select");

select.addEventListener("change",changeUtilisateur);

//Ajax
requ.onreadystatechange = function(event) {
    if (this.readyState === XMLHttpRequest.DONE) {
        if (this.status === 200) {
            console.log("Réponse reçue: %s", this.responseText);;
            reponse=JSON.parse(this.responseText);
            listeJeux.innerHTML="";
            for (let i = 0; i < reponse.length; i++) {
                ajoutJeux(reponse[i].idMarque, reponse[i].libelleJeu, reponse[i].idJeu);   
            }
            console.log(reponse);
        } else {
            console.log("Status de la réponse: %d (%s)", this.status, this.statusText);
        }
    }
};


//Functions

function changeUtilisateur(){
    if (select.value != "defaut"){
        // pour récupérer les oeuvres de l'auteur, on doit passer par la table associative => donc par la vue
        requ.open('POST', 'index.php?page=APIUtilisateursJeux', true);
        requ.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        var id = select.value;
        var args = "idUtilisateur=" + id;
        requ.send(args);
    }
}

function ajoutJeux(idMarque,libelleJeu,idJeu) {

    let jeu = document.createElement("div");
    jeu.setAttribute("class", "unJeu");
    jeu.setAttribute("id", idJeu);
    jeu.innerHTML = idMarque + ' : ' + libelleJeu;
    listeJeux.appendChild(jeu);
}




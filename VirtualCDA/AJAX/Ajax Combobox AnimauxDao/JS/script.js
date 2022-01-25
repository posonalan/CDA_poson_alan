/*****************VARIABLES ******************/

const requ = new XMLHttpRequest();
var listeAnimaux = document.getElementsByClassName("listeAnimaux")[0];
var select = document.getElementsByTagName("select")[0];

select.addEventListener("change", changeMilieuVie);

/*****************LISTENER ******************/
requ.onreadystatechange = function (event) {
    // XMLHttpRequest.DONE === 4
    if (this.readyState === XMLHttpRequest.DONE) {
        if (this.status === 200) {
            console.log("Réponse reçue: %s", this.responseText);
            reponse = JSON.parse(this.responseText);
            //on enleve les departements deja presents
            listeAnimaux.innerHTML = "";
            for (let i = 0; i < reponse.length; i++) { //on traite les éléments de la liste ....
                ajoutAnimal(reponse[i].libelleAnimal, reponse[i].idAnimal);
            }
        } else {
            console.log("Status de la réponse: %d (%s)", this.status, this.statusText);
        }
    }
};




/**************************FUNCTIONS **********/
function changeMilieuVie(e) {
    if (select.value != "defaut") // si c'est pas le choix par defaut
    {
        // je lance une requete Ajax
        requ.open('POST', 'index.php?page=listeAPI', true);
        requ.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        var id = select.value; // id de la région choisie
        var args = "idMilieuVie=" + id;
        requ.send(args);
    }

}

function ajoutAnimal(libDepart, idDepart) {

    let anim = document.createElement("div");
    anim.setAttribute("class", "unAnimal");
    anim.setAttribute("id", idDepart);
    anim.innerHTML = libDepart;
    listeAnimaux.appendChild(anim);
}


// declare la ville par defaut 
let villeChoisie = "warhem";
// on reçoit les info contenue dans villeChoisie 
recevoirTemperature(villeChoisie);
// on selectionne changer 
let changerDeVille = document.querySelector('#changer');
// quand on clique pour ecrire la ville 
changerDeVille.addEventListener('click', () => {
    villeChoisie = prompt('Quelle ville souhaitez-vous voir ?');
    recevoirTemperature(villeChoisie); 
}); 

// fonction pour aller chercher les info de temperature 
function recevoirTemperature(ville) {
    const url = 'https://api.openweathermap.org/data/2.5/weather?q=' + ville + '&appid=229a7f1ca981d5bf71a3e305c2af64ea&units=metric';

    let requete = new XMLHttpRequest(); // Nous créons un objet qui nous permettra de faire des requêtes
    requete.open('GET', url); // Nous récupérons juste des données
    requete.responseType = 'json'; // Nous attendons du JSON
    requete.send(); // Nous envoyons notre requête

    // Dès qu'on reçoit une réponse, cette fonction est executée
    requete.onload = function () {
        if (requete.readyState === XMLHttpRequest.DONE) {
            if (requete.status === 200) {
                let reponse = requete.response;
                console.log(reponse);
                let temperature = reponse.main.temp;
                let ville = reponse.name;
                let icon = reponse.weather[0].icon; // nous avons le code de l'icone ex: 02D
                let iconurl = "http://openweathermap.org/img/w/" + icon + ".png"; // ce code au dessus est mis dans le lien
                let vitesseVent = reponse.wind.speed;
             
                // mes test ok 
                //console.log(temperature);
                //console.log(ville);
                //console.log(icon);
                //console.log(iconurl);
                /* integration des variables */ 
                console.log(vitesseVent);
                document.querySelector('#temperature_label').textContent = Math.round(temperature);
                document.querySelector('#ville').textContent = ville;
                document.querySelector("#iconurl").innerHTML = '<img src="' + iconurl + '" />';
                document.querySelector("#vitesseVent").innerHTML = "<div class=vitesseVent>Vitesse du vent : " +vitesseVent+  " Km/h</div>";

            } else {
                /* Message d'erreur */ 
                alert('Un problème est intervenu, merci de revenir plus tard.');
            }
        }
    }
}

// je cherche aussi la date et l'heure 
function heure() {
    /* creation d'un nouvelle objet date */ 
    var ladate=new Date();
    /* recherche l'heure local */ 
    var n = ladate.toLocaleTimeString();
    console.log(n);
 document.querySelector("#horaire").innerHTML = n;
 }
 /* met a jours de l'horaire */ 
 setInterval("heure()", 1000);
 function date(){
 var ladate=new Date()
/* calcule de la date actuel */ 
document.querySelector("#date").innerHTML = (ladate.getDate()+"/"+(ladate.getMonth()+1)+"/"+ladate.getFullYear());
 console.log(ladate);
}
 date(); 
/* on selectionne toutes les classes "pliable" */ 
listePliable=document.querySelectorAll(".pliable");
/* on va chercher l'evenement clique */ 
listePliable.forEach(element => {
    element.addEventListener("click", mouvement); 
});
/* fonction mouvement (ouvert/fermer)*/ 
function mouvement(e){
    /* on met l'evenement sur pliable */ 
    pliable = e.target; 
    /* on va chercher la div qui qui permet de plier le contenue */ 
    divPliable = pliable.parentNode.parentNode.querySelector(".divPliable");
    /* si elle contient plier */ 
    if(divPliable.classList.contains("plier")){
        /* on masque le contenu */ 
        divPliable.classList.remove("plier"); 
    }else{
        /* sinon on l'affiche */ 
        divPliable.classList.add("plier");
    }
}
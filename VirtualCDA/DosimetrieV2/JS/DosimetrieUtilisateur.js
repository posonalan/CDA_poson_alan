/* on va chercher le select ( il n'y en a qu'un ) */ 
combo = document.querySelector("select"); 
/* nous allons chercher l'action */ 
combo.addEventListener("change", changeUtilisateur); 

function changeUtilisateur() {
    /* on modifie les données a afficher suivant la localisation */ 
    document.location.href="index.php?page=ListeDosimetriesUtilisateurs&id="+combo.value; 
}

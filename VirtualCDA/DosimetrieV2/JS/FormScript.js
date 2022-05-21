/* on selectionne les input de type fichier */ 
inputFiles = document.querySelectorAll("input[type=file]");
/* l'action au changement */ 
inputFiles.forEach(element => {
    element.addEventListener("change", choixImage);
});

function choixImage(e) {
    if (e.target.value.length > 0) {
        /* on recupere l'image */ 
        img = e.target.parentNode.parentNode.querySelector("img")
        imageType = /^image\//;
        fichier = e.target.files[0];
        /* si pas d'image selectionnée */
        if (!imageType.test(fichier.type)) {
            alert("veuillez sélectionner une image");
            e.target.value = "";
        } else {
            /* c'est bien un fichier de type image */
            img.file = fichier;
            /* interpretation par le navigateur */
            reader = new FileReader();
            /* charge une nouvelle image */
            reader.addEventListener("load", function(e){chargeImage(e,img)});
            /* le nom de l'image */
            reader.readAsDataURL(img.file);
            // on crée un nouvel input pour dire qu'il y a modification
            modif = document.createElement("input");
            /* on remplace l'image par la nouvelle */
            modif.name = "modifImage";
            /* on la masque */ 
            modif.type = "hidden";
            e.target.parentNode.appendChild(modif);
        }
    }
}

/* fonction de chargement de l'image */
function chargeImage(e,img) {
    img.src = e.target.result;
}
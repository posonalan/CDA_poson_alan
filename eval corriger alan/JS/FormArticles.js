



inputFile = document.querySelector("input[type=file]");
img = inputFile.parentNode.parentNode.querySelector("img")
if (inputFile!=undefined)
{
    inputFile.addEventListener("change", choixImage);
}

function choixImage(e) {
    if (inputFile.value.length > 0) {
        imageType = /^image\//;
        fichier = e.target.files[0];
        /* si pas d'image selectionnée */ 
        if (!imageType.test(fichier.type)) {
            alert("veuillez sélectionner une image");
            e.target.value = "";
        } else {
            /* si pas d'image */ 
            img.file = fichier;
            /* interpretation par le navigateur */ 
            reader = new FileReader();
            /* charge une nouvelle image */ 
            reader.addEventListener("load", chargeImage);
            /* le nom de l'image */ 
            reader.readAsDataURL(img.file);
            // on crée un nouvel input pour dire qu'il y a modification
            modif = document.createElement("input");
            /* on remplace l'image par la nouvelle */ 
            modif.name = "modifImage";
            modif.type = "hidden";
            inputFile.parentNode.appendChild(modif);
        }
    }
}
/* fonction de chargement de l'image */ 
function chargeImage(e) {
    img.src = e.target.result;
}

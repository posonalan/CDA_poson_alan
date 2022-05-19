/* on va rechercher le bouton ajouter une activite */
var boutonAdd = document.getElementById('BtnAddActivite');
/* on recupere l'action clique */
boutonAdd.addEventListener('click', addLigne)
/* fonction ajout une activité */
function addLigne() {
  /* on va chercher le contenu du template */
  var templ = document.getElementById('NewActivite');
  /* le contenu d'ajout d'activite */
  var divAdd = document.getElementById('AddActivite');
  /* on fait une copie du template */
  var nouvActivite = templ.content.cloneNode(true);
  divAdd.appendChild(nouvActivite);
  /* on prend la 1er valeur d'identifiant operation */
  idOpe = document.getElementsByName('IdOperation')[0].value;
  idOperation = document.getElementById("AddIdOperation");
  idOperation.value = idOpe;
  /* on selectionne l'input de type fichier */
  inputFile = idOperation.parentNode.querySelector('input[type=file]');
  /* et on met a jour la photo */
  inputFile.addEventListener('change', choixImage);
  /* reset de l'id */
  idOperation.id = "";
}
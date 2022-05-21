var boutonAdd = document.getElementById('BtnAddProtection');
boutonAdd.addEventListener('click',addLignePro)
function addLignePro() {

  var templ = document.getElementById('NewProtection');
  var divAdd = document.getElementById('AddProtection');
  var nouvProtection = templ.content.cloneNode(true);
  divAdd.appendChild(nouvProtection);
  /* changer les Id et les names des inputs*/
  idAct = document.getElementsByName('IdActivite')[0].value;
  idActivite = document.getElementById("AddIdActivite");
 idActivite.value= idAct;
inputFile= idActivite.parentNode.querySelector('input[type=file]');
inputFile.addEventListener('change',choixImage);

 idActivite.id="";

}
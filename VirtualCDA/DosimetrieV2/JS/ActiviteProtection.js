/* on va chercher les IdProtection */ 
var selects = document.querySelectorAll('#IdProtection');
/* l'action */ 
selects.forEach(element => {
  element.addEventListener('change', AjoutActiviteProtection);
});

function AjoutActiviteProtection(e) {
  /* changer les Id et les names des inputs*/
  idAct = e.target.previousElementSibling.querySelector('input[name=IdActivite]').value;
  idOp = document.querySelector('input[name=IdOperation]').value;
  /* on ajoute une protection a la localisation */ 
  document.location.href = "index.php?page=ActionActivites_Protections&mode=Ajouter&idAct=" + idAct + "&idPro=" + e.target.value + "&idOp=" + idOp;
}
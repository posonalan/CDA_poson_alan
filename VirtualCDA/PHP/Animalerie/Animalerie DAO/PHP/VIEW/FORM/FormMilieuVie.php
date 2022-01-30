<?php
/* on recupere le role dans l'url */ 
$mode = $_GET['mode'];
echo '<div class="demiPage colonne">';
echo '<div id="DivSousTitre">';

/*  on le met vide */ 
$disabled = " ";
switch ($mode) {
    /* on cache le bouton editer et supprimer */ 
    case "Editer":
    case "Supprimer":
        $disabled = " disabled ";
        break;
}
/* on va chercher l'milieu */ 
echo '  <h5>'.$mode.' un milieu de vie </h5></div>
        <form id="formulaire" method="post" action="index.php?page=actionMilieuVie&mode='.$mode.'">';
/* on va chercher l'id dans l'http */ 
if (isset($_GET['id'])) {
    /* recuperation de l'id */ 
    $milieu = MilieuViesManager::findById($_GET['id']);
}
else{
    /* sinon on crée un nouvel objet */ 
    $milieu = new MilieuVies();
}
/* on cache l'id quand meme , faut garder son jardin secret */ 
echo '  <input type="hidden" name="idMilieuVie" value="' . $milieu->getIdMilieuVie() . '">';
echo '  <label> Type de milieu :</label>
        <input type="text" name="libelleMilieuVie" value="' . $milieu->getLibelleMilieuVie() . '"' .$disabled.'>';
echo '  <label> Situation geographique  :</label>
        <input type="text" name="situationGeographique" value="' . $milieu->getSituationGeographique() . '"' .$disabled.'>';
        echo '  <label> Climat :</label>
        <input type="text" name="climat" value="' . $milieu->getClimat() . '"' .$disabled.'>';
      


echo '<input type="submit" value="'.$mode.'" class=" crudBtn crudBtn'.$mode.'"/>';




echo '<a href="index.php?page=listeMilieuVie" class=" crudBtn crudBtnRetour">Annuler</a>
</form>';
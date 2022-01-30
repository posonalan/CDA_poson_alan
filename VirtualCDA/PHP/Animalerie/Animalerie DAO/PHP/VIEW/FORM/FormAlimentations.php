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
/* on va chercher l'aliment */ 
echo '  <h5>'.$mode.' un aliment </h5></div>
        <form id="formulaire" method="post" action="index.php?page=actionAlimentations&mode='.$mode.'">';
/* on va chercher l'id dans l'http */ 
if (isset($_GET['id'])) {
    /* recuperation de l'id */ 
    $aliment = AlimentationsManager::findById($_GET['id']);
}
else{
    /* sinon on crée un nouvel objet */ 

    $aliment = new Alimentations();
   // var_dump($aliment); 
}
/* on cache l'id quand meme , faut garder son jardin secret */ 
echo '  <input type="hidden" name="idAliment" value="' . $aliment->getIdAliment() . '">';
echo '  <label> Libelle :</label>
        <input type="text" name="libelleAliment" value="' . $aliment->getLibelleAliment() . '"' .$disabled.'>';
echo '<input type="submit" value="'.$mode.'" class=" crudBtn crudBtn'.$mode.'"/>';

echo '<a href="index.php?page=listeAlimentations" class=" crudBtn crudBtnRetour">Annuler</a>
</form>';
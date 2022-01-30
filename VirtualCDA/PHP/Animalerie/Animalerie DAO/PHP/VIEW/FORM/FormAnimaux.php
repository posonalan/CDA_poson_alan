<?php
$defaultMode =  $_GET['mode'];
$modeTraduit = ($defaultMode);
echo '<div class="demiPage colonne">';
echo '<div id="DivSousTitre" >';

$disabled = " ";
switch ($defaultMode) {
    case "Editer":
    case "Supprimer":
        $disabled = " disabled ";
        break;
}

echo '<h5>' . $modeTraduit . 'CrudTache' . '</h5></div>
<form id="formulaire" method="post" action="index.php?page=actionAnimaux&mode=' . $defaultMode . '">';
if (isset($_GET['id'])) {
    $tac = AnimauxManager::findById($_GET['id']);
    $listeAliment = AlimentationsManager::getList();
    $listeMilieuVie = MilieuViesManager::getList();
    
    $idMilieu= $tac->getIdMilieuVie();
    $idAlim= $tac->getIdAliment();
   
} else {
    $tac = new Animaux();
    $idAlim = null;
    $idMilieu = null;
   
}

$listeAliment = AlimentationsManager::getList();
$listeMilieuVie = MilieuViesManager::getList();

// on crée les inputs du formulaire
// il faut que les name des input correspondent aux attributs de la class
// si on a les informations (cas Editer, Modifier, supp) on les mets à jour
echo '  <input type="hidden" name="idAnimal" value="' . $tac->getIdAnimal() . '">';
echo '  <label>LibelleAnimal:</label>
        <input type="text" name="libelleAnimal" value="' . $tac->getLibelleAnimal() . '"' . $disabled . '>';
echo '  <label>prix:</label>
        <input type="text" name="prix" value="' . $tac->getPrix() . '"' . $disabled . '>';
echo '  <label>DateDeNaissance :</label>
        <input type="date" name="DateDeNaissance" value="' . $tac->getDateDeNaissance() . '"' . $disabled . '>';

echo '  <label>Alimentations:</label>
        <select name="idAliment" ' . $disabled . '>';
foreach ($listeAliment as $unAlim) {
    $sel = "";
    if ($unAlim->getIdAliment() == $idAlim) {
        $sel = "selected";
    }

    echo '<option value="' . $unAlim->getIdAliment() . '" ' . $sel . ' >' . $unAlim->getLibelleAliment() . '</option>';
}
echo '</select>';

echo '  <label>Milieu Vies :</label>
        <select name="idMilieuVie" ' . $disabled . '>';
foreach ($listeMilieuVie as $unMilieux) {
    $sel = "";
    if ($unMilieux->getIdMilieuVie() == $idMilieu) {
        $sel = "selected";
    }

     echo '<option value="' . $unMilieux->getIdMilieuVie() . '" ' . $sel . ' >' . $unMilieux->getLibelleMilieuVie() . '</option>';
    
}
echo '</select>';

echo '<label>Situation Geaographique :</label>
        <select name="idMilieuVie" ' . $disabled . '>';
foreach ($listeMilieuVie as $unMilieu) {
    $sel = "";
    if ($unMilieu->getIdMilieuVie() == $idMilieu) {
        $sel = "selected";
    }

     echo '<option value="' . $unMilieu->getIdMilieuVie() . '" ' . $sel . ' >' .$unMilieu->getSituationGeographique() . '</option>';
    
}
echo '</select>';



if ($defaultMode != 'Editer'){ 
    echo '<input type="submit" value="' . $modeTraduit . '" class=" crudBtn crudBtn' . $defaultMode . '"/>';
}else {echo '<div></div>';}
echo '
<a href="index.php?page=listeAnimaux" class=" crudBtn crudBtnRetour">Annuler</a>
</div>
</form>';

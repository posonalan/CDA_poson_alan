<?php
$mode = $_GET['mode'];
echo '<div class="demiPage colonne">';
echo '<div id="DivSousTitre" >';

$disabled = " ";
switch ($mode) {
    case "Editer":
    case "Supprimer":
        $disabled = " disabled ";
        break;
}

echo '<h5>' . $mode . ' un nouvelle animal</h5></div>
<form id="formulaire" method="post" action="index.php?page=actionAnimaux&mode=' . $mode . '">';
if (isset($_GET['id'])) {
    $animal = AnimauxManager::findById($_GET['id']);
    $idAliment = $animal->getIdAliment();
    $idMilieu = $animal->getIdMilieuVie();
} else {
    $animal = new Animaux();
    $idAliment = null;
    $idMilieu = null;
}

 $listeAliment = AlimentationsManager::getList();
$listeMilieu = MilieuVieManager::getList();

// on crée les inputs du formulaire
// il faut que les name des input correspondent aux attributs de la class
// si on a les informations (cas Editer, Modifier, supp) on les mets à jour
echo '  <input type="hidden" name="idAnimal" value="' . $animal->getIdAnimal() . '">';
echo '  <label> Libelle :</label>
        <input type="text" name="libelleAnimal" value="' . $animal->getLibelleAnimal() . '"' . $disabled . '>';
echo '  <label>Prix :</label>
        <input type="number" name="prix" value="' . $animal->getPrix() . '"' . $disabled . '>';
echo '  <label>Date de naissance :</label>
        <input type="date" name="dateDeNaissance" value="' . $animal->getDateDeNaissance() . '"' . $disabled . '>';

        /* alimentation */ 
echo '  <label>Alimentations :</label>
        <select name="idAliment" '.$disabled.'>';
foreach ($listeAliment as $uneAlimentation) {
    $sel = "";
    if ($uneAlimentation->getIdAliment() == $idAliment) {
        $sel = "selected";
    }

    echo '<option value="' . $uneAlimentation->getIdAliment() . '" ' . $sel . ' >' . $uneAlimentation->getLibelleAliment() . '</option>';
}
echo '</select>';
/* milieu de vie */ 
echo '  <label>Milieu de vie :</label>
        <select name="idMilieuVie" '.$disabled.'>';
foreach ($listeMilieu as $unMilieux) {
    $sel = "";
    if ($unMilieux->getIdMilieuVie() == $idMilieu) {
        $sel = "selected";
    }

    
    echo '<option value="' . $unMilieux->getIdMilieuVie() . '" ' . $sel . ' >' . $unMilieux->getLibelleMilieuVie() . '</option>';
}
echo '</select>';

/* milieu de vie */ 
echo '  <label>Type de milieu :</label>
        <select name="idMilieuVie" '.$disabled.'>';
foreach ($listeMilieu as $unMilieu) {
    $sel = "";
    if ($unMilieu->getIdMilieuVie() == $idMilieu) {
        $sel = "selected";
    }

  
    echo '<option value="' . $unMilieu->getIdMilieuVie() . '" ' . $sel . ' >' . $unMilieu->getTypeMilieuVie() . '</option>';
}

echo '
    </select>
    </div>';

echo '<div class="ligneDetail"><input type="submit" value="' . $mode . '" class=" crudBtn crudBtn' . $mode . '"/>';
echo '
<a href="index.php?page=listeAnimaux" class=" crudBtn crudBtnRetour">Annuler</a>
</div>
</div>
</form>';
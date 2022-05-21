<?php
$liste = AnimauxManager::getList();
// $listeAliment = AlimentationsManager::getList();
?>
<div class="demiPage colonne">
    <div id="crudBarreOutil">
        <a class=" crudBtn crudBtnOutil" href='index.php?page=formAnimaux&mode=Ajouter'>Ajouter </a>
    </div>
    <div id="crudTableauAnimaux">

        <div class="crudColonne">Libellé</div>
        <div class="crudColonne">Prix (€)</div>
        <div class="crudColonne">Date de naissance </div>
        <div class="crudColonne">Regime Alimentaire</div>
        <div class="crudColonne">Milieu de vie </div>
        <div class="crudColonne">Type de milieu</div>

        <div></div>
        <div></div>
        <div></div>
        <div></div>

        <?php foreach ($liste as $elt) {
            echo '<div class="crudColonne">' . $elt->getLibelleAnimal() . '</div>
    <div class="crudColonne">' . $elt->getPrix() . '</div>
    <div class="crudColonne">' . $elt->getDateDeNaissance() . '</div>';
            $unAliment = AlimentationsManager::findById($elt->getIdAliment());
            echo ' <div class="crudColonne">' . $unAliment->getLibelleAliment() . '</div>';
            $unMilieu = MilieuVieManager::findById($elt->getIdMilieuVie());
            echo ' <div class="crudColonne">' . $unMilieu->getLibelleMilieuVie() . '</div>';
            echo ' <div class="crudColonne">' . $unMilieu->getTypeMilieuVie() . '</div>
    <div></div>
    ';
            echo '
    <a class=" crudBtn crudBtnEditer" href="index.php?page=formAnimaux&mode=Editer&id=' . $elt->getIdAnimal() . '">Afficher </a>
        <a class=" crudBtn crudBtnModifier" href="index.php?page=formAnimaux&mode=Modifier&id=' . $elt->getIdAnimal() . '">Modifier</a>
        <a class=" crudBtn crudBtnSupprimer" href="index.php?page=formAnimaux&mode=Supprimer&id=' . $elt->getIdAnimal() . '">Supprimer</a>
    ';
        } ?>


    </div>
</div>
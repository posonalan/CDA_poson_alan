<?php
$liste = AnimauxManager::getList();
?>
<div class="demiPage colonne">
    <div id="crudBarreOutil">
        <a class=" crudBtn crudBtnOutil" href='index.php?page=formAnimaux&mode=Ajouter'>Ajouter </a>
    </div>
    <div id="crudTableau">

        <div class="crudColonne">Libellé</div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <?php foreach ($liste as $elt) {
            echo '<div class="crudColonne">' . $elt->getLibelleAnimal() . '</div>
            <div></div>    
            <a class=" crudBtn crudBtnEditer" href="index.php?page=formAnimaux&mode=Editer&id='. $elt->getIdAnimal().'">Afficher </a>
                <a class=" crudBtn crudBtnModifier" href="index.php?page=formAnimaux&mode=Modifier&id='.$elt->getIdAnimal().'">Modifier</a>
                <a class=" crudBtn crudBtnSupprimer" href="index.php?page=formAnimaux&mode=Supprimer&id='. $elt->getIdAnimal().'">Supprimer</a>
            ';
        } ?>

    </div>
</div>
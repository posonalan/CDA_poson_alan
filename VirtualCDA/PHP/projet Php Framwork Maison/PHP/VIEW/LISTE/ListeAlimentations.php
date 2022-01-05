<?php
$liste = AlimentationsManager::getList();
?>
<div class="demiPage colonne">
    <div id="crudBarreOutil">
        <a class=" crudBtn crudBtnOutil" href='index.php?page=formAlimentations&mode=Ajouter'>Ajouter </a>
    </div>
    <div id="crudTableau">

        <div class="crudColonne">Libellé</div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>

        <?php foreach ($liste as $elt) {

            echo '<div class="crudColonne">' . $elt->getLibelleAliment() . '</div>
                <div></div>
                <a class=" crudBtn crudBtnEditer" href="index.php?page=form>Alimentations&mode=Editer&id=' . $elt->getIdAlimentations() . '">Afficher </a>
                <a class=" crudBtn crudBtnModifier" href="index.php?page=formAlimentations&mode=Modifier&id=' . $elt->getIdAlimentations() . '">Modifier</a>
                <a class=" crudBtn crudBtnSupprimer" href="index.php?page=formAlimentations&mode=Supprimer&id=' . $elt->getIdAlimentations() . '">Supprimer</a>
             ';
        } ?>

    </div>

</div>
<?php
$liste = AlimentationsManager::getList();
?>
<div class="demiPage colonne">

<div class= "titreListe">Liste Aliments</div>

    <div id="crudBarreOutil">
        <a class=" crudBtn crudBtnOutil" href='index.php?page=formAlimentations&mode=Ajouter'>Ajouter </a>
    </div>
    <div id="crudTableau2">

        <div class="crudColonne">Libellé</div>
       <div class="crudColonne">Identifiant aliment</div>
       <div></div>
       <div></div>
       <div></div>
      
       
        <?php foreach ($liste as $elt) {

            echo '<div class="crudColonne">' . $elt->getLibelleAliment() . '</div>
            <div class="crudColonne">' . $elt->getIdAliment() . '</div>
             <a class=" crudBtn crudBtnEditer" href="index.php?page=formAlimentations&mode=Editer&id=' . $elt->getIdAliment() . '">Afficher </a>
    <a class=" crudBtn crudBtnModifier" href="index.php?page=formAlimentations&mode=Modifier&id=' . $elt->getIdAliment() . '">Modifier</a>
    <a class=" crudBtn crudBtnSupprimer" href="index.php?page=formAlimentations&mode=Supprimer&id=' . $elt->getIdAliment() . '">Supprimer</a>
  ';
        } ?>


    </div>

</div>
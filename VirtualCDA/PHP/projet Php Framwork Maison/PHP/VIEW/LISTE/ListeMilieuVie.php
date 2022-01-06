<?php
$liste = MilieuVieManager::getList();
?>
<div class="demiPage colonne">
    <div id="crudBarreOutil">
        <a class=" crudBtn crudBtnOutil" href='index.php?page=formMilieuVie&mode=Ajouter'>Ajouter </a>
    </div>
    <div id="crudTableau">

        <div class="crudColonne">Libellé</div>
       <div class="crudColonne">Type de milieu</div>
       <div></div>
       <div></div>
       <div></div>
      
      
       
        <?php foreach ($liste as $elt) {

            echo '<div class="crudColonne">' . $elt->getLibelleMilieuVie() . '</div>
            <div class="crudColonne">' . $elt->getTypeMilieuVie() . '</div>
             <a class=" crudBtn crudBtnEditer" href="index.php?page=formMilieuVie&mode=Editer&id=' . $elt->getIdMilieuVie() . '">Afficher </a>
    <a class=" crudBtn crudBtnModifier" href="index.php?page=formMilieuVie&mode=Modifier&id=' . $elt->getIdMilieuVie() . '">Modifier</a>
    <a class=" crudBtn crudBtnSupprimer" href="index.php?page=formMilieuVie&mode=Supprimer&id=' . $elt->getIdMilieuVie() . '">Supprimer</a>
  ';
        } ?>


    

</div>
<?php
$liste = AnimauxManager::getList();
?>
<div class="demiPage colonne">

<div class= "titreListe">Liste Animaux</div>

    <div id="crudBarreOutil">
        <a class=" crudBtn crudBtnOutil" href='index.php?page=formAnimaux&mode=Ajouter'> Ajouter </a>
    </div>
    <div id="crudTableau10Col">

    <div class="crudColonne">LibelleAnimal</div>
    <div class="crudColonne">Prix</div>
    <div class="crudColonne">DateDeNaissance</div>
    <div class="crudColonne">LibelleAliment</div>
    <div class="crudColonne">LibelleMilieuVie</div>
    <div class="crudColonne">SituationGeo</div>

        <div></div> 
        <div></div> 
        <div></div>
        <div></div> 
        <?php foreach ($liste as $elt) {
            echo '<div class="crudColonne">' . $elt->getLibelleAnimal() . '</div>';
             echo '<div class="crudColonne">' . $elt->getPrix() . '</div>';
            echo '<div class="crudColonne">' . $elt->getDateDeNaissance() . '</div>';
            
            $unAliment = AlimentationsManager::findById($elt->getIdAliment());
            echo ' <div class="crudColonne">' . $unAliment->getLibelleAliment() . '</div>';
            $unMilieuVie = MilieuViesManager::findById($elt->getIdMilieuVie());
            echo ' <div class="crudColonne">' . $unMilieuVie->getLibelleMilieuVie() . '</div>';
            $unMilieuVie = MilieuViesManager::findById($elt->getIdMilieuVie());
            echo ' <div class="crudColonne">' . $unMilieuVie->getSituationGeographique() . '</div>';
        
            
           
 
            echo '<div></div>   
            <a class=" crudBtn crudBtnEditer" href="index.php?page=formAnimaux&mode=Editer&id='. $elt->getIdAnimal().'">'. 'Editer' .'</a>
                <a class=" crudBtn crudBtnModifier" href="index.php?page=formAnimaux&mode=Modifier&id='.$elt->getIdAnimal().'">'. 'Modifier' .'</a>
                <a class=" crudBtn crudBtnSupprimer" href="index.php?page=formAnimaux&mode=Supprimer&id='. $elt->getIdAnimal().'">'. 'Supprimer' .'</a>
            ';
        } ?>

    </div>
</div>

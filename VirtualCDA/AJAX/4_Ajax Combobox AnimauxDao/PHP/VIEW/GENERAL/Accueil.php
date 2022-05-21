<?php
$listeMilieuVie = MilieuViesManager::getList();
// $listeMilieuVie = MilieuViesManager::getList(false);
?>
<div class="accueil">
    <div class="selectAnim">
        <select>
            <option value="defaut" selected>--Choisissez le milieu de vie --</option>
            <?php
            foreach ($listeMilieuVie as $elt) {
                echo '<option value="' . $elt->getIdMilieuVie() . '">' . $elt->getLibelleMilieuVie() . '</option>';
            }

            ?>
        </select>
    </div>
    
    <div class="listeAnimaux colonne">

        <div class="unAnimal"></div>
    </div>
    <div></div>
    <div></div>
    <div></div>
    <div></div>
</div>
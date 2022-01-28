<?php
$listeBillet = BilleterieManager::getList();

?>
<div class="accueil">
    <div class="select">
        <select>
            <option value="defaut" selected>--Choisissez un Billet--</option>
            <?php
            foreach ($listeBillet as $elt) {
                echo '<option value="' . $elt->getIdBillet() . '">' . $elt->getLibelleBillet() . '</option>';
            }

            ?>
        </select>
    </div>
    
    <div class="listeStage colonne">

        <div class="unStage"></div>
    </div>
    <div></div>
    <div></div>
    <div></div>
    <div></div>
</div>
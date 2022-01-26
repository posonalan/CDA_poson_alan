<?php
$listeUtilisateurs = UtilisateursManager::getList();
?>
<div class="padd1"></div>
<div class="blockUJ">
    <div class="flex06"></div>
    <div class="blockUJ column">
        <select>
            <option value="defaut" selected>--Choisissez votre Utilisateur--</option>
            <?php
            foreach ($listeUtilisateurs as $elt) {
                echo '<option value="' . $elt->getIdUtilisateur() . '">' . $elt->getNom() . " " . $elt->getPrenom() . '</option>';
            }
            ?>

        </select>
        <div class="listeJeuxFormat">
            <div class="listeJeux column"></div>
        </div>
    </div>
    <div class="flex06"></div>

</div>
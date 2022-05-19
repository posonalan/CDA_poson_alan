<?php

echo '<div>';

$objets = ChantiersManager::getList();
?>
<div class="">
   <div class="testColonne">
      <div class="espaceV"></div>
      <div class="alignement "> Liste des Chantiers: </div>
      <div class="grid-col-5">
         <div></div>
         <?php
            if($_SESSION["utilisateur"]->getIdRole()>1){
               echo'<a class="boutonAdd" href="index.php?page=FormChantiers&mode=Ajouter">Ajouter</a>';
            }
         ?>   
         <div></div>
         <a href="index.php?page=Localisation">
                  <button class="boutonAdd flex1"><i class="fas fa-sign-out-alt fa-rotate-180"></i></button>
            </a>
      </div>
      <div class="espace4"></div>
      <div class="colonne">
         <div class="marge"></div>
         <div class="bas">
            <?php
            foreach ($objets as $unObjet) {
               echo '<div class="blockListe">
               <div class="demi"></div>
                     <a href="index.php?page=FormChantiers&mode=Afficher&id=' . $unObjet->getIdChantier() . '">
                        <div class="categAccueil">
                           <div class="espace"></div>
                           <img src="./IMG/' . $unObjet->getPhotoChantier() . '"/>
                           <div class="espace"></div>
                           <div class="">' . $unObjet->getLibelleChantier() . '</div>
                           <div class="espace"></div>
                        </div>
                     </a>
                     <div class="demi"></div>
                     </div>';
            }?>
         </div>
         <div class="marge"> </div>
         <div class="espace4"></div>
         <div>
            <div class="flex2"></div>
           
            <div class="flex2"></div>
         </div>
         <div class="espace4"></div>
      </div>
   </div>
</div>
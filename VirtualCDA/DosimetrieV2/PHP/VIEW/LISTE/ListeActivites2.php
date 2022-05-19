<?php
echo '<div class ="margin"></div>';
echo '<main>';
echo '<div>';

$objets = ActivitesManager::getList();

?>
<div class="ConnexionFond">
   <div class="testColonne">
      <div class="espaceV"></div>
      <div class="alignement "> Liste des Activites </div>

      <div class="grid-col-5">
         <div></div>

         <a class="boutonAdd" href="index.php?page=FormActivites&mode=Ajouter">Ajouter</a>
         <div></div>
         <a href="index.php?page=Accueil">
            <button><i class="fas fa-sign-out-alt fa-rotate-180"></i></button>
         </a>
      </div>
      <div class="espaceV"></div>
      <div class="testRow">
         <div class="marge"> </div>
         <div class="bas">
            <?php
            foreach ($objets as $unObjet) {

               echo '<a href="index.php?page=FormActivites&mode=Afficher&id=' . $unObjet->getIdActivite() . '">';

               echo '<div class="partieAcc">';
               echo '<img src="./IMG/' . $unObjet->getPhotoActivite() . '"/>';

               echo '<div class=" titreObjet marginDouce">' . $unObjet->getLibelleActivite() . '</div>';
               echo '</div>';
               echo '</a>';
            } ?>

         </div>

         <div class="marge"> </div>
         <div class="margin"></div>
      </div>

   </div>



</div>
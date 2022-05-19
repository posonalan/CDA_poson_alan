<?php
echo '<div>';
$objets = UtilisateursManager::getList();

?>
<div class="">
   <div class="testColonne ">
      <div class="espaceV"></div>
      <div class="alignement"> Liste des Utilisateurs </div>

      <div class="grid-col-5">
         <div></div>
         
         <a class="boutonAdd" href="index.php?page=FormUtilisateurs&mode=Ajouter">Ajouter</a>
         <div></div>
         <a href="index.php?page=Accueil">
               <button><i class="fas fa-sign-out-alt fa-rotate-180"></i></button>
            </a>
      </div>
      <div class="espaceV"></div>
      <div class="testRow">
         <div class="marge"></div>
         <div class="bas">
            <?php
            foreach ($objets as $unObjet) {

               echo '<a href="index.php?page=FormUtilisateurs&mode=Afficher&id=' . $unObjet->getIdUtilisateur() . '">';
               echo '<div class=" titreObjet marginDouce">' . $unObjet->getLibelleUtilisateur() . '</div>';
               echo '</div>';

               echo '</a>';
            } ?>

         </div>;


         <div class="marge"> 
         </div>
      
      </div>
   </div>
</div>
  
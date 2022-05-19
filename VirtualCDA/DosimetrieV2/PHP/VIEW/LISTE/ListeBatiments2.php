<?php

echo '<div>';

$objets = BatimentsManager::getList();
?>
<div class="">
   <div class="testColonne">
      <div class="espaceV"></div>
      <div class="alignement "> Liste des Batiments: </div>
      <div class="grid-col-5">
      <div></div>
      <?php
      /* accessible a l'admin uniquement */ 
         if($_SESSION["utilisateur"]->getIdRole()>1){
            echo'
               <a class="boutonAdd" href="index.php?page=FormBatiments&mode=Ajouter">Ajouter</a>
               ';
         }
      ?>   
         <div></div>
      </div>
      <div class="espaceV"></div>
      <div class="colonne">
         <div class="marge"> </div>
         <div class="bas">
            <?php
            foreach ($objets as $unObjet) {
               echo '<div class="demi"></div>
                     <a href="index.php?page=FormBatiments&mode=Afficher&id=' . $unObjet->getIdBatiment() . '">
                        <div class="categAccueil">
                           <div class="espace"></div>
                           <img src="./IMG/' . $unObjet->getPhotoBatiment() . '"/>
                           <div class="espace"></div>
                           <div class="">' . $unObjet->getLibelleBatiment() . '</div>
                           <div class="espace"></div>
                        </div>
                     </a>
                     <div class="demi"></div>';
            }?>
         </div>
         <div class="marge"> </div>
         <div class="espaceV"></div>
         <div>
            <div class="flex2"></div>
            <a href="index.php?page=Localisation">
                  <button class="boutonAdd flex1"><i class="fas fa-sign-out-alt fa-rotate-180"></i></button>
            </a>
            <div class="flex2"></div>
         </div>
         <div class="espaceV"></div>
      </div>
   </div>
</div>
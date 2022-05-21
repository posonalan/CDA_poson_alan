<?php
echo '<div>';
$objets = OperationsManager::getList();
?>
<div class="">
   <div class="testColonne">
      <div class="espace4"></div>
      <div class="alignement "> Liste des Operations </div>
      <div class="grid-col-5">
         <div></div>
         <?php
         if($_SESSION["utilisateur"]->getIdRole()>1){
            echo'<a class="boutonAdd" href="index.php?page=FormOperations2&mode=Ajouter">Ajouter</a>';
         }
          ?>   
         <div></div>
         <a href="index.php?page=Accueil">
            <button class="boutonAdd"><i class="fas fa-sign-out-alt fa-rotate-180"></i></button>
         </a>
      </div>
      <div class="espace4"></div>
      <div class="colonne">
         <div class="marge"> </div>
         <div class="bas">
            <?php
            foreach ($objets as $unObjet) {
               echo '<div class="blockListe">
                        <div class="demi"></div>
                           <a href="index.php?page=FormOperations2&mode=Modifier&id=' . $unObjet->getIdOperation() . '">
                              <div class="categAccueil">
                                 <div class="espace"></div>
                                 <img src="./IMG/' . $unObjet->getPhotoOperation() . '"/>
                                 <div class="espace"></div>
                                 <div class="  ">' . $unObjet->getLibelleOperation() . '</div>
                                 <div class="espace"></div>
                              </div>
                           </a>
                        <div class="demi"></div>
                     </div>';
            } ?>
         </div>
         <div class="marge"></div>
         <div class="espace4"></div>
      </div>
   </div>
</div>
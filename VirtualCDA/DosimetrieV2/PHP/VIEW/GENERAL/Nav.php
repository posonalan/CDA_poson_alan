<?php
 if (isset($_SESSION['utilisateur'])) {


    echo'
<div class="mobile-menu zindex">
    <input type="checkbox" class="hidden-toggle">
    <div class="toggle">
    <div class="titreMenu">Menu</div>
        <a href="#"><i class="fa"></i></a>
    </div>

    <ul class="menu">';
    
        if ($nom != "Accueil") {
            echo '<li><a href="?page=Accueil">Accueil</a><li>';
        }
        if ($nom != "Localisation") {
            echo '<li><a href="?page=Localisation">Localisation</a><li>';
        }
        if ($nom != "ListeChantiers2") {
            echo '<li><a href="?page=ListeChantiers2">Chantier</a><li>';
        }
        if ($nom != "ListeTranches2") {
            echo '<li><a href="?page=ListeTranches2">Tranche</a><li>';
        }
        if ($nom != "ListeBatiments2") {
            echo '<li><a href="?page=ListeBatiments2">Batiment</a><li>';
        }
          if ($nom != "ListeOperations2") {
            echo '<li><a href="?page=ListeOperations2">Operation</a><li>';
        }
        if ($nom != "ListeProtections2") {
            echo '<li><a href="?page=ListeProtections2">Protection</a><li>';
        } 
        if ($nom != "ListeDosimetriesUtilisateurs2") {
            echo '<li><a href="?page=ListeDosimetriesUtilisateurs">Dosimetrie</a><li>';
        }
        
    if($_SESSION["utilisateur"]->getIdRole()>1){
        
        if ($nom != "ListeUtilisateurs") {
            echo '<li><a href="?page=ListeUtilisateurs">Personnel</a><li>';
        }

         }

echo'
    </ul>
</div>
';
    }
?>
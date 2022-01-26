<?php

 echo '<main>';

 echo '<div class="flex-0-1"></div>';

 echo '<div>';
 

$objets = ProfilesManager::getList();
//Création du template de la grid
echo '<div class="grid-col-7 gridListe">';

echo '<div class="caseListe titreListe grid-columns-span-7">Liste des Profiles </div>';
echo '<div class="caseListe grid-columns-span-7">
<div></div>
<div class="caseListe"><a href="index.php?page=FormProfiles&mode=Ajouter"><i class="fas fa-plus"></i></a></div>
<div></div>
</div>';

echo '<div class="caseListe labelListe">IdUtilisateur</div>';
echo '<div class="caseListe labelListe">IdJeu</div>';
echo '<div class="caseListe labelListe">IdAccessoire</div>';
echo '<div class="caseListe labelListe">IdConsole</div>';

//Remplissage de div vide pour la structure de la grid
echo '<div class="caseListe"></div>';
echo '<div class="caseListe"></div>';
echo '<div class="caseListe"></div>';

// Affichage des ennregistrements de la base de données
foreach($objets as $unObjet)
{
echo '<div class="caseListe donneeListe">'.$unObjet->getIdUtilisateur().'</div>';
echo '<div class="caseListe donneeListe">'.$unObjet->getIdJeu().'</div>';
echo '<div class="caseListe donneeListe">'.$unObjet->getIdAccessoire().'</div>';
echo '<div class="caseListe donneeListe">'.$unObjet->getIdConsole().'</div>';
echo '<div class="caseListe"> <a href="index.php?page=FormProfiles&mode=Afficher&id='.$unObjet->getIdProfile().'"><i class="fas fa-file-contract"></i></a></div>';
                                                    
echo '<div class="caseListe"> <a href="index.php?page=FormProfiles&mode=Modifier&id='.$unObjet->getIdProfile().'"><i class="fas fa-pen"></i></a></div>';
                                                    
echo '<div class="caseListe"> <a href="index.php?page=FormProfiles&mode=Supprimer&id='.$unObjet->getIdProfile().'"><i class="fas fa-trash-alt"></i></a></div>';
}
//Derniere ligne du tableau (bouton retour)
echo '<div class="caseListe grid-columns-span-7">
	<div></div>
	<a href="index.php?page=Accueil"><button><i class="fas fa-sign-out-alt fa-rotate-180"></i></button></a>
	<div></div>
</div>';

echo'</div>'; //Grid
echo'</div>'; //Div
echo '<div class="flex-0-1"></div>';
echo '</main>';
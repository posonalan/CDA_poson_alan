<?php

 echo '<main>';

 echo '<div class="flex-0-1"></div>';

 echo '<div>';
 

$objets = AnimauxManager::getList();
//Création du template de la grid
echo '<div class="grid-col-8 gridListe">';

echo '<div class="caseListe grid-columns-span-8">Liste des Animaux </div>';
echo '<div class="caseListe grid-columns-span-8">
<div></div>
<div class="caseListe"><a href="index.php?page=FormAnimaux&mode=Ajouter"><i class="fas fa-plus"></i></a></div>
<div></div>
</div>';

echo '<div class="caseListe">LibelleAnimal</div>';
echo '<div class="caseListe">Prix</div>';
echo '<div class="caseListe">DateDeNaissance</div>';
echo '<div class="caseListe">IdAliment</div>';
echo '<div class="caseListe">IdMilieuVie</div>';

//Remplissage de div vide pour la structure de la grid
echo '<div class="caseListe"></div>';
echo '<div class="caseListe"></div>';
echo '<div class="caseListe"></div>';

// Affichage des ennregistrements de la base de données
foreach($objets as $unObjet)
{
echo '<div class="caseListe">'.$unObjet->getLibelleAnimal().'</div>';
echo '<div class="caseListe">'.$unObjet->getPrix().'</div>';
echo '<div class="caseListe">'.$unObjet->getDateDeNaissance().'</div>';
echo '<div class="caseListe">'.$unObjet->getIdAliment().'</div>';
echo '<div class="caseListe">'.$unObjet->getIdMilieuVie().'</div>';
echo '<div class="caseListe"> <a href="index.php?page=FormAnimaux&mode=Afficher&id='.$unObjet->getIdAnimal().'"><i class="fas fa-file-contract"></i></a></div>';
                                                    
echo '<div class="caseListe"> <a href="index.php?page=FormAnimaux&mode=Modifier&id='.$unObjet->getIdAnimal().'"><i class="fas fa-pen"></i></a></div>';
                                                    
echo '<div class="caseListe"> <a href="index.php?page=FormAnimaux&mode=Supprimer&id='.$unObjet->getIdAnimal().'"><i class="fas fa-trash-alt"></i></a></div>';
}
//Derniere ligne du tableau (bouton retour)
echo '<div class="caseListe grid-columns-span-8">
	<div></div>
	<a href="index.php?page=Accueil"><button><i class="fas fa-sign-out-alt fa-rotate-180"></i></button></a>
	<div></div>
</div>';

echo'</div>'; //Grid
echo'</div>'; //Div
echo '<div class="flex-0-1"></div>';
echo '</main>';
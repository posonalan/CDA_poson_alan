<?php

 echo '<main>';

 echo '<div class="flex-0-1"></div>';

 echo '<div>';
 

$objets = Jeux_UtilisateursManager::getList();
//Création du template de la grid
echo '<div class="grid-col-8 gridListe">';

echo '<div class="caseListe titreListe grid-columns-span-8">Liste des Jeux_Utilisateurs </div>';
echo '<div class="caseListe grid-columns-span-8">
<div></div>
<div class="caseListe"><a href="index.php?page=FormJeux_Utilisateurs&mode=Ajouter"><i class="fas fa-plus"></i></a></div>
<div></div>
</div>';

echo '<div class="caseListe labelListe">Nom</div>';
echo '<div class="caseListe labelListe">Prenom</div>';
echo '<div class="caseListe labelListe">IdJeu</div>';
echo '<div class="caseListe labelListe">LibelleJeu</div>';
echo '<div class="caseListe labelListe">IdMarque</div>';

//Remplissage de div vide pour la structure de la grid
echo '<div class="caseListe"></div>';
echo '<div class="caseListe"></div>';
echo '<div class="caseListe"></div>';

// Affichage des ennregistrements de la base de données
foreach($objets as $unObjet)
{
echo '<div class="caseListe donneeListe">'.$unObjet->getNom().'</div>';
echo '<div class="caseListe donneeListe">'.$unObjet->getPrenom().'</div>';
echo '<div class="caseListe donneeListe">'.$unObjet->getIdJeu().'</div>';
echo '<div class="caseListe donneeListe">'.$unObjet->getLibelleJeu().'</div>';
echo '<div class="caseListe donneeListe">'.$unObjet->getIdMarque().'</div>';
echo '<div class="caseListe"> <a href="index.php?page=FormJeux_Utilisateurs&mode=Afficher&id='.$unObjet->getIdUtilisateur().'"><i class="fas fa-file-contract"></i></a></div>';
                                                    
echo '<div class="caseListe"> <a href="index.php?page=FormJeux_Utilisateurs&mode=Modifier&id='.$unObjet->getIdUtilisateur().'"><i class="fas fa-pen"></i></a></div>';
                                                    
echo '<div class="caseListe"> <a href="index.php?page=FormJeux_Utilisateurs&mode=Supprimer&id='.$unObjet->getIdUtilisateur().'"><i class="fas fa-trash-alt"></i></a></div>';
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
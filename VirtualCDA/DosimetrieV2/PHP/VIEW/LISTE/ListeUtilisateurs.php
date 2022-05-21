<?php
echo '<div>';
$objets = UtilisateursManager::getList();
//Création du template de la grid
echo '
<div class=" ">
	<div class="grid-col-15 gridListe espaceV">
		<div class="grid-columns-span-15 alignement">Liste des Utilisateurs</div>
		<div class="caseListe grid-columns-span-15 espaceV"></div>
		<div class="caseListe labelListe fondLabel">'. texte("Nom").'</div>
		<div class="caseListe labelListe fondLabel">'. texte("Prenom").'</div>
		<div class="caseListe labelListe fondLabel">'. texte("AdresseMail").'</div>
		<div class="caseListe labelListe fondLabel">'. texte("MotDePasse").'</div>
		<div class="caseListe labelListe fondLabel">'. texte("TelUtilisateur").'</div>
		<div class="caseListe labelListe fondLabel">'. texte("DosimetrieAvantActivite").'</div>
		<div class="caseListe labelListe fondLabel">'. texte("DosimetrieApresActivite").'</div>
		<div class="caseListe labelListe fondLabel">'. texte("DateReleveDosimetrique").'</div>
		<div class="caseListe labelListe fondLabel">'. texte("IdRole").'</div>
		<div class="caseListe labelListe fondLabel">'. texte("IdPosteEntreprise").'</div>
		<div class="caseListe labelListe fondLabel">'. texte("IdEntreprise").'</div>
	';

//Remplissage de div vide pour la structure de la grid
echo '<div class="caseListe"></div>
	  <div class="caseListe"></div>
	  <div class="caseListe"></div>
	  <div class="caseListe"></div>';

// Affichage des ennregistrements de la base de données
foreach($objets as $unObjet)
{
	echo '
	<div>-</div>
	<div>-</div>
	<div>-</div>
	<div>-</div>
	<div>-</div>
	<div>-</div>
	<div>-</div>
	<div>-</div>
	<div>-</div>
	<div>-</div>
	<div>-</div>
	<div>-</div>
	<div>-</div>	
	<div>-</div>
	<div>-</div>

<div class="caseListe donneeListe fondLabel">'.$unObjet->getNom().'</div>';
echo '<div class="caseListe donneeListe fondLabel">'.$unObjet->getPrenom().'</div>';
echo '<div class="caseListe donneeListe fondLabel">'.$unObjet->getAdresseMail().'</div>';
echo '<div class="caseListe donneeListe fondLabel">'.$unObjet->getMotDePasse().'</div>';
echo '<div class="caseListe donneeListe fondLabel">'.$unObjet->getTelUtilisateur().'</div>';
echo '<div class="caseListe donneeListe fondLabel">'.$unObjet->getDosimetrieAvantActivite().'</div>';
echo '<div class="caseListe donneeListe fondLabel">'.$unObjet->getDosimetrieApresActivite().'</div>';
echo '<div class="caseListe donneeListe fondLabel">'.$unObjet->getDateReleveDosimetrique().'</div>';
echo '<div class="caseListe donneeListe fondLabel">'.RolesManager::findById($unObjet->getIdRole())->ToString().'</div>';
echo '<div class="caseListe donneeListe fondLabel">'.PostesEntreprisesManager::findById($unObjet->getIdPosteEntreprise())->ToString().'</div>';
echo '<div class="caseListe donneeListe fondLabel">'.EntreprisesManager::findById($unObjet->getIdEntreprise())->GetLibelleEntreprise().'</div>';

echo '<div class="caseListe"> <a href="index.php?page=FormUtilisateurs&mode=Afficher&id='.$unObjet->getIdUtilisateur().'"><i class="fas fa-file-contract"></i></a></div>';
                                                    
echo '<div class="caseListe"> <a href="index.php?page=FormUtilisateurs&mode=Modifier&id='.$unObjet->getIdUtilisateur().'"><i class="fas fa-pen"></i></a></div>';
                                                    
echo '<div class="caseListe"> <a href="index.php?page=FormUtilisateurs&mode=Supprimer&id='.$unObjet->getIdUtilisateur().'"><i class="fas fa-trash-alt"></i></a></div>
';
echo '<div class="caseListe"> <a href="index.php?page=ActionUtilisateurs&mode=Reinit&id='.$unObjet->getIdUtilisateur().'"><i class="fas fa-edit"></i></a></div>
';
}
//Derniere ligne du tableau (bouton retour)
echo '<div class="caseListe grid-columns-span-15">
	<div></div>
	<a href="index.php?page=Accueil"><button><i class="fas fa-sign-out-alt fa-rotate-180"></i></button></a>
	<div></div>
	<a href="index.php?page=FormUtilisateurs&mode=Ajouter"><button><i class="fas fa-plus"></i></button></a>

	<div class="marge"> </div>
	<div class="espaceV"></div>
 </div>

 <div class="espaceFin"></div>

</div>

</div>';
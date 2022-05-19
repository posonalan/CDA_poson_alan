<?php
echo '<div>';
/* on va chercher l'id de la personne connecter */ 
$id=(isset($_GET['id']))?$_GET['id']:null;
/* si l'identifiant est null */ 
if($id==null){
	/* on va chercher les données dosimetriesUtilisateurs */ 
	$objets = DosimetriesUtilisateursManager::getList();
}else{
	/* sinon on a chercher les données dosimetrique de la personne connecter */ 
$objets = DosimetriesUtilisateursManager::getList(null, ["idUtilisateur"=>$id]);
}
//Création du template de la grid

echo '
<div class=" ">';

	echo'<div class="grid-col-8 gridListe espace4">';
    /* si le role du connecter est administrateur */ 
	if($_SESSION["utilisateur"]->getIdRole()>1){
	/* on crée un select qui permet grace au nom-prenom de recuperer les données */ 
	echo creerSelect($id,"Utilisateurs",["Nom","Prenom"],"", null, "Nom, Prenom");
	}
	echo'
		<div class="grid-columns-span-8 alignement">Données Dosimetriques Utilisateurs</div>
		<div class="caseListe grid-columns-span-8 "></div>
		<div class="caseListe labelListe fondLabel">' . texte("DateIntervention") . '</div>
		<div class="caseListe labelListe fondLabel"> ' . texte("TempsIntervention") . '</div>
		<div class="caseListe labelListe fondLabel"> ' . texte("DosimetrieUtilisateur") . '</div>
		<div class="caseListe labelListe fondLabel"> ' . texte("IdActivite") . '</div>';

if($_SESSION["utilisateur"]->getIdRole()>1){
echo '<div class="caseListe labelListe fondLabel"> ' . texte("IdUtilisateur") . '</div>';
}else {
echo '<div class="caseListe"></div>';	
}
//Remplissage de div vide pour la structure de la grid
echo '<div class="caseListe"></div>';
echo '<div class="caseListe"></div>';
echo '<div class="caseListe"></div>';
/* si le technicien */ 
if($_SESSION["utilisateur"]->getIdRole()<2){
	// Affichage des ennregistrements de la base de données
	foreach($objets as $unObjet)
	{    /* si l'identifiant du connecter et l'identifiant en base de données sont les memes */
		if($_SESSION["utilisateur"]->getIdUtilisateur() == $unObjet->getIdUtilisateur()){

				echo'
				<div>-</div>
				<div>-</div>
				<div>-</div>
				<div>-</div>
				<div>-</div>
				<div>-</div>
				<div>-</div>
				<div>-</div>
				';
			
				echo'<div class="caseListe donneeListe fondLabel ">'.$unObjet->getDateIntervention().'</div>';
				echo '<div class="caseListe donneeListe fondLabel">'.$unObjet->getTempsIntervention().'</div>';
				echo '<div class="caseListe donneeListe fondLabel">'.$unObjet->getDosimetrieUtilisateur().'</div>';
				/* affichage du libelle au lieu de l'identifiant */ 
				echo '<div class="caseListe donneeListe fondLabel">'.ActivitesManager::findById($unObjet->getIdActivite())->getLibelleActivite().'</div>';
			
				echo'
				<div class="caseListe"></div>
				<div class="caseListe"></div>
				<div class="caseListe"></div>	
				<div class="caseListe"></div>
				';
				
			}
		}
	}else {
		// Affichage des ennregistrements de la base de données
	foreach($objets as $unObjet)
	{
		
				echo'
				<div>-</div>
				<div>-</div>
				<div>-</div>
				<div>-</div>
				<div>-</div>
				<div>-</div>
				<div>-</div>
				<div>-</div>
				';
			
				echo'<div class="caseListe donneeListe fondLabel ">'.$unObjet->getDateIntervention().'</div>';
				echo '<div class="caseListe donneeListe fondLabel">'.$unObjet->getTempsIntervention().'</div>';
				echo '<div class="caseListe donneeListe fondLabel">'.$unObjet->getDosimetrieUtilisateur().'</div>';
				echo '<div class="caseListe donneeListe fondLabel">'.ActivitesManager::findById($unObjet->getIdActivite())->getLibelleActivite().'</div>';
			
			
					/* avoir le nom/prenom de l'utilisateur */
					echo '<div class="caseListe donneeListe fondLabel">'.UtilisateursManager::findById($unObjet->getIdUtilisateur())->ToString().'</div>';

					echo '<div class="caseListe"> <a href="index.php?page=FormDosimetriesUtilisateurs&mode=Afficher&id='
					.$unObjet->getIdDosimetrieUtilisateur().'"><i class="fas fa-file-contract"></i></a></div>';
																	
					echo '<div class="caseListe"> <a href="index.php?page=FormDosimetriesUtilisateurs&mode=Modifier&id='
					.$unObjet->getIdDosimetrieUtilisateur().'"><i class="fas fa-pen"></i></a></div>';
																	
					echo '<div class="caseListe"> <a href="index.php?page=FormDosimetriesUtilisateurs&mode=Supprimer&id='
					.$unObjet->getIdDosimetrieUtilisateur().'"><i class="fas fa-trash-alt"></i></a></div>';

				
		}
	}
//Derniere ligne du tableau (bouton retour)
echo '<div class="caseListe grid-columns-span-8">
	<div></div>
	<a href="index.php?page=Accueil"><button><i class="fas fa-sign-out-alt fa-rotate-180"></i></button></a>
	<div></div>
<a href="index.php?page=FormDosimetriesUtilisateurs&mode=Ajouter"><button><i class="fas fa-plus"></i></button></a>

<div class="marge"> </div>
<div class="espaceV"></div>
</div>

<div class="espaceFin"></div>

</div>

</div>';
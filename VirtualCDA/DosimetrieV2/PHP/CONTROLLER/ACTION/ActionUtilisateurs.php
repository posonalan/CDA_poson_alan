<?php
$elm = new Utilisateurs($_POST);
switch ($_GET['mode']) {
	case "Ajouter": {
		$elm->setMotDePasse(crypte($elm->getMotDePasse()));
		$elm = UtilisateursManager::add($elm);
		break;
	}
	case "Modifier": {
		//recup mot de passe codé
		$elmOld = UtilisateursManager::findById($elm->getIdUtilisateur());
		$mot = $elmOld->getMotDePasse();
		//on reporte l emot de passe
		$elm->setMotDePasse($mot);

		$elm = UtilisateursManager::update($elm);
		break;
	}
	case "Supprimer": {
		$elm = UtilisateursManager::delete($elm);
		break;
	}
	case "Reinit":{
		//on recupere l'utilisateur
		$elm = UtilisateursManager::findById($_GET["id"]);
		//on change le mot de passe
		$elm->setMotDePasse(crypte($elm->getNom().$elm->getPrenom()));
		//on enregistre
		$elm = UtilisateursManager::update($elm);
	break; 
	}
	
	case "ChangePwd":{
		// var_dump($_POST);
		//on recupere l'utilisateur
		$elm = UtilisateursManager::findById($_POST["IdUtilisateur"]);
		//on change le mot de passe
		$elm->setMotDePasse(crypte($_POST['MotDePasse']));
		//on enregistre
		$retour = UtilisateursManager::update($elm);
		// var_dump($elm);
		// var_dump($retour);
		 header("location:index.php?page=Accueil");
		break;
	}
}

 header("location:index.php?page=ListeUtilisateurs");
<?php
$elm = new Jeux_Utilisateurs($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		$elm = Jeux_UtilisateursManager::add($elm);
		break;
	}
	case "Modifier": {
		$elm = Jeux_UtilisateursManager::update($elm);
		break;
	}
	case "Supprimer": {
		$elm = Jeux_UtilisateursManager::delete($elm);
		break;
	}
}

header("location:index.php?page=ListeJeux_Utilisateurs");
<?php
$elm = new Consoles_Utilisateurs($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		$elm = Consoles_UtilisateursManager::add($elm);
		break;
	}
	case "Modifier": {
		$elm = Consoles_UtilisateursManager::update($elm);
		break;
	}
	case "Supprimer": {
		$elm = Consoles_UtilisateursManager::delete($elm);
		break;
	}
}

header("location:index.php?page=ListeConsoles_Utilisateurs");
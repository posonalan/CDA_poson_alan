<?php
$elm = new Operations_Utilisateurs($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		$elm = Operations_UtilisateursManager::add($elm);
		break;
	}
	case "Modifier": {
		$elm = Operations_UtilisateursManager::update($elm);
		break;
	}
	case "Supprimer": {
		$elm = Operations_UtilisateursManager::delete($elm);
		break;
	}
}

header("location:index.php?page=ListeOperations_Utilisateurs");
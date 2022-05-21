<?php
$elm = new Entreprises($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		$elm = EntreprisesManager::add($elm);
		break;
	}
	case "Modifier": {
		$elm = EntreprisesManager::update($elm);
		break;
	}
	case "Supprimer": {
		$elm = EntreprisesManager::delete($elm);
		break;
	}
}

header("location:index.php?page=FormUtilisateurs&mode=Ajouter");
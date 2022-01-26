<?php
$elm = new Profiles($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		$elm = ProfilesManager::add($elm);
		break;
	}
	case "Modifier": {
		$elm = ProfilesManager::update($elm);
		break;
	}
	case "Supprimer": {
		$elm = ProfilesManager::delete($elm);
		break;
	}
}

header("location:index.php?page=ListeProfiles");
<?php
$elm = new EnjeuxRadiologiques($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		 EnjeuxRadiologiquesManager::add($elm);
		break;
	}
	case "Modifier": {
		EnjeuxRadiologiquesManager::update($elm);
		break;
	}
	case "Supprimer": {
		 EnjeuxRadiologiquesManager::delete($elm);
		break;
	}
}

header("location:index.php?page=ListeEnjeuxRadiologiques");
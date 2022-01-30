<?php
$elm = new Stagiaire($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		$elm = StagiaireManager::add($elm);
		break;
	}
	case "Modifier": {
		$elm = StagiaireManager::update($elm);
		break;
	}
	case "Supprimer": {
		$elm = StagiaireManager::delete($elm);
		break;
	}
}

header("location:index.php?page=ListeStagiaire");
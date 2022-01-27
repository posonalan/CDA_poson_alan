<?php
$elm = new Marques($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		$elm = MarquesManager::add($elm);
		break;
	}
	case "Modifier": {
		$elm = MarquesManager::update($elm);
		break;
	}
	case "Supprimer": {
		$elm = MarquesManager::delete($elm);
		break;
	}
}

header("location:index.php?page=ListeMarques");
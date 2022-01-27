<?php
$elm = new Animaux($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		$elm = AnimauxManager::add($elm);
		break;
	}
	case "Modifier": {
		$elm = AnimauxManager::update($elm);
		break;
	}
	case "Supprimer": {
		$elm = AnimauxManager::delete($elm);
		break;
	}
}

header("location:index.php?page=ListeAnimaux");
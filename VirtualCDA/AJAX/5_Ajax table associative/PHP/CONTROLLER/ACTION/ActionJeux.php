<?php
$elm = new Jeux($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		$elm = JeuxManager::add($elm);
		break;
	}
	case "Modifier": {
		$elm = JeuxManager::update($elm);
		break;
	}
	case "Supprimer": {
		$elm = JeuxManager::delete($elm);
		break;
	}
}

header("location:index.php?page=ListeJeux");
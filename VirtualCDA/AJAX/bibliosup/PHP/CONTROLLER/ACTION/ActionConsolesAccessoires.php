<?php
$elm = new ConsolesAccessoires($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		$elm = ConsolesAccessoiresManager::add($elm);
		break;
	}
	case "Modifier": {
		$elm = ConsolesAccessoiresManager::update($elm);
		break;
	}
	case "Supprimer": {
		$elm = ConsolesAccessoiresManager::delete($elm);
		break;
	}
}

header("location:index.php?page=ListeConsolesAccessoires");
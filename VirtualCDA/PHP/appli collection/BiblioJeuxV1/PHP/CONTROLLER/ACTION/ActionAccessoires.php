<?php
$elm = new Accessoires($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		$elm = AccessoiresManager::add($elm);
		break;
	}
	case "Modifier": {
		$elm = AccessoiresManager::update($elm);
		break;
	}
	case "Supprimer": {
		$elm = AccessoiresManager::delete($elm);
		break;
	}
}

header("location:index.php?page=ListeAccessoires");
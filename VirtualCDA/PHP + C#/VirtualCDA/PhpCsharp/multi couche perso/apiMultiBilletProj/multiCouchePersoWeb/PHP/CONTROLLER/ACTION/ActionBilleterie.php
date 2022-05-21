<?php
$elm = new Billeterie($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		$elm = BilleterieManager::add($elm);
		break;
	}
	case "Modifier": {
		$elm = BilleterieManager::update($elm);
		break;
	}
	case "Supprimer": {
		$elm = BilleterieManager::delete($elm);
		break;
	}
}

header("location:index.php?page=ListeBilleterie");
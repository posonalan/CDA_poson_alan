<?php
$elm = new LignesPaniers($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		$elm = LignesPaniersManager::add($elm);
		break;
	}
	case "Modifier": {
		$elm = LignesPaniersManager::update($elm);
		break;
	}
	case "Supprimer": {
		$elm = LignesPaniersManager::delete($elm);
		break;
	}
}

header("location:index.php?page=ListeLignesPaniers");
<?php
$elm = new Alimentations($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		$elm = AlimentationsManager::add($elm);
		break;
	}
	case "Modifier": {
		$elm = AlimentationsManager::update($elm);
		break;
	}
	case "Supprimer": {
		$elm = AlimentationsManager::delete($elm);
		break;
	}
}

header("location:index.php?page=ListeAlimentations");
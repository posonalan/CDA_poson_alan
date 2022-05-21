<?php
$elm = new Consoles($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		$elm = ConsolesManager::add($elm);
		break;
	}
	case "Modifier": {
		$elm = ConsolesManager::update($elm);
		break;
	}
	case "Supprimer": {
		$elm = ConsolesManager::delete($elm);
		break;
	}
}

header("location:index.php?page=ListeConsoles");
<?php
$elm = new ConsolesJeux($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		$elm = ConsolesJeuxManager::add($elm);
		break;
	}
	case "Modifier": {
		$elm = ConsolesJeuxManager::update($elm);
		break;
	}
	case "Supprimer": {
		$elm = ConsolesJeuxManager::delete($elm);
		break;
	}
}

header("location:index.php?page=ListeConsolesJeux");
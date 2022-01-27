<?php
$elm = new Milieuvies($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		$elm = MilieuviesManager::add($elm);
		break;
	}
	case "Modifier": {
		$elm = MilieuviesManager::update($elm);
		break;
	}
	case "Supprimer": {
		$elm = MilieuviesManager::delete($elm);
		break;
	}
}

header("location:index.php?page=ListeMilieuvies");
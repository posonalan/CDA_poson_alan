<?php
$elm = new Jeux_utilisateurs($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		$elm = Jeux_utilisateursManager::add($elm);
		break;
	}
	case "Modifier": {
		$elm = Jeux_utilisateursManager::update($elm);
		break;
	}
	case "Supprimer": {
		$elm = Jeux_utilisateursManager::delete($elm);
		break;
	}
}

header("location:index.php?page=ListeJeux_utilisateurs");
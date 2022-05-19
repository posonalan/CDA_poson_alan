<?php
$elm = new DosimetriesUtilisateurs($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		 DosimetriesUtilisateursManager::add($elm);
		break;
	}
	case "Modifier": {
		 DosimetriesUtilisateursManager::update($elm);
		break;
	}
	case "Supprimer": {
		 DosimetriesUtilisateursManager::delete($elm);
		break;
	}
}

header("location:index.php?page=ListeDosimetriesUtilisateurs");
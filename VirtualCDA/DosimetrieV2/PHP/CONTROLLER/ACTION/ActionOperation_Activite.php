<?php
$elm = new Operations($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		 OperationsManager::add($elm);
        
		break;
        header("location:index.php?page=FormActivites&mode=Ajouter");
	}
	case "Modifier": {
		 OperationsManager::update($elm);
		break;
	}
	case "Supprimer": {
		 OperationsManager::delete($elm);
		break;
	}
}

header("location:index.php?page=ListeOperations2");
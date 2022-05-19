<?php
$elm = new PostesEntreprises($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		$elm = PostesEntreprisesManager::add($elm);
		break;
	}
	case "Modifier": {
		$elm = PostesEntreprisesManager::update($elm);
		break;
	}
	case "Supprimer": {
		$elm = PostesEntreprisesManager::delete($elm);
		break;
	}
}
header("location:index.php?page=FormUtilisateurs&mode=Ajouter");
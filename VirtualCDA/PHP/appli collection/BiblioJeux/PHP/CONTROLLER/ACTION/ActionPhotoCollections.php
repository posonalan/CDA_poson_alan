<?php
$elm = new PhotoCollections($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		$elm = PhotoCollectionsManager::add($elm);
		break;
	}
	case "Modifier": {
		$elm = PhotoCollectionsManager::update($elm);
		break;
	}
	case "Supprimer": {
		$elm = PhotoCollectionsManager::delete($elm);
		break;
	}
}

header("location:index.php?page=ListePhotoCollections");
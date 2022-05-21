<?php
$elm = new Articles($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		$elm = ArticlesManager::add($elm);
		break;
	}
	case "Modifier": {
		$elm = ArticlesManager::update($elm);
		break;
	}
	case "Supprimer": {
		$elm = ArticlesManager::delete($elm);
		break;
	}
}

header("location:index.php?page=ListeArticles");
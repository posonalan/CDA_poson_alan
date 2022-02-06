<?php
$elm = new LignesPaniers($_POST);
/* On cree une ligne de panier a chaque nouvelle ajout d'article  */
$cmd = PaniersManager::getList(null, ["idClient" => $_SESSION['utilisateur']->getIdUtilisateur()]);
/* si pas de panier on le crée */ 
if (!$cmd) {
	var_dump($_SESSION['utilisateur']->getIdUtilisateur());
	PaniersManager::add(new Paniers(["idClient" => $_SESSION['utilisateur']->getIdUtilisateur()]));
	$cmd = PaniersManager::getList(null, ["idClient" => $_SESSION['utilisateur']->getIdUtilisateur()]);
	var_dump($cmd);
}
$elm->setIdPanier($cmd[0]->getIdPanier());

switch ($_GET['mode']) {
	case "Ajouter": {
		/* on modifie l"id de l' article ainsi que sa quantité */
			$elm->setIdArticle($_GET["id"]);
			$elm->setQuantite(1);
			/* et on l'ajoute une ligne panier */
			$elm = LignesPaniersManager::add($elm);
			break;
		}
	case "Modifier": {
			$elm = LignesPaniersManager::update($elm);
			break;
		}
	case "Supprimer": {
			$elm = LignesPaniersManager::delete($elm);
			break;
		}
}

header("location:index.php?page=ListeLignesPaniers");

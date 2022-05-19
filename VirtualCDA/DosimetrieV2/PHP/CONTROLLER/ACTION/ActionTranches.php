<?php
$elm = new Tranches($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
			/* on met a jour la photo avec l'image de la tranche */
			$elm->setPhotoTranche(chargerImage());
			/*  on ajoute */
			 TranchesManager::add($elm);
			break;
	}
	case "Modifier": {
			/* si jai modif on met la modif */
			if (isset($_POST["modifImage"])) {   /* suppression de l'ancienne image*/
				unlink("./IMG/" . $_POST['AnciennePhotos']);
				/* on charge la nouvelle image */
				$elm->setPhotoTranche(chargerImage());
			}
			/* sinon je laisse l'ancienne */
			 else $elm->setPhotoTranche($_POST['AnciennePhotos']);
			 TranchesManager::update($elm);
			break;
	}
	case "Supprimer": {
		$elm = TranchesManager::findById($_POST['IdTranche']);

		/*suppression de l'image */
		unlink("./IMG/" . $elm->getPhotoTranche());
		/* sup la protection */
		 TranchesManager::delete($elm);
		break;
	}
}

header("location:index.php?page=ListeTranches2");


function chargerImage()
{ /* si on peut uploader le fichier */
	if (is_uploaded_file($_FILES["Photos"]["tmp_name"]))
	{ /* genere un id unique pour pas sup pour tout le monde */
		$leNom = uniqid('jpg_') . '.jpg';
		move_uploaded_file($_FILES['Photos']['tmp_name'], 'IMG/' . $leNom);
	}
	/* retourne le nom de l'image */
	return $leNom;
}

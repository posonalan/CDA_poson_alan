<?php
$elm = new Articles($_POST);
switch ($_GET['mode']) {
	case "Ajouter": {
		/* on met a jour la photo avec l'image de l'article */ 
		$elm->setPhotos(chargerImage());
		/*  on ajoute */ 
		$elm = ArticlesManager::add($elm);
		break;
	}
	case "Modifier": {
		/* si jai modif on met la modif */ 
		if (isset($_POST["modifImage"]))
		{   /* suppression de l'ancienne image*/
			unlink("IMG/" . $_POST['AnciennePhotos']);
			/* on charge la nouvelle image */
			$elm->setPhotos(chargerImage());
		}
		/* sinon je laisse l'ancienne */ 
		else $elm->setPhotos($_POST['AnciennePhotos']);
		$elm = ArticlesManager::update($elm);
		break;
	}
	case "Supprimer": {
		/*suppression de l'image */
		unlink("IMG/" . $elm->getPhotos());
		/* sup l'article */ 
		$elm = ArticlesManager::delete($elm);
		break;
	}
}

header("location:index.php?page=ListeArticles");

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
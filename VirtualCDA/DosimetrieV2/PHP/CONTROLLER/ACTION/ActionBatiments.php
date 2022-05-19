<?php
$elm = new Batiments($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
			/* on met a jour la photo avec l'image de l'article */
			$elm->setPhotoBatiment(chargerImage());
			/*  on ajoute */
			 BatimentsManager::add($elm);
			break;
		}
	case "Modifier": {
			/* si jai modif on met la modif */
			if (isset($_POST["modifImage"])) {   /* suppression de l'ancienne image*/
				unlink("./IMG/" . $_POST['AnciennePhotos']);
				/* on charge la nouvelle image */
				$elm->setPhotoBatiment(chargerImage());
			}
			/* sinon je laisse l'ancienne */
			 else $elm->setPhotoBatiment($_POST['AnciennePhotos']);
			 BatimentsManager::update($elm);
			break;
		}
	case "Supprimer": {
		$elm = BatimentsManager::findById($_POST['IdBatiment']);
		// var_dump($elm);
			/* supression du batiment */
			
			/*suppression de l'image, si l'activite n'a pas de protection on la supprime sinon on ne la supprime pas  */
		   
			/*suppression de l'image */
			unlink("./IMG/" . $elm->getPhotoBatiment());
			BatimentsManager::delete($elm);
		}
}

header("location:index.php?page=ListeBatiments2");

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
<?php
$unChantier = new Chantiers($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
			/* on met a jour la photo avec l'image de l'article */
			$unChantier->setPhotoChantier(chargerImage());
			/*  on ajoute */
			ChantiersManager::add($unChantier);
			break;
		}
	case "Modifier": {
			/* si jai modif on met la modif */
			if (isset($_POST["modifImage"])) {   /* suppression de l'ancienne image*/
				unlink("./IMG/" . $_POST['AnciennePhotos']);
				/* on charge la nouvelle image */
				$unChantier->setPhotoChantier(chargerImage());
			}
			/* sinon je laisse l'ancienne */
			 else $unChantier->setPhotoChantier($_POST['AnciennePhotos']);
			ChantiersManager::update($unChantier);
			break;
		}
	case "Supprimer": {
		$unChantier = ChantiersManager::findById($_POST['IdChantier']);
			/*suppression de l'image */
			unlink("./IMG/" . $unChantier->getPhotoChantier());
			/* sup la protection */
			ChantiersManager::delete($unChantier);
			break;
		}
}

 header("location:index.php?page=ListeChantiers2");

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

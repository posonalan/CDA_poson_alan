<?php
$elm = new Protections($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		// var_dump($_POST);
			/* on met a jour la photo de la prptection */
			$elm->setPhotoProtection(chargerImage());
			/*  on ajoute */
			 ProtectionsManager::add($elm);
			//  $pro = ProtectionsManager::findLastAdd();
		 	//  header("Refresh:0.1; url=index.php?page=FormOperations2&mode=Modifier&id=".$elm->getIdProtection()."#IdProtection".$pro->getIdActivite());
	
			break;
		}
	case "Modifier": {
			/* Si modification image */
			if (isset($_POST["modifImage"])) { 
				/* recuperation de l'ancienne image */
				unlink("./IMG/" . $_POST['AnciennePhotos']);
				/* on charge la nouvelle image */
				$elm->setPhotoProtection(chargerImage());
			}
			/* sinon je laisse l'ancienne */
			 else $elm->setPhotoProtection($_POST['AnciennePhotos']);
			 ProtectionsManager::update($elm);
			break;
		}
	case "Supprimer": {
		 $elm = ProtectionsManager::findById($_POST['IdProtection']);
		// $retour=ProtectionsManager::delete($elm);
			/*suppression de l'image */
			// if($retour) {
			unlink("./IMG/" . $elm->getPhotoProtection());
			/* sup la protection */
			 ProtectionsManager::delete($elm);
			// header("Refresh:0.1; url=index.php?page=FormOperations2&mode=Modifier&id=".$elm->getIdProtection());
			// 		}
			break;
		}
}

 header("location:index.php?page=ListeProtections2");

function chargerImage()
{ /* si on peut uploader le fichier */
	var_dump($_FILES);
    if (is_uploaded_file($_FILES["Photos"]["tmp_name"]))
    { /* genere un id unique pour pas sup pour tout le monde */
        $leNom = uniqid('jpg_') . '.jpg';
        move_uploaded_file($_FILES['Photos']['tmp_name'], 'IMG/' . $leNom);
    }
	/* retourne le nom de l'image */
    return $leNom;
}

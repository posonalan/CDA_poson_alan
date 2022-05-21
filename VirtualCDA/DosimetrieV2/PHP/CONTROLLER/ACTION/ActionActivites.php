<?php
$uneActivite = new Activites($_POST);

switch ($_GET['mode']) {
	case "Ajouter": {
		// var_dump($_POST);
		/* on met a jour la photo avec l'image de l'activite */
		$uneActivite->setPhotoActivite(chargerImage());
		// /*  on ajoute */var_dump($uneActivite);
		 ActivitesManager::add($uneActivite);
		 $act = ActivitesManager::findLastAdd();
		 	header("Refresh:0.1; url=index.php?page=FormOperations2&mode=Modifier&id=".$uneActivite->getIdOperation()."#IdActivite".$act->getIdActivite());
		break;	
	}
	case "Modifier": {
		/* si jai modif on met la modif */
		if (isset($_POST["modifImage"])) {   /* suppression de l'ancienne image*/
			unlink("./IMG/" . $_POST['AnciennePhotos']);
			/* on charge la nouvelle image */
			$uneActivite->setPhotoActivite(chargerImage());
			header("Refresh:0.1; url=index.php?page=FormOperations2&mode=Modifier&id=".$uneActivite->getIdOperation());
		}
		/* sinon je laisse l'ancienne */
		 else $uneActivite->setPhotoActivite($_POST['AnciennePhotos']);
		ActivitesManager::update($uneActivite);
			header("Refresh:0.1; url=index.php?page=FormOperations2&mode=Modifier&id=".$uneActivite->getIdOperation());
		break;
	}
	case "Supprimer": {
		$uneActivite = ActivitesManager::findById($_GET['IdActivite']);
		// var_dump($uneActivite);
			/* supression de l'activite */
			 $retour=ActivitesManager::delete($uneActivite);
		 	/*suppression de l'image, si l'activite n'a pas de protection on la supprime sinon on ne la supprime pas  */
			if($retour) {
			unlink("./IMG/" . $uneActivite->getPhotoActivite());
			header("Refresh:0.1; url=index.php?page=FormOperations2&mode=Modifier&id=".$uneActivite->getIdOperation());
					}
			else { /* Message erreur si suppression d'activité avec des données de protection */ 
				echo ' 	<div class="colonne">
							<div class="espaceM"></div>
							<div>
								<div class="flex01 "></div>
								<div class="MessageSuppression colonne">
									<b>Suppression Impossible :</b> L\'activité détient une ou plusieurs protections ! 
									<br>Si vous souhaitez vraiment la supprimer : supprimer d\'abord ses protections. 
								</div>
								<div class="flex01"></div>
							</div> 
							<div class="espaceM"></div>
						</div> '; 
				header("Refresh:5; url=index.php?page=FormOperations2&mode=Modifier&id=".$uneActivite->getIdOperation());
			}
			break;
	}
}

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


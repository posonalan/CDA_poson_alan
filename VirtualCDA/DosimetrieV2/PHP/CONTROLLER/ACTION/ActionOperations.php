<?php
/* creation d'une operation avec les données du POST */ 
$uneOperation = new Operations($_POST);
/* Selection du mode */ 
$mode = $_GET['mode'];
switch ($mode) {
	case "Ajouter": {
			/* on met a jour la photo avec l'image de l'operation */
			$uneOperation->setPhotoOperation(chargerImage());
			/*  on ajoute */
			$retour = OperationsManager::add($uneOperation);
			/* si du contenu dans retour */ 
			if($retour)
			/* recuperation du dernier enregistrement de la table operation pour la redirection */ 
			$uneOperation = OperationsManager::getList(["IdOperation"],null,"IdOperation desc","0,1",false,true)[0];
			//  var_dump($uneOperation);

			//  $ope = OperationsManager::findLastAdd();
			//  var_dump($ope);
			//  header("Refresh:0.1; url=index.php?page=FormOperations2&mode=Modifier&id=".$uneOperation->getIdOperation());

			break;
	}
	case "Modifier": {
		/* si jai modif on met la modif */
		if (isset($_POST["modifImage"])) {   /* suppression de l'ancienne image*/
			unlink("./IMG/" . $_POST['AnciennePhotos']);
			/* on charge la nouvelle image */
			$uneOperation->setPhotoOperation(chargerImage());
		}
		/* sinon je laisse l'ancienne */
		 else {  $uneOperation->setPhotoOperation($_POST['AnciennePhotos']);}
			  /* on met a jour */ 
			 OperationsManager::update($uneOperation); 
		break;
	}

	// case "Supprimer": {
	// 			/*suppression de l'image */
	// 			unlink("./IMG/" . $uneOperation->getPhotoOperation());
	// 			/* sup la protection */
	// 			 OperationsManager::delete($uneOperation);
	// 			break;
	// 	}
	 }
	 	/* Redirection vers la page modification de l'operation ciblée */ 
	 header("Refresh:0; url=index.php?page=FormOperations2&mode=Modifier&id=".$uneOperation->getIdOperation());

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

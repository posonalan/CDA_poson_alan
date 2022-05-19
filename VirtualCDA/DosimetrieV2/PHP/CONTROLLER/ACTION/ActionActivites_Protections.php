<?php
$elm = new Activites_Protections($_POST);
// var_dump($_POST);
switch ($_GET['mode']) {
	case "Ajouter": {
		// var_dump($_GET);
		
		$elm->setIdActivite((int)$_GET["idAct"]);
		$elm->setIdProtection((int)$_GET["idPro"]);
		$idOp= $_GET["idOp"];
		// var_dump($elm);
			/*  on ajoute */
			 Activites_ProtectionsManager::add($elm);
			//  $pro = Activites_ProtectionsManager::findLastAdd();
		 	// // header("Refresh:0.1; url=index.php?page=FormOperations2&mode=Modifier&id=".$idOp."#IdActivite".$pro->getIdActiviteProtection());
			 $url='index.php?page=FormOperations2&mode=Modifier&id='.$idOp.'#IdActivite'.$elm->getIdActivite();
			//  var_dump($url);
			
			break;
		}
	case "Supprimer": {
		$idOp= $_POST["IdOperation"];
			/* sup la protection */
			 Activites_ProtectionsManager::delete($elm);
			 $url='index.php?page=FormOperations2&mode=Modifier&id='.$idOp;
			break;
		}
		
} header('location:'.$url);





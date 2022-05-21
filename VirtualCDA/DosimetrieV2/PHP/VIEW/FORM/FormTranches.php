<?php
global $regex;
$mode = $_GET['mode'];
$disabled = " ";
switch ($mode) {
	case "Afficher":
	case "Supprimer":
		$disabled = " disabled ";
		break;
}

if (isset($_GET['id'])) {
	$id = $_GET['id'];
	$uneTranche = TranchesVuesManager::findById($id);
} else {
	$uneTranche = new TranchesVues();
}
// $objets = TranchesVuesManager::getList();

echo '
<form action="index.php?page=ActionTranches&mode=' . $_GET['mode'] . '" method="post" enctype="multipart/form-data"/>
	<div class="espace3"></div>
	';
	if ($mode != "Ajouter") {
		echo '<div class="noDisplay"><input type="hidden" value="' . $uneTranche->getIdTranche() . '" name=IdTranche></div>';
	} else if ($mode != "Modifier") {
		echo '<div class=" titreForm ">' . $mode . ' une tranche</div>';
	}
	if ($mode == "Ajouter" || $mode == "Modifier") {
		echo '<fieldset>
				<div class="row">
						<div class="align ">
								<div class="flex1"></div>
								<label for=LibelleTranche class="caseForm labelForm backWhite flex05">' . texte("LibelleTranche") ." : " . '</label>
									<div class="flex01"></div>
									<div class="caseForm donneeForm">
									<input type="text" ' . $disabled . 'value="' . $uneTranche->getLibelleTranche() . '" name=LibelleTranche pattern="' . $regex["*"] . '">
								</div>
						</div>
						<div class="flex01"></div>
						<div class="align">
						<div class="flex01"></div>
								<label for=chantier class="caseForm labelForm backWhite flex05">' . texte("Chantier") ." : " . '</label>
								<div class="flex01"></div>
								<div class="caseForm  donneeForm " >' .creerSelect($uneTranche->getIdChantier(), "Chantiers", ["LibelleChantier"]) .'
								</div>
								<div class="flex1"></div>
						</div>
				</div>
			</fieldset>';
	}
	else if ($mode == "Afficher" || $mode == "Supprimer") {
		echo '
		
		<div class="align ">
			<div class="titreForm ">' ."Tranche : ". $uneTranche->getLibelleTranche() . '</div>
		</div>
		<div class="espace3"></div>
		<div class="row">
			<div class="flex05"></div>
			<div class="align">
				<fieldset>
					<label for=IdChantier class="flex05 colorWhite">'.texte("IdChantier").'</label>
					<div class="flex01"></div>
					<div class="flex05">'.creerSelect($uneTranche->getIdChantier(),"Chantiers",["LibelleChantier"],$disabled).'</div>
					<div class="flex05"></div>';
					if ($mode != "Ajouter") {
					echo'<label for"rayonnement" class="flex1 colorWhite">Rayonnement : </label>
					<div class="flex01"></div>
					<div class="flex05 colorWhite">'.$uneTranche->getDosimetrieTranche().'</div>';
					}
					echo'
				</fieldset>
			</div>
			<div class="flex05"></div>		
		</div>
			';
	}

	?>
	<div class="ContenuForm ">
		<div class="marge"> </div>

		<div class="CentreForm">

			<div class="espace3"></div>

			<div class="Partie1Form">

				<div class="imgForm">
					<?php
					if ($mode == "Afficher" || $mode == "Supprimer") {
						echo '<img src="./IMG/' . $uneTranche->getPhotoTranche() . '">';
						echo '<input type="hidden" name="AnciennePhotos" value="' . $uneTranche->getPhotoTranche() . '">';
					} else if ($mode == "Ajouter" || $mode == "Modifier") {
						echo '<div class=" blockPhoto">
								<img src="./IMG/' . $uneTranche->getPhotoTranche() . '" />
								<div class="caseForm">
									<input type="hidden" name="AnciennePhotos" value="' . $uneTranche->getPhotoTranche() . '"/>
									<input type="file" name="Photos" ' . $disabled . '/>
								</div>
							</div>';
					}
					?>
				</div>
			</div>
			<div class="espace3"></div>
				<div class="Partie3Form">
					<?php
						if ($mode == "Afficher" || $mode == "Supprimer") {
							echo '
							<div class="colonne">
								<label for=DescriptionTranche class="caseForm backWhite">' . texte("DescriptionTranche") . '</label>
								<div class="espace1"></div>
								<div class=" scroll4 scroll">
									<textarea class="contenutx tv taille15" type="textarea" name="DescriptionTranche">' . $uneTranche->getDescriptionTranche() . '</textarea> 
								</div>
							</div>';
						} else if ($mode == "Ajouter" || $mode == "Modifier") {
							echo '
							<div class="colonne">
								<label for=DescriptionTranche class="caseForm backWhite">' . texte("DescriptionTranche") . '</label>
								<div class="espace1"></div>
								<div class=" scroll4 scroll">
									<textarea class="contenutx tv taille15" type="textarea" name="DescriptionTranche"  >' . $uneTranche->getDescriptionTranche() . '</textarea> 
								</div>
							</div>';
						}
					?>	
				</div>
		</div>
			<div class="marge">
				<div class="packBouton">
						<?php
						if($mode == "Afficher") {
							echo '<a>
									<button class="boutonA boutonAdd" onclick="history.back()">
										<i class="fas fa-sign-out-alt fa-rotate-180"></i>
									</button>
								</a>';
								if($_SESSION["utilisateur"]->getIdRole()>1){
								echo'<a class="boutonB boutonAdd" href="index.php?page=FormTranches&mode=Modifier&id=' . $uneTranche->getIdTranche() . '">
										<i class="fas fa-pen"></i>
									</a>
									<a  class="boutonC boutonAdd" href="index.php?page=FormTranches&mode=Supprimer&id=' . $uneTranche->getIdTranche() . '">
										<i class="fas fa-trash-alt"></i>
									</a>';
								}
						}else if ($mode == "Modifier" || $mode == "Supprimer" || $mode == "Ajouter") {
							echo '<a>
									<button class="boutonA boutonAdd" onclick="history.back()">
										<i class="fas fa-sign-out-alt fa-rotate-180"></i>
									</button>
								</a>
								<a>
									<button class="boutonA boutonAdd" type=\"submit\">
										<i class="fas fa-paper-plane"></i>
									</button>
								</a>';
						} 
					?>
				</div>
			</div>
		</div>
		<div class="espace4"></div>
</form>
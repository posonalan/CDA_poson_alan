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
	$unChantier= ChantiersVuesManager::findById($id);
} else {
	$unChantier = new ChantiersVues();
}
echo '
<div class="espace4"></div>
<form action="index.php?page=ActionChantiers&mode=' . $_GET['mode'] . '" method="post" enctype="multipart/form-data"/>';
	if ($mode != "Ajouter") {
		echo '
		<div class="noDisplay"><input type="hidden" value="' . $unChantier->getIdChantier() . '" name=IdChantier></div>';
	} else if ($mode != "Modifier") {
		echo '<div class=" titreForm ">' . $mode . ' un Chantier</div>';
	}
echo '
<div class="espace4"></div>
<div class="titreForm ">' . $unChantier->getLibelleChantier() . '</div>
<div class="inputRayonnement">
	<div class="flex05"></div>';
		if ($mode != "Ajouter") {
		echo'<fieldset>
				<div class="flex05"></div>
				<div class="flex05 colorWhite">'. texte("Rayonnement moyen") ." : ".' </div>
			 	<div class="flex01"></div>
				<div class="flex01 colorWhite">'.$unChantier->getDosimetrieChantier().'</div>
				<div class="flex05"></div>
			</fieldset>';
			}
		echo'<div class="flex05"></div>
</div>
';
?>
<div class="ContenuForm ">
	<div class="marge"> </div>
	<div class="CentreForm">
		<div class="espace3"></div>
		<div class="Partie1Form">
				<div class="imgForm">
				<?php
				if ($mode == "Afficher" || $mode == "Supprimer") {
					echo '<img src="./IMG/' . $unChantier->getPhotoChantier() . '">';
					echo '<input type="hidden" name="AnciennePhotos" value="' . $unChantier->getPhotoChantier() . '">';
				} else if ($mode == "Ajouter" || $mode == "Modifier") {
					echo '<div class=" blockPhoto">
							<img src="./IMG/' . $unChantier->getPhotoChantier() . '" />
							<div class="espace1"></div>
								<div class="caseForm">
									<input type="hidden" name="AnciennePhotos" value="' . $unChantier->getPhotoChantier() . '"/>
									<input type="file" name="Photos" ' . $disabled . '/>
								</div>
						</div>';
				}
				?>
			</div>
		</div>
		<div class="espace3"></div>
		<div class="Partie2Form">
			<div class="hautForm ">
			<?php
				if ($mode == "Ajouter" || $mode == "Modifier") {
				echo '<div class="blockLI">
						<div class="align">
							<label for=LibelleChantier class="caseForm labelForm backWhite">' . texte("LibelleChantier") . '</label>
							<div class="caseForm donneeForm">
								<input type="text" ' . $disabled . 'value="' . $unChantier->getLibelleChantier() . '" name=LibelleChantier pattern="' . $regex["*"] . '">
							</div>
						</div>
						<div class="espace3"></div>
					</div>';
				}
			?>
			</div>
		</div>
		<div class="Partie3Form">
			<?php
				echo '<div class="colonne">
						<label for=DescriptionChantier class="caseForm titreD backWhite">' . texte("DescriptionChantier") . '</label>
						<div class="espace1"></div>
						<div class="scroll4 scroll">
							<textarea class="contenutx tv taille15" type="textarea" '.$disabled.' name=DescriptionChantier >' . $unChantier->getDescriptionChantier() . '</textarea>
						</div>
					</div>';
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
						</a>
							';
					if($_SESSION["utilisateur"]->getIdRole()>1){
						echo'<a class="boutonB boutonAdd" href="index.php?page=FormChantiers&mode=Modifier&id=' . $unChantier->getIdChantier() . '">
								<i class="fas fa-pen"></i>
							</a>
							<a  class="boutonC boutonAdd" href="index.php?page=FormChantiers&mode=Supprimer&id=' . $unChantier->getIdChantier() . '">
								<i class="fas fa-trash-alt"></i>
							</a>';
					}
				}else if ($mode == "Modifier" || $mode == "Supprimer" || $mode == "Ajouter") {
					echo '
					<a>
						<button class="boutonA boutonAdd" onclick="history.back()">
							<i class="fas fa-sign-out-alt fa-rotate-180"></i>
						</button>
					</a>
					<a>
						<button class="boutonA boutonAdd" type=\"submit\">
							<i class="fas fa-paper-plane"></i>
						</button>
					</a>
					';
				} 
				?>
			</div>
		</div>
		</div>
	<div class="espace4"></div>
</form>
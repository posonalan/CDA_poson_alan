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
	$unBatiment = BatimentsManager::findById($id);
} else {
	$unBatiment = new Batiments();
}

$objets = BatimentsManager::getList();

echo '<form action="index.php?page=ActionBatiments&mode=' . $_GET['mode'] . '" method="post" enctype="multipart/form-data"/>
		<div class="espace4"></div>';

	if ($mode != "Ajouter") {
		echo '<div class="noDisplay"><input type="hidden" value="' . $unBatiment->getIdBatiment() . '" name=IdBatiment></div>';
	} else if ($mode != "Modifier") {
		echo '<div class=" titreForm ">' . $mode . ' un batiment</div>';
	}
	if ($mode == "Ajouter" || $mode == "Modifier") {
		echo '<div class="espace4"></div>
		<div class="row">
			  	<div class="flex01"></div>
				<fieldset class="align ">
					<div class="flex01"></div>
					<label for=LibelleBatiment class="caseForm labelForm backWhite flex09">' . texte("LibelleBatiment") ." : " . '</label>
					<div class="flex01"></div>
					<div class="caseForm donneeForm ">
						<input  type="text" ' . $disabled . 'value="' . $unBatiment->getLibelleBatiment() . '" name=LibelleBatiment pattern="' . $regex["*"] . '">
					</div>
					<div class="flex05"></div>
					<label for=Tranche class="caseForm labelForm backWhite flex08">' . texte("Tranche") ." : " . '</label>
					<div class="flex01"></div>
					<div class="caseForm  donneeForm " >' .creerSelect($unBatiment->getIdTranche(), "Tranches", ["LibelleTranche"]) .'</div>
					<div class="flex05"></div>
					<label class="caseForm labelForm backWhite flex09">'.texte("Rayonnement")." : ".'</label>
					<div class="flex01"></div>
					<div class="caseForm donneeForm ">
						<input class="" type="text" ' . $disabled . 'value="' . $unBatiment->getDosimetrieBatiment() . '" name=DosimetrieBatiment pattern="' . $regex["dose"] . '">
					</div>
					<div class="flex05"></div>
					<label class="caseForm labelForm backWhite flex1">'.texte("IdEnjeuRadio")." : ".'</label>
					<div class="flex01"></div>
					<div class="caseForm donneeForm">
					<div class="caseForm donneeForm">' .creerSelect($unBatiment->getIdEnjeuRadio(), "EnjeuxRadiologiques", ["LibelleEnjeuRadio"]) .'</div></div>
					<div class="flex01"></div>
				</fieldset>
				<div class="flex01"></div>
			</div>
			';
	}
	else if ($mode == "Afficher" || $mode == "Supprimer") {
	echo'<div class="align ">
			<div class="titreForm ">' ."Batiment : ". $unBatiment->getLibelleBatiment() . '</div>
		</div>
		<div class="espace"></div>
		<div class="row">
			<div class="flex05"></div>
			<div class="align">
				<fieldset>
					<label for=IdBatiment class="flex05 colorWhite">'.texte("IdTranche")." :" .'</label>
					<div class="flex01"></div>
					<div class="flex05 colorWhite">'.creerSelect($unBatiment->getIdTranche(),"Tranches",["LibelleTranche"],$disabled).'</div>
					<div class="flex05"></div>
					<label for=IdBatiment class="flex05 colorWhite">'.texte("Rayonnement")." : ".'</label>
					<div class="flex01"></div>
					<div class="flex05 colorWhite">' . $unBatiment->getDosimetrieBatiment() . '</div>
				</fieldset>
			</div>
			<div class="flex05"></div>	
		</div>';
	}
	?>
	<div class="ContenuForm ">
		<div class="marge"></div>
		<div class="CentreForm">
			<div class="espace3"></div>
			<div class="Partie1Form">
				<div class="imgForm">
					<?php
					if ($mode == "Afficher" || $mode == "Supprimer") {
						echo '<img src="./IMG/' . $unBatiment->getPhotoBatiment() . '">';
						echo '<input type="hidden" name="AnciennePhotos" value="' . $unBatiment->getPhotoBatiment() . '">';
					} else if ($mode == "Ajouter" || $mode == "Modifier") {
						echo '<div class=" blockPhoto">
								<img src="./IMG/' . $unBatiment->getPhotoBatiment() . '" />
								<div class="espace1"></div>
								<div class="caseForm">
									<input type="hidden" name="AnciennePhotos" value="' . $unBatiment->getPhotoBatiment() . '"/>
									<input type="file" name="Photos" ' . $disabled . '/>
								</div>
							</div>';
					}
					?>
				</div>
			</div>
			<div class="espace4"></div>
			<div class="Partie2Form">
				<div class="hautForm">
					<?php
					if ( $mode == "Modifier") {
					echo '<div class="blockLI">
							<div class="align">
								<label for=LibelleBatiment class="caseForm labelForm backWhite">' . texte("LibelleBatiment") . '</label>
								<div class="caseForm donneeForm">
									<input type="text" ' . $disabled . 'value="' . $unBatiment->getLibelleBatiment() . '" name=LibelleBatiment pattern="' . $regex["*"] . '">
								</div>
							</div>
							<div class="espace4"></div>
						</div>';
					}
					?>
				</div>
			</div>

			<div class="Partie3Form">
				<?php
				if ($mode == "Afficher" || $mode == "Supprimer") {
					echo '<div class="colonne">
							<label for=DescriptionBatiment class="caseForm titreD backWhite">' . texte("DescriptionBatiment") . '</label>
							<div class="espace1"></div>
							<div class="scroll4 scroll"> 
							<textarea class=" contenutx tv taille15" type="textarea" disabled name=DescriptionBatiment>' . $unBatiment->getDescriptionBatiment() . '</textarea>
							</div>
						</div>';
				} else if ($mode == "Ajouter" || $mode == "Modifier") {
					echo '<div class="colonne">
							<label for=DescriptionBatiment class="caseForm titreD backWhite">' . texte("DescriptionBatiment") . '</label>
							<div class="espace1"></div>
							<div class="scroll4 scroll"> 
							<textarea class=" contenutx tv taille15" type="textarea"  name=DescriptionBatiment>' . $unBatiment->getDescriptionBatiment() . '</textarea>
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
						echo '
							<a>
								<button class="boutonA boutonAdd" onclick="history.back()">
									<i class="fas fa-sign-out-alt fa-rotate-180"></i>
								</button>
							</a>
							';

							if($_SESSION["utilisateur"]->getIdRole()>1){
								echo'
							<a class="boutonB boutonAdd" href="index.php?page=FormBatiments&mode=Modifier&id=' . $unBatiment->getIdBatiment() . '">
								<i class="fas fa-pen"></i>
							</a>

							<a  class="boutonC boutonAdd" href="index.php?page=FormBatiments&mode=Supprimer&id=' . $unBatiment->getIdBatiment() . '">
								<i class="fas fa-trash-alt"></i>
							</a>
							';
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
		<div class="espaceV"></div>
</form>
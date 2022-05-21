<?php
global $regex;
$mode = $_GET['mode'];
$disabled = " ";
switch ($mode) {
	case "Afficher":
		$disabled = " disabled ";
		break;
	case "Supprimer":
		$disabled = " disabled ";
		break;
}

if (isset($_GET['id'])) {
	$elm = ProtectionsManager::findById($_GET['id']);
} else {
	$elm = new Protections();
}

echo '

<form action="index.php?page=ActionProtections&mode=' . $_GET['mode'] . '" method="post" enctype="multipart/form-data"/>';

	if ($mode != "Ajouter") {
		echo '<div class="noDisplay"><input type="text" value="' . $elm->getIdProtection() . '" name="IdProtection"></div>';
	} else if ($mode != "Modifier") {
		echo '
		<div class="espace3"></div>
		<div class=" titreForm alignement">' . $mode . ' une protection</div>
		';
	}

	if ($mode == "Afficher") {
		echo'<div class="bigEspace"></div>
		<div class="espaceV"></div>
			<div class="">
				<div class="titreForm ">' . $elm->getLibelleProtection() . '</div>
			</div>
			<div class="espaceV"></div>';
	} else if ($mode == "Modifier" || $mode == "Supprimer" ) {
		echo '<div class="bigEspace"></div>
			  <div class=" titreForm alignement">' . $mode . ' une protection</div>
			 
			  <div class="titreForm ">' . $elm->getLibelleProtection() . '</div>
			  <div class="bigEspace"></div>
			';
		}
		?>

	<div class="ContenuForm">
		<div class="marge"></div>
		<div class="CentreForm">
		
				<!-- Partie Photo ************************************************-->
				<div class="Partie1Form">	
					<div class="imgForm">
						<?php
						if ($mode == "Afficher" || $mode == "Supprimer") {
						echo '<img src="./IMG/' . $elm->getPhotoProtection() . '" />';
						echo '<input type="hidden" name="AnciennePhotos" value="' . $elm->getPhotoProtection() . '">';
						}
						 else if ($mode == "Ajouter" || $mode == "Modifier") {
						echo'	<div class=" blockPhoto">
									<img src="./IMG/' . $elm->getPhotoProtection() . '" />
									<div class="espace"></div>
									<div class="caseForm">
										<input type="hidden" name="AnciennePhotos" value="' . $elm->getPhotoProtection() . '"/>
										<input type="file" name="Photos"/>
									</div>
							  	</div>';
						}
						?>
					</div>
				</div>

			<div class="espace2"></div>

			<div class="Partie2Form">

				<div class="hautForm">

					<?php

					if ($mode == "Ajouter" || $mode == "Modifier") 
					{
						echo '<div class="">
								<div class="align">
									<label for=LibelleProtection class="caseForm labelForm backWhite flex04">' . texte("LibelleProtection") . '</label>
									<div class="flex01"></div>
									<div class="caseForm donneeForm">
										<input type="text" ' . $disabled . 'value="' . $elm->getLibelleProtection() . '" name=LibelleProtection pattern="' . $regex["*"] . '">
									</div>
								</div>
							<div class="flex01"></div>';
							echo '<div class="align">
									<label for=DosimetrieProtection class="caseForm labelForm backWhite flex1">' . texte("DosimetrieProtection") . '</label>
									<div class="flex01"></div>
									<div class="caseForm donneeForm backWhite">
										<input type="text" ' . $disabled . 'value="' . $elm->getDosimetrieProtection() . '" name=DosimetrieProtection pattern="' . $regex["dose"] . '">
									</div>
									<div class="flex01"></div>
								<div class="flex01 caseForm  backWhite">mSv</div>
								</div>
							</div>
								';
					}
					else if ($mode == "Afficher" || $mode == "Supprimer") 
					{
						echo '<div class="blockLI">
								<div class="align">
									<label for=DosimetrieProtection class="caseForm labelForm backWhite">' . texte("DosimetrieProtection") . '</label>
									<div class="flex01"></div>
									<div class="caseForm donneeForm backWhite">
										<input type="text" ' . $disabled . 'value="' . $elm->getDosimetrieProtection() . '" name=DosimetrieProtection pattern="' . $regex["dose"] . '">
									</div>
								</div>
							</div>
					';
					}
					?>
				</div>
			</div>

			<div class="espace1"></div>
			<div class="Partie3Form">
				<div class="taille25 colonne">
					<?php
					echo'<label for=DescriptionProtection class="caseForm titreD backWhite flex02">' . texte("Description") ." : ". '</label>
						<div class="flex01"></div>
						<textarea class=" contenutx tv taille15 " type="textarea" '.$disabled.' name="DescriptionProtection" >' . $elm->getDescriptionProtection() . '</textarea>';
					?>
				</div>
                <div class="flex02"></div>
				<div class="taille25 colonne">
					<?php
					echo'<label for=InformationProtection class="caseForm titreD backWhite flex02">' . texte("Information") ." : ". '</label>
						<div class="flex01"></div>
						<textarea class=" contenutx tv taille15 " type="textarea" '.$disabled.' name="InformationProtection" >' . $elm->getInformationProtection() . '</textarea>';
					?>
					</div>
				</div>
				<div class="espaceV"></div>
			</div>
		<div class="marge">
			<div class="packBouton">
					<?php
					if ($mode == "Afficher") {
						echo '
								<a>
									<button class="boutonA boutonDeco" href="index.php?page=ListeProtections2">
										<i class="fas fa-sign-out-alt fa-rotate-180"></i>
									</button>
								</a> ';
								if($_SESSION["utilisateur"]->getIdRole()>1){
									echo'
									<a class="boutonC boutonDeco" href="index.php?page=FormProtections&mode=Modifier&id=' . $elm->getIdProtection() . '">
										<i class="fas fa-pen"></i>
									</a>

									<a class="boutonB boutonDeco" href="index.php?page=FormProtections&mode=Supprimer&id=' . $elm->getIdProtection() . '">
										<i class="fas fa-trash-alt"></i>
									</a>
									';
								}
					} else if ($mode == "Ajouter" || $mode == "Modifier" || $mode == "Supprimer") {
						echo	'<a>
									<button class="boutonA boutonDeco" type=\"submit\">
										<i class="fas fa-paper-plane"></i>
									</button>
								</a>';
						echo 	'<a class="boutonB boutonDeco" href="index.php?page=ListeProtections2">
									<i class="fas fa-sign-out-alt fa-rotate-180"></i>
								</a> ';
						} 
						?>
			</div>
		</div>

	</div>
</form>
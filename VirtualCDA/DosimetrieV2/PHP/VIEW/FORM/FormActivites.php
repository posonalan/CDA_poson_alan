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
	$elm = ActivitesManager::findById($_GET['id']);
} else {
	$elm = new Activites();
}

if (isset($_GET['id'])) {
	$elm2 = ProtectionsManager::findById($_GET['id']);
} else {
	$elm2 = new Protections();
}

$objets = ActivitesManager::getList();


echo ' <form class="" action="index.php?page=ActionActivites&mode=' . $_GET['mode'] . '" method="post" enctype="multipart/form-data"/>




<div class="espaceV"></div>


<div class="titreForm ">' . $elm->getLibelleActivite() . '</div>
<div class="inputRayonnement">
	<div class="flex01"></div>
	<div class="flex05">operation : </div>
	<div class="flex01"></div>
	<div class="backWhite flex1">decoupage de tuyaux </div>
	<div class="flex01"></div>
	<div class="flex05">Chantier : </div>
	<div class="flex01"></div>
	<div class="backWhite flex1">centrale nucleaire Graveline </div>
	<div class="flex01"></div>
	<div class="flex05">Tranche : </div>
	<div class="flex01"></div>
	<div class="backWhite flex1">numero 1 </div>
	<div class="flex01"></div>
	<div class="flex05">Batiment : </div>
	<div class="flex01"></div>
	<div class="backWhite flex1">Réacteur </div>
	<div class="flex01"></div>
</div>

<div class="espace01"></div>

<div>
<div class="flex01"></div>
	<div class="flex05">Effectif : </div>
	<div class="flex01"></div>
	<div class="backWhite flex05">35</div>
	<div class="flex01"></div>
	<div class="flex1">Temps prévu : </div>
	<div class="flex01"></div>
	<div class="backWhite flex05">150</div>
	<div class="flex01"></div>
	<div class=" flex05">H</div>
	<div class="flex01"></div>
	<div class="flex1">Dosimétrie éstimé : </div>
	<div class="flex01"></div>
<div class=" flex05 backWhite">0.3</div>
	<div class="flex01 "></div>

</div>

';

if ($mode != "Ajouter") {

	echo '<div class="noDisplay"><input type="hidden" value="' . $elm->getIdActivite() . '" name=IdActivite></div>';
} else if ($mode != "Modifier") {
	echo '<div class=" titreForm alignement">' . $mode . ' une activite</div>';
}

?>

<div class="formContenu ">

	<div class="marge"> </div>


	<div class="">

		<div class="imgForm">

			<?php


			if ($mode == "Afficher") {

				echo '<img src="./IMG/' . $elm->getPhotoActivite() . '" />';
				echo '
			<input type="hidden" name="AnciennePhotos" value="' . $elm->getPhotoActivite() . '">
		';
			} else if ($mode == "Ajouter") {

				echo '
				
				<div class=" blockPhoto">
					<img src="./IMG/' . $elm->getPhotoActivite() . '" />
					<div class="caseForm">
						<input type="hidden" name="AnciennePhotos" value="' . $elm->getPhotoActivite() . '"/>
						<input type="file" name="Photos" ' . $disabled . '/>
					</div>
				</div>

				';
			}
			?>
		</div>


		<div class="formBlock">


			<div class="hautForm ">

				<?php

				if ($mode == "Ajouter") {
					echo '<div class="blockLI">
							<div class="align">
								<label for=LibelleActivite class="caseForm labelForm">' . texte("LibelleActivite") . '</label>';

					echo '<div class="caseForm donneeForm ">
								<input type="text" ' . $disabled . 'value="' . $elm->getLibelleActivite() . '" name=LibelleActivite pattern="' . $regex["*"] . '">
								</div>';

					echo '
							</div>
							<div class="align">
								<label for=IdTranche class="caseForm  labelForm ">' . texte("LibelleTranche") . " :" . '</label>';

					echo '<div class="caseForm  donneeForm " >' .
						creerSelect($elm->getIdTranche(), "Tranches", ["LibelleTranche"],null,null,null,"Choisir une tranche") .
						'</div>
							</div>


							<div class="align">
								<label for=IdBatiment class="caseForm  labelForm ">' . texte("LibelleBatiment") . " :" . '</label>';

					echo '<div class="caseForm  donneeForm " >' .
						creerSelect($elm->getIdBatiment(), "Batiments", ["LibelleBatiment"]) .
						'</div>
							</div>';



					foreach ($objets as $unObjet) {
						echo '<div class="align">
						<label for=IdActivite class="caseForm labelForm ">' . texte("LibelleActivite") . " :" . '</label>
						<div class="caseListe donneeListe">' . $unObjet->getLibelleActivite() . '</div>';

						echo '<div class=" caseForm donneeForm labelForm"> 
							<a href="index.php?page=FormActivites&mode=Afficher&id=' . $unObjet->getIdActivite() . '">
								<i class="fas fa-file-contract">
								</i>
							</a>
						</div>
						</div>';
					}

					echo '</div>';
				}

				?>

				<div class="basForm">

					<?php
					if ($mode == "Afficher") {



						echo '
				
					<div class="taille45 colonne">
						<label for=DescriptionActivite class="caseForm titreD">' . texte("DescriptionActivite") . " :" . '</label>
						<div class=" textForm scrollbar" id="style-7">' . $elm->getDescriptionActivite() . '<div class="force-overflow"></div></div>
					</div>
						
			

					<div class="taille45  colonne">
						<label for=Risque class="caseForm titreD">' . texte("Risque") . '</label>
						<div class=" textForm scrollbar" id="style-7">' . $elm->getRisque() . '<div class="force-overflow"></div></div>
					</div>

					<div class="taille45  colonne">
					<label for=Parade class="caseForm titreD">' . texte("Parade") . '</label>
					<div class=" textForm scrollbar" id="style-7">' . $elm->getParade() . '<div class="force-overflow"></div></div>
				</div>

		<div class="blockProtectionBouton">
			<div class="blockProtection">
				<div class="taille45  colonne">
					<label for=Protection class="caseForm titreD">' . texte("LibelleProtection") . '</label>
						<div class=" textForm scrollbar" id="style-7">' . $elm2->getLibelleProtection() . '
							<div class="force-overflow"></div>
						</div>
				</div>

				<div class="taille45  colonne">
					<label for=Protection class="caseForm titreD">' . texte("TauxDosimetrique") . '</label>
					<div class=" textForm scrollbar" id="style-7">' . $elm2->getDosimetrieProtection() . '
						<div class="force-overflow"></div>
					</div>
				</div>
			</div>
			<div class="">
			<a href="index.php?page=FormProtections&mode=Ajouter">
								<i class="fas fa-file-contract">
								</i>
							</a>
			</div>



		</div>

					
				';
					} else if ($mode == "Ajouter" || $mode == "Modifier") {

						echo '
						<div class=" taille45 colonne ">
							<label for=DescriptionActivite class="caseForm titreD">' . texte("DescriptionActivite") . '</label>
								<div class=" ">
									<input  class="tv  " type="text" ' . $disabled . 'value="' . $elm->getDescriptionActivite() . '" name=DescriptionActivite pattern="' . $regex["*"] . '">
								</div>
				
						</div>
						<div class="flex05"></div>	


			<div class="taille45  colonne">
				<label for=Risque class="caseForm titreD">' . texte("Risque") . '</label>
				<div class=" textForm scrollbar" id="style-7">' . $elm->getRisque() . '
					<div class="force-overflow"></div>
				</div>
			</div>

			<div class="taille45  colonne">
				<label for=Parade class="caseForm titreD">' . texte("Parade") . '</label>
				<div class=" textForm scrollbar" id="style-7">' . $elm->getParade() . '
					<div class="force-overflow"></div>
				</div>
			</div>

			<div class="taille45  colonne">
				<label for=Protection class="caseForm titreD">' . texte("Protection") . '</label>
				<div class=" textForm scrollbar" id="style-7">' . $elm2->getIdProtection() . '
					<div class="force-overflow"></div>
				</div>
			</div>
			
			';
					}
					?>

				</div>
			</div>

		</div>

		<div class="marge">

			<div class="packBouton">
				<?php
				if ($mode == "Afficher" || $mode == "Modifier" || $mode == "Supprimer" || $mode == "Ajouter") {
					echo ' 
					<a>
						<button class="boutonA" onclick="history.back()">
						<i class="fas fa-sign-out-alt fa-rotate-180"></i>
						</button>
					</a>	
				';
				}

				?>

				<?php

				if ($mode == "Afficher") {

					echo '
					<div class="espaceBouton"></div>

						<a class="boutonB" href="index.php?page=FormActivites&mode=Modifier&id=' . $elm->getIdActivite() . '">
					 		<i class="fas fa-pen"></i>
						</a>
						

						<a class="boutonC" href="index.php?page=FormActivites&mode=Supprimer&id=' . $elm->getIdActivite() . '">
							<i class="fas fa-trash-alt"></i>
						</a>
						

						';
				} else if ($mode == "Ajouter") {
					echo '
					<div class="espaceBouton"></div>
	
					<a>
					<button class="boutonA" type=\"submit\">
					<i class="fas fa-paper-plane"></i>
					</button>
					</a>
					
					';
				} else if ($mode == "Modifier") {
					echo '
					<div class="espaceBouton"></div>
					<a>
						<button class="boutonA" type=\"submit\">
							<i class="fas fa-paper-plane"></i>
						</button>
					</a>
					';
				} else if ($mode == "Supprimer") {
					echo '

					<div class="espaceBouton"></div>
	
					<a>
						<button class="boutonA" type=\"submit\">
							<i class="fas fa-paper-plane"></i>
						</button>
					</a>
					';
				}

				?>

			</div>

			<div class="espaceV"></div>
		</div>
	</div>


</div>
</form>
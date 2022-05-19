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
	$uneOperation = OperationsManager::findById($id);
	// $uneActivite = ActivitesManager::findById($uneOperation->getIdActivite());
	$uneActivite = ActivitesManager::findById($id);
	$uneProtection = ProtectionsManager::findById($id);
	$uneActiviteProtection = ActivitesProtectionsManager::findById($id);
} else {
	$uneOperation = new Operations();
	$uneActivite = new Activites();
	$uneProtection = new Protections();
	$uneActiviteProtection = new ActivitesProtections();
}



echo '
<div class="colonne">
  <form class="" action="index.php?page=ActionOperations&mode=' . $_GET['mode'] . '" method="post" enctype="multipart/form-data"/>
  		<input type="hidden" value="' . $uneOperation->getIdOperation() . '" name=IdOperation>

		<div class="espaceV"></div>
		<div class="titreForm ">' . $uneOperation->getLibelleOperation() . '</div>
		<div class="inputRayonnement">
			<div class="flex01"></div>
			<div class="flex05">Chantier : </div>
			<div class="flex01"></div>
			<div class="backWhite flex1">Centrale nucleaire Graveline</div>
			<div class="flex01"></div>
			<div class="flex05">Effectif : </div>
			<div class="flex01"></div>
			<div class="backWhite flex01">35</div>
			<div class="flex01"></div>
			<div class="flex1">Temps prévu : </div>
			<div class="flex01"></div>
			<div class="backWhite flex05">150</div>
			<div class="flex01"></div>
			<div class=" flex05">H</div>
			<div class="flex01"></div>
			<div class="flex1">Dosimétrie moyenne : </div>
			<div class="flex01"></div>
			<div class="backWhite flex05">0.3</div>
			<div class="flex01"></div>
		</div>';



			if ($mode != "Ajouter") {
				echo '<div class="noDisplay"><input type="hidden" value="' . $uneOperation->getIdOperation() . '" name=IdOperation></div>';
			} else if ($mode != "Modifier") {
				echo '<div class=" titreForm alignement">' . $mode . ' une operation</div>';
			}
			?>

		<!-- Contenu du formulaire ************************************************-->
		<div class="ContenuForm ">

			<div class="marge"> </div>

			<!-- Centre formulaire************************************************-->
			<div class="CentreForm">

				<div class="espaceV"></div>

				<!-- Partie Photo ************************************************-->
				<div class="Partie1Form">

					<div class="imgForm">
						<?php
						if ($mode == "Afficher" || $mode == "Supprimer") {
							echo '<img src="./IMG/' . $uneOperation->getPhotoOperation() . '" />';
							echo '<input type="hidden" name="AnciennePhotos" value="' . $uneOperation->getPhotoOperation() . '">';
						} else if ($mode == "Ajouter" || $mode == "Modifier" ) {
							echo '<div class=" blockPhoto">
									<img src="./IMG/' . $uneOperation->getPhotoOperation() . '" />
									<div class="caseForm">
										<input type="hidden" name="AnciennePhotos" value="' . $uneOperation->getPhotoOperation() . '"/>
										<input type="file" name="Photos" ' . $disabled . '/>
									</div>
								 </div>
								';
						}
						?>
					</div>

				</div>

				<div class="espaceV"></div>

				<div class="Partie2Form">

					<div class="hautForm">

						<?php

						if ($mode == "Ajouter" || $mode == "Modifier" )
						{
							echo '
								<div class="blockLI">
									<div class="align">
										<label for=LibelleOperation class="caseForm labelForm backWhite">' . texte("LibelleOperation") . '</label>

										<div class="caseForm donneeForm ">
											<input type="text" ' . $disabled . 'value="' . $uneOperation->getLibelleOperation() . '" name=LibelleOperation pattern="' . $regex["*"] . '">
										</div>
									</div>
							
									<div class="align">
										<label for=IdChantier class="caseForm  labelForm backWhite">' . texte("LibelleChantier") . " :" . '</label>
										<div class="caseForm  donneeForm " >'.creerSelect($uneOperation->getIdChantier(), "Chantiers", ["LibelleChantier"],null,null,null,"Choisir un chantier") .'
										</div>
									</div>
								</div>';
						}
						?>
					</div>	
				</div>

				<div class="Partie3Form">

					<?php
					if ($mode == "Afficher") {
					echo '
						<div class="taille45 colonne">
							<label for=DescriptionOperation class="caseForm titreD backWhite">' . texte("DescriptionOperation") . " :" . '</label>
							<div class=" textForm scrollbar" id="style-7">' . $uneOperation->getDescriptionOperation() . '
								<div class="force-overflow">
								</div>
							</div>
						</div>
								
						<div class="taille45 colonne">
							<label for=InformationOperation class="caseForm titreD backWhite">' . texte("InformationOperation") . '</label>
							<div class=" textForm scrollbar" id="style-7">' . $uneOperation->getInformationOperation() . '
								<div class="force-overflow">
								</div>
							</div>
						</div>
						';
					} 
							
					else if ($mode == "Ajouter" || $mode == "Modifier") {

					echo '
					<div class=" taille45 colonne ">
						<label for=DescriptionOperation class="caseForm titreD backWhite">' . texte("DescriptionOperation") . '</label>
						<div class=" ">
							<input  class="tv  " type="text" ' . $disabled . 'value="' . $uneOperation->getDescriptionOperation() . '" name=DescriptionOperation pattern="' . $regex["*"] . '">
						</div>
					</div>
					
					<div class=" taille45 colonne">
						<label for=InformationOperation class="caseForm titreD backWhite">' . texte("InformationOperation") . '</label>
						<div class=" ">
							<input  class="tv  " type="text" ' . $disabled . 'value="' . $uneOperation->getInformationOperation() . '" name=InformationOperation pattern="' . $regex["*"] . '">
						</div>
					</div>
					';
					}
					?>
					
				</div>

				<div class="espaceV"></div>
			</div>	
		

			<div class="marge">
				<div class="packBouton">
					<?php
					if($mode == "Afficher") {

						echo '
							<a>
								<button class="boutonA" onclick="history.back()">
									<i class="fas fa-sign-out-alt fa-rotate-180"></i>
								</button>
							</a>
								
							<a class="boutonB" href="index.php?page=FormOperations3&mode=Modifier&id=' . $uneOperation->getIdOperation() . '">
								<i class="fas fa-pen"></i>
							</a>

							<a  class="boutonC" href="index.php?page=FormOperations3&mode=Supprimer&id=' . $uneOperation->getIdOperation() . '">
								<i class="fas fa-trash-alt"></i>
							</a>
							';
					}else if ($mode == "Modifier" || $mode == "Supprimer" || $mode == "Ajouter") {
						echo '
						<a>
							<button class="boutonA" onclick="history.back()">
								<i class="fas fa-sign-out-alt fa-rotate-180"></i>
							</button>
						</a>
						<a>
							<button class="boutonA" type=\"submit\">
								<i class="fas fa-paper-plane"></i>
							</button>
						</a>
						';
					} 
					?>

				</div>
			</div>
		</div>
	</form>

	<!-- /********************** Formulaire d'Activité ************************************/ -->
	<div>
		<div class="marge"> </div>
		
		<div id="AddActivite" class="colonne">
			<div class=" colonne ">
				
				<?php
				echo'
				<div>
					<h2 class="backWhite">Liste des activités de l\'operation</h2>
				</div>';

				$listeActivite = ActivitesManager::getList(null,['IdOperation'=>$uneOperation->getIdOperation()]);
				foreach ($listeActivite as $keyActivite => $uneActivite) {
				
				echo'
				<div class="espaceV"></div>
				<form  action="index.php?page=ActionActivites&mode=' . $mode . '" method="POST" class="activites colonne" name="" enctype="multipart/form-data">
					<input name= "IdOperation" value="' . $uneOperation->getIdOperation() . '" type= "hidden">
					<input name= "IdActivite" value="' . $uneActivite->getIdActivite() . '" type= "hidden">

					<div class="CentreForm formActivite">
						<fieldset class=" colonne">
							<legend for=LibelleActivite class="caseForm titreD backWhite " >
								<a aria-expanded="true" class="aPourAccess" >' . $uneActivite->getLibelleActivite() . '</a>
							</legend>
							<input name= "LibelleActivite" value="' . $uneActivite->getLibelleActivite() . '" type= "hidden">
											
										<div>
											<div class="colonne">
												<div class="contenuActivite">
													<div class="contenuA1">
														<div class="imgFormA">';
											
															if ($mode == "Afficher" || $mode == "Supprimer") {

															echo '<img src="./IMG/' . $uneActivite->getPhotoActivite() . '" />';
															echo '<input type="hidden" name="AnciennePhotos" value="' . $uneActivite->getPhotoActivite() . '">
																';
															} else if ($mode == "Ajouter" || $mode == "Modifier") {

															echo '<div class=" blockPhoto">
																		<img src="./IMG/' . $uneActivite->getPhotoActivite() . '" />
																		<div class="caseForm">
																			<input type="hidden" name="AnciennePhotos" value="' . $uneActivite->getPhotoActivite() . '"/>
																			<input type="file" name="Photos" ' . $disabled . '/>
																		</div>
																	</div>';
															}
													echo'</div>
													</div>
													<div class="flex01"></div>
													<div class="contenuA2">
													
														<div class="  ">
															<label for=DosimetrieActivite class="  backWhite">' . texte("DosimetrieActivite") . '</label>
															<div class="flex01">
															</div>
															<div class=" backWhite">
																0.5
															</div>
														</div>

														<div class="flex01"></div>

														<div class="  ">
															<label for=EffectifActivite class="  backWhite">' . texte("EffectifActivite") . '</label>
															<div class="flex01">
															</div>
															<div class=" ">
																<input  class="  backWhite" type="text" ' . $disabled . 'value="' . $uneActivite->getEffectifActivite() . '" name=EffectifActivite pattern="' . $regex["*"] . '">
															</div>
														</div>	

														<div class="flex01"></div>

														<div class="  ">
															<label for=TempsActivite class="  backWhite">' . texte("TempsActivite") . '</label>
															<div class="flex01">
															</div>
															<div class=" ">
																<input  class="backWhite" type="text" ' . $disabled . 'value="' . $uneActivite->getTempsActivite() . '" name=TempsActivite pattern="' . $regex["*"] . '">
															</div>
														</div>	

														<div class="flex01"></div>

														<div class="  ">
															<label for=LibelleBatiment class="  backWhite">' . texte("LibelleBatiment") . '</label>
															<div class="flex01">
															</div>
															<div class=" ">
																<div class="caseForm  donneeForm " >'.creerSelect($uneActivite->getIdBatiment(),"Batiments",["LibelleBatiment"]).'</div>
															</div>
														</div>
													</div>
													<div class="flex01"></div>	
												</div>

												<div class="espaceV"></div>
													
											
												<div class="">

														<div class=" colonne  ">
															<label for=DescriptionActivite class="caseForm titreD backWhite">' . texte("DescriptionActivite") . '</label>
															<div class="flex01"></div>
															<input  class="tv  " type="text" ' . $disabled . 'value="' . $uneActivite->getDescriptionActivite() . '" name=DescriptionActivite pattern="' . $regex["*"] . '">
														</div>

														<div class="flex01"></div>

														<div class=" colonne  ">
															<label for=Risque class="caseForm titreD backWhite">' . texte("Risque") . '</label>
															<div class="flex01"></div>
															<input  class="tv  " type="text" ' . $disabled . 'value="' . $uneActivite->getRisque() . '" name=Risque pattern="' . $regex["*"] . '">
														</div>

														<div class="flex01">	</div>

														<div class=" colonne  ">
															<label for=Parade class="caseForm titreD backWhite">' . texte("Parade") . '</label>
															<div class="flex01"></div>
															<input  class="tv  " type="text" ' . $disabled . 'value="' . $uneActivite->getParade() . '" name=Parade pattern="' . $regex["*"] . '">
														</div>
																	
												</div>
												<div class="espaceV"></div>
												<a>
													<button class="" type=\"submit\">
														<i class="fas fa-paper-plane"></i>
													</button>
												</a>
											</div>
										</div>
						</fieldset>			
					</div>
				</form>';
					
				include "PHP/VIEW/FORM/TemplateActivite.php";
				}
				?>
			</div>
			
			<div class="espaceV"></div>
		
		</div>
		<div class="marge"> </div>
		
	</div>
		<button type="button" id="BtnAddActivite">Ajouter une activité</button>

		<div class="espaceV"></div>

	<!-- /********************** Formulaire de Protection ************************************/ -->
	<div>
		<div class="marge"> </div>
		
			<div id="AddActiviteProtection" class="colonne">
				<div class="Partie5Form colonne ">
					
					<?php
					echo'
					<div>
						<h2 class="backWhite">Liste des Protections de l\'activité</h2>
					</div>';

					$listeActiviteProtection = ActivitesProtectionsManager::getList(null,['IdActivite'=>$uneActivite->getIdActivite()]);
					foreach ($listeActiviteProtection as $keyActiviteProtection => $uneActiviteProtection) {
					
					echo'
					<div class="espaceV"></div>
					<form  action="index.php?page=ActionActivitesProtections&mode=' . $mode . '" method="POST" class="protection colonne" name="" enctype="multipart/form-data">
						<input name= "IdActivite" value="' . $uneActivite->getIdActivite() . '" type= "hidden">
						<input name= "IdActiviteProtection" value="' . $uneActiviteProtection->getIdActiviteProtection() . '" type= "hidden">

						<div class="CentreForm">
							<fieldset class="colonne">
								<legend for=LibelleProtection class="caseForm titreD backWhite " >
									<a aria-expanded="true" class="aPourAccess" >' . $uneActiviteProtection->getLibelleProtection() . '</a>
								</legend>
								<input name= "LibelleProtection" value="' . $uneActiviteProtection->getLibelleProtection() . '" type= "hidden">
												
											<div>
												<div class="colonne">
													<div class="contenuProtection">
														<div class="contenuA1">
															<div class="imgFormA">';
												
																if ($mode == "Afficher" || $mode == "Supprimer") {

																echo '<img src="./IMG/' . $uneActiviteProtection->getPhotoProtection() . '" />';
																echo '<input type="hidden" name="AnciennePhotos" value="' . $uneActiviteProtection->getPhotoProtection() . '">
																	';
																} else if ($mode == "Ajouter" || $mode == "Modifier") {

																echo '<div class=" blockPhoto">
																			<img src="./IMG/' . $uneActiviteProtection->getPhotoProtection() . '" />
																			<div class="caseForm">
																				<input type="hidden" name="AnciennePhotos" value="' . $uneActiviteProtection->getPhotoProtection() . '"/>
																				<input type="file" name="Photos" ' . $disabled . '/>
																			</div>
																		</div>';
																}
														echo'</div>
														</div>
														<div class="flex01"></div>
														<div class="contenuA2">
														
															<div class="  ">
																<label for=DosimetrieProtection class="  backWhite">' . texte("DosimetrieProtection") . '</label>
																<div class="flex01"></div>
																<input  class="tv  " type="text" ' . $disabled . 'value="' . $uneActiviteProtection->getDosimetrieProtection() . '" name=DosimetrieProtection pattern="' . $regex["*"] . '">
															
															</div>

														</div>
														<div class="flex01"></div>	
													</div>

													<div class="espaceV"></div>
														
												
													<div class="">

															<div class=" colonne  ">
																<label for=DescriptionProtection class="caseForm titreD backWhite">' . texte("DescriptionProtection") . '</label>
																<div class="flex01"></div>
																<input  class="tv  " type="text" ' . $disabled . 'value="' . $uneActiviteProtection->getDescriptionProtection() . '" name=DescriptionProtection pattern="' . $regex["*"] . '">
															</div>

															<div class="flex01"></div>

															<div class=" colonne  ">
																<label for=InformationProtection class="caseForm titreD backWhite">' . texte("InformationProtection") . '</label>
																<div class="flex01"></div>
																<input  class="tv  " type="text" ' . $disabled . 'value="' . $uneActiviteProtection->getInformationProtection() . '" name=InformationProtection pattern="' . $regex["*"] . '">
															</div>

															<div class="flex01">	</div>
			
													</div>
													<div class="espaceV"></div>
													<a>
														<button class="" type=\"submit\">
															<i class="fas fa-paper-plane"></i>
														</button>
													</a>
												</div>
											</div>
							</fieldset>			
						</div>
					</form>';
						
					include "PHP/VIEW/FORM/TemplateActiviteProtection.php";
				}
				?>
			</div>
			
			<div class="espaceV"></div>
		
		</div>
		<div class="marge"> </div>
		
	</div>
		<button type="button" id="BtnAddActiviteProtection">Ajouter une protection</button>

		<div class="espaceV"></div>
		


		<div class="marge">
	


	<div class="packBouton">
				<?php
				if($mode == "Afficher") {

					echo '
						<a>
							<button class="boutonA" onclick="history.back()">
								<i class="fas fa-sign-out-alt fa-rotate-180"></i>
							</button>
						</a>
							';

							if($_SESSION["utilisateur"]->getIdRole()>1){
							echo'
								<a class="boutonB" href="index.php?page=FormOperations3&mode=Modifier&id=' . $uneOperation->getIdOperation() . '">
									<i class="fas fa-pen"></i>
								</a>

								<a  class="boutonC" href="index.php?page=FormOperations3&mode=Supprimer&id=' . $uneOperation->getIdOperation() . '">
									<i class="fas fa-trash-alt"></i>
								</a>
								
							';
							}

				}else if ($mode == "Modifier" || $mode == "Supprimer" || $mode == "Ajouter") {
					echo '
					<a>
						<button class="boutonA" onclick="history.back()">
							<i class="fas fa-sign-out-alt fa-rotate-180"></i>
						</button>
					</a>
					<a>
						<button class="boutonA" type=\"submit\">
							<i class="fas fa-paper-plane"></i>
						</button>
					</a>
					';
				} 

				?>

			</div>
	</div>

</div>
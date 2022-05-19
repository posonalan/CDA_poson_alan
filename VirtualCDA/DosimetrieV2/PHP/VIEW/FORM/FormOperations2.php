<?php
/* recuperation des regex */ 
global $regex;
/* recuperation du mode */ 
$mode = $_GET['mode'];
/* initialisation de la variable a vide */ 
$disabled = " ";
/* selection du mode */ 
switch ($mode) {
	case "Afficher":
	case "Supprimer":
		/* variable permettant de bloquer les interactions avec le contenu */ 
		$disabled = " disabled ";
		break;
}
/* si il y a un id */ 
if (isset($_GET['id'])) {
	$id = $_GET['id'];
	$uneOperation = OperationsVuesManager::findById($id);
} else {
	/* sinon on crée un nouvelle objet */ 
	$uneOperation = new Operations();
}
/* si le mode est different de Ajouter */ 
 if ($mode != "Ajouter") {
	 /* si le la dosimetrie est >0 on met la valeur sinon on met 0 */ 
	$Dosimetrie =  $uneOperation->getDosimetrieOperation()>0?$uneOperation->getDosimetrieOperation():0; 
	
 }
echo '
<a name="haut"></a>
<div class="colonne">
       ';  /*Formulaire d'operation */   echo'
  	<form class="toto" action="index.php?page=ActionOperations&mode=' . $_GET['mode'] . '" method="post" enctype="multipart/form-data"/>
	  ';  /*Id de l'operation cachée */   echo'
  		<input type="hidden" value="' . $uneOperation->getIdOperation() . '" name="IdOperation" pattern="">
			<div class="espace5"></div>
			';
			/* Si le mode est different d'ajout */ 
			if ($mode != "Ajouter") {
				echo '<div class="noDisplay"><input type="text" value="' . $uneOperation->getIdOperation() . '" name="IdOperation" pattern="" ></div>';
			} else  {
				echo '<div class=" titreForm alignement">' . $mode . ' une operation</div>';
			}
			
			echo'
			<div>
			<div class="flex05"></div>
			
			<div class="flex01"></div>
			<div class="titreForm ">' . $uneOperation->getLibelleOperation() . '</div>
			<div class="flex01"></div>
			
			<div class="flex05"></div>
			</div>

			<div class="espace1"></div>

			<div>
				<div class="flex01"></div>';
				if ($mode != "Ajouter") {
				echo'
				<fieldset>
					<legend for=DonneeOp class="caseForm  backWhite " >
						<a  class="" >Données</a>
					</legend>
					<div class="colonne">
						<div class="espace"></div>
						
						<div class="inputRayonnement">
							<div class="flex01"></div>
							<div class="flex1 caseForm  backWhite">Effectif : </div>
							<div class="flex01"></div>
							<div class="backWhite flex05">'.$uneOperation->getEffectifOperation().'</div>
							
							<div class="flex05"></div>
							<div class="flex1 caseForm  backWhite">Temps prévu : </div>
							<div class="flex01"></div>
							<div class="backWhite flex05">'.$uneOperation->getTempsOperation().'</div>
							
							<div class="flex01"></div>
							<div class=" flex01 caseForm  backWhite">H</div>
							<div class="flex05"></div>
							<div class="flex1 caseForm  backWhite">Dosimétrie moyenne : </div>
							<div class="flex01"></div>
							<div class="backWhite flex05">'.$Dosimetrie .'</div>
							
							<div class="flex01"></div>
						</div>

						<div class="espace2"></div>
					</div>
				</fieldset>';
				}
				echo'
				<div class="flex01"></div>
			</div>
           ';
			?>

		<!-- Contenu du formulaire ************************************************-->
		<div class="ContenuForm">

			<div class="marge"></div>

			<!-- Centre formulaire************************************************-->
			<div class="CentreForm">

				<div class="espace2"></div>

				<div class="Partie2Form">

					<div class="hautForm">

						<?php
						/* Si un ajout ou une modif */ 
						if ($mode == "Ajouter" || $mode == "Modifier" )
						{
							echo '
								<div class="">
									<div class="flex01"></div>'; 
									 if($_SESSION["utilisateur"]->getIdRole()>1){
										/*Libelle Operation */  
										echo'<label for=LibelleOperation class="caseForm flex05 backWhite">' . texte("LibelleOperation") . " : ". '</label>
											<div class="flex01"></div>
											<div class="backWhite">
												<input type="text" ' . $disabled . 'value="' . $uneOperation->getLibelleOperation() .'" name=LibelleOperation pattern="' . $regex["*"] . '">
											</div>';
										}
										echo'<div class="flex05"></div>';
										  /*Libelle du chantier */  
										echo'<label for=IdChantier class="caseForm  flex05 backWhite">' . texte("LibelleChantier") . " :" . '</label>
											<div class="flex01"></div>';
											if($_SESSION["utilisateur"]->getIdRole()>1){
											echo'<div class="caseForm donneeForm backWhite" >'.creerSelect($uneOperation->getIdChantier(), "Chantiers", ["LibelleChantier"],null,null,null,"Choisir un chantier") .'</div>'; 
											}else{
											echo'<div class="caseForm donneeForm backWhite" >'.creerSelect($uneOperation->getIdChantier(), "Chantiers", ["LibelleChantier"],$disabled,null,null,"Choisir un chantier") .'</div>'; 
											}
											echo'
											<div class="flex01"></div>		
								</div>	
					</div>';
						}
						?>
				</div>	
				
				<div class="espace2"></div>
				<!-- Partie Photo ************************************************-->
					<div class="Partie1Form">

					<div class="imgForm">
						<?php
						/* Si affichage */ 
						if ($mode == "Afficher" ) {
							echo '<img src="./IMG/' . $uneOperation->getPhotoOperation() . '" />';
							echo '<input type="hidden" name="AnciennePhotos" value="' . $uneOperation->getPhotoOperation() . '" pattern="">';
						} else if ($mode == "Ajouter" || $mode == "Modifier" ) {
							echo '<div class=" blockPhoto">
									<img src="./IMG/' . $uneOperation->getPhotoOperation() . '" />
									<div class="espace1"></div>
									<div class="caseForm">
										<input type="hidden" name="AnciennePhotos" id="toto" value="' . $uneOperation->getPhotoOperation() . '" pattern="(.*)"/>
										<input type="file" name="Photos" ' . $disabled . ' pattern=""/>
									</div>
								 </div>
								';
						}
						?>
					</div>

				</div>


				<div class="espace2"></div>
                   	<!-- *******************Partie Description / information ********************-->
				<div class="Partie3Form">

					<?php
					if ($mode == "Afficher") {
					echo '
						<div class="taille45 colonne">
							<label for=DescriptionOperation class="caseForm  backWhite">' . texte("Description") . " :" . '</label>
							<div class="espace1"></div>
							<div class=" textForm scrollbar " id="style-7">' . $uneOperation->getDescriptionOperation() . '
								<div class="force-overflow">
								</div>
							</div>
						</div>
								
						<div class=" taille45 colonne">
							<label for=InformationOperation class="caseForm  backWhite">' . texte("Information") ." : ". '</label>
							<div class="scroll4 scroll">
								<div class="contenutx tv >' . $uneOperation->getInformationOperation() . '</div>
							</div>
						</div>
						';
					} 
							
					else if ($mode == "Ajouter" || $mode == "Modifier") {

					echo '
					<div class=" taille35 colonne ">
						<label for=DescriptionOperation class="caseForm flex01 backWhite">' . texte("Description") ." : ". '</label>
						<div class="flex01"></div>
						<div class=" scroll4 scroll">
							<textarea  class="tv contenutx " type="textarea"  name=DescriptionOperation pattern="' . $regex["*"] . '">' . $uneOperation->getDescriptionOperation() . '</textarea>
						</div>
					</div>
					
					<div class="flex01"></div>

					<div class=" taille35 colonne">
						<label for=InformationOperation class="caseForm flex01 backWhite">' . texte("Information") ." : ". '</label>
						<div class="flex01"></div>
						<div class="scroll4 scroll ">
							<textarea  class="tv contenutx" type="textarea" name=InformationOperation pattern="' . $regex["*"] . '">' . $uneOperation->getInformationOperation() . '</textarea>
						</div>
					</div>
					';
					}
					?>
					
				</div>
				<div class="espace2"></div>
				  	<!-- ********* Bouton Valider ***********-->
				<div>
					<div class="flex05"></div>
					<a>
						<button class="" type="submit">
							<i class="fas fa-paper-plane"></i>
						</button>
					</a>
					<div class="flex05"></div>
				</div>
				<div class="espace2"></div>
			</div>	
		
  	<!-- ************ Bouton retour **************-->
			<div class="marge">
				<div class="packBouton">
						<a  href="index.php?page=ListeOperations2">
							<div class="boutonA boutonDeco backWhite align">
								<i class="fas fa-sign-out-alt fa-rotate-180"></i>
							</div>
						</a>
				</div>
			</div>
		</div>
	</form>
    <?php
	if ($mode != "Ajouter") {
	
	?>
	<!-- /********************** Formulaire d'Activité ************************************/ -->
	
	<div  class="backBlue">
		<div class="marge backBlue"> </div>
		<div class="Partie4Form colonne " id="AddActivite">
			
			<?php
			echo'
			<div class="titreFont packActivite">
				<div class="align">Liste des activités de l\'operation :</div>
			</div>';
				/* on va chercher les données d'activitésVues suivant l'idOperation selectionnée */ 
			 $listeActivite = ActivitesVuesManager::getList(null,['IdOperation'=>$uneOperation->getIdOperation()]);
			foreach ($listeActivite as $keyActivite => $uneActivite) {
			
				 /* si le la dosimetrie est >0 on met la valeur sinon on met 0 */ 
				$DosimetrieActivite =  $uneActivite->getDosimetrieActivite()>0?$uneActivite->getDosimetrieActivite():0; 
				/*Formulaire Activite : enctype="multipart/form-data" = telechargement de fichier dans le formulaire  */   echo'
			<form  action="index.php?page=ActionActivites&mode=' . $mode . '" method="POST" class="activites colonne" name="" enctype="multipart/form-data">
					';  /*  identifiants caché d'operation et d'activite  */   echo'
				<input name= "IdOperation" value="' . $uneOperation->getIdOperation() . '" type= "hidden" pattern="">
				<input name= "IdActivite" value="' . $uneActivite->getIdActivite() . '" type= "hidden" pattern="">
				<a name="IdActivite'.$uneActivite->getIdActivite() . '"></a>

				<div class="CentreForm backBlue">
				<div class="espace1 packActivite"></div>
				<div class="espace1 backBlue"></div>
					<fieldset class="colonne packActivite">
						<legend for=LibelleActivite class="LegActivite caseForm" >
							<a class="pliable" >' . $uneActivite->getLibelleActivite() . '</a>
						</legend>
							'; /*  input activite caché pour blocker la modification  */   echo'
					 	<div class=" divPliable">
							<input name= "LibelleActivite" value="' . $uneActivite->getLibelleActivite() . '" type= "hidden">
							<div>
								<div class="colonne">
									<div class="contenuActivite">
										<div class="contenuA1">
											<div class="imgFormA">';
												/* Gestion de la photo */ 
												if ($mode == "Afficher" || $mode == "Supprimer") {
													echo '<img src="./IMG/' . $uneActivite->getPhotoActivite() . '" />';
													echo '<input type="hidden" name="AnciennePhotos" value="' . $uneActivite->getPhotoActivite() . '" pattern="">';
												} else if ($mode == "Ajouter" || $mode == "Modifier") {
													echo '	<div class=" blockPhoto">
																<img src="./IMG/' . $uneActivite->getPhotoActivite() . '" />
																<div class="espace1"></div>
																';
																if($_SESSION["utilisateur"]->getIdRole()>1){
																	echo'
																	<div class="caseForm">
																		<input type="hidden" name="AnciennePhotos" value="' . $uneActivite->getPhotoActivite() . '" pattern=""/>
																		<input type="file" name="Photos" ' . $disabled . ' pattern=""/>
																	</div>
																	';
																} echo'
															</div>';
															}echo'
											</div>
										</div>
										<div class="flex01"></div>
										<div class="contenuA2">
										';  /* Dosimetrie Activite   */   echo'
											<div class="  ">
												<label for=DosimetrieActivite class="caseForm align titreFontLittle backWhite">' . texte("DosimetrieActivite") ." : ". '</label>
													<div class="flex01"></div>
													<div>
														<div class=" backWhite inputCorrect alignGauche">'.$DosimetrieActivite . '</div>
														<div class="flex01"></div>
														<div class="caseForm align titreFontLittle backWhite">mSv</div>
													</div>
											</div>
											<div class="flex05"></div>
											';  /* Effectif Activite   */   echo'
											<div class="  ">
												<label for=EffectifActivite class="caseForm align titreFontLittle backWhite">' . texte("EffectifActivite") ." : ". '</label>
												<div class="flex01"></div>
													<div class=" ">';
													if($_SESSION["utilisateur"]->getIdRole()>1){
														echo'<input  class="backWhite align" type="text" value="' . $uneActivite->getEffectifActivite() . '" name=EffectifActivite pattern="' . $regex["*"] . '">';
													}else{
														echo'<input  class="backWhite align" type="text" disabled value="' . $uneActivite->getEffectifActivite() . '" name=EffectifActivite pattern="' . $regex["*"] . '">';
													}
													echo'
													</div>
											</div>	

											<div class="flex05"></div>
											';  /* Temps Activite   */   echo'
											<div class="  ">
												<label for=TempsActivite class="caseForm align titreFontLittle backWhite">' . texte("TempsActivite") ." : ". '</label>
													<div class="flex01"></div>
													<div class=" ">';
													if($_SESSION["utilisateur"]->getIdRole()>1){
														echo'<input  class="backWhite" type="text" value="' . $uneActivite->getTempsActivite() . '" name=TempsActivite pattern="' . $regex["*"] . '">';
													}else{
														echo'<input  class="backWhite" type="text" disabled value="' . $uneActivite->getTempsActivite() . '" name=TempsActivite pattern="' . $regex["*"] . '">';
													}
													echo'
														</div>
											</div>	

											<div class="flex05"></div>
											';  /* Localisation de l' Activite   */   echo'
											<div class="  ">
												<label for=LibelleBatiment class="caseForm align titreFontLittle backWhite">' . texte("LibelleBatiment") ." : ". '</label>
												<div class="flex01"></div>
												<div class=" ">
												';  /* on selectionne le batiment par son libelle   */
												if($_SESSION["utilisateur"]->getIdRole()>1){
												echo'<div class=" " >'.creerSelect($uneActivite->getIdBatiment(),"Batiments",["LibelleBatiment"]).'</div>';
												}else{
												echo'<div class=" " >'.creerSelect($uneActivite->getIdBatiment(),"Batiments",["LibelleBatiment"],$disabled). '</div>';
												}
												echo'
												</div>
											</div>
										</div>
										<div class="flex01"></div>	
									</div>

									<div class="espace1"></div>
													
									<div class="">
									';  /* Description Activite   */   echo'
										<div class=" colonne  ">
											<label for=DescriptionActivite class="caseForm  titreFontLittle backWhite">' . texte("Description") ." : " . '</label>
											<div class="flex01"></div>
											<div class="scroll4 scroll ">';
											/* seul l'admin peut interagir avec le contenu */ 
											if($_SESSION["utilisateur"]->getIdRole()>1){
												echo'<textarea  class="contenutx tv taille15" type="textarea" name=DescriptionActivite >' . $uneActivite->getDescriptionActivite() . '</textarea>';
											}else{
												echo'<textarea  class="contenutx tv taille15" type="textarea" name=DescriptionActivite disabled >' . $uneActivite->getDescriptionActivite() . '</textarea>';
											}
											echo'
											</div>
										</div>

										<div class="flex01"></div>
										';  /* Risque de l' Activite   */   echo'
										<div class=" colonne  ">
											<label for=Risque class="caseForm  backWhite">' . texte("Risque") ." : ". '</label>
											<div class="flex01"></div>
											<div class="scroll4 scroll ">';
											/* seul l'admin peut interagir avec le contenu */ 
											if($_SESSION["utilisateur"]->getIdRole()>1){
												echo'<textarea  class="contenutx tv taille15" type="textarea" name=Risque >' . $uneActivite->getRisque() . '</textarea>';
											}else{
												echo'<textarea  class="contenutx tv taille15" type="textarea" disabled name=Risque >' . $uneActivite->getRisque() . '</textarea>'; 
											}
											echo'
												</div>
										</div>

										<div class="flex01"></div>
										';  /* Parade aux risques Activite   */   echo'
										<div class="colonne">
											<label for=Parade class="caseForm  backWhite">' . texte("Parade") ." : ". '</label>
											<div class="flex01"></div>
											<div class="scroll4 scroll ">';
											/* seul l'admin peut interagir avec le contenu */ 
											if($_SESSION["utilisateur"]->getIdRole()>1){
												echo'<textarea  class="contenutx tv taille15" type="textarea" name="Parade" >' . $uneActivite->getParade() . '</textarea>';
											}else{
												echo'<textarea  class="contenutx tv taille15" type="textarea" disabled "name=Parade" >' . $uneActivite->getParade() . '</textarea>'; 
											}
											echo'
											</div>
										</div>
																	
									</div>
									<div class="espace2"></div>
									<div>
										<div class="flex05"></div>	';
										if($_SESSION["utilisateur"]->getIdRole()>1){
										/*  Bouton valider   */  
										echo'<a>
												<button class="" type="submit">
													<i class="fas fa-paper-plane"></i>
												</button>
											</a>
											<div class="flex05"></div>'; 
										 /*  Bouton Supprimer   */   
										echo'<a href="index.php?page=ActionActivites&mode=Supprimer&IdActivite='. $uneActivite->getIdActivite().'">
												<button class="" type="button">
													<i class="fas fa-cross"></i>
												</button>
											</a>';
										}
										echo'
										<div class="flex05"></div>
									</div>
									<div class="espace1"></div>
								</div>
							</div>
					</div>
					</fieldset>			
				</div>
			</form>	';
				
			?>
			<!-- /********************** Formulaire de Protection ************************************/ -->

		<div id="AddActiviteProtection" class="colonne ">
			<div class="espace packActivite"></div>
			<div class="marge packActivite"></div>
			<div class="Partie5Form colonne ">
				<?php
				echo'<div>
						<div class="flex05 packActivite"> </div>
						<div class=" packProtection">
							<div class=" titreFont">Protections de l\'activité : </div>
							';  /*  idActivite caché   */   echo'
							<input name= "IdActivite" value="' . $uneActivite->getIdActivite() . '" type= "hidden">
						</div>
						<div class="flex05 packActivite"> </div>
					</div>';
						/* on va chercher les données de protection */ 																	
					 $listeProtection = ActivitesProtectionsManager::getList(null,['IdActivite'=>$uneActivite->getIdActivite()]);
					foreach ($listeProtection as $keyProtection => $uneProtection) {
						 /* Formulaire de protection */
					echo'<form  action="index.php?page=ActionActivites_Protections&mode=Supprimer" method="POST" class="protection colonne" name="" enctype="multipart/form-data">';
					 	  /* Identifiant caché */ 
					echo'<input name= "IdActivite" value="' . $uneActivite->getIdActivite() . '" type= "hidden" pattern="">
						<input name= "IdActiviteProtection" value="' . $uneProtection->getIdActiviteProtection() . '" type= "hidden" pattern="">
						<input name= "IdOperation" value="' . $uneOperation->getIdOperation() . '" type= "hidden" pattern="">
						<a name="IdProtection'.$uneProtection->getIdProtection() . '"></a>

						<div class="CentreForm">
						
							<div class=" packActivite">
								<fieldset class="colonne packProtection">
									<legend for=LibelleProtection class=" LegProtection caseForm    " > 
										<a class="pliable" >' . $uneProtection->getLibelleProtection() . '</a>
									</legend>
									<div class=" divPliable">
										';  /* toutes les données de protections sont modifiable que dans la section protection */   echo'
										<input name= "LibelleProtection" value="' . $uneProtection->getLibelleProtection() . '" type= "hidden">
										<div>
											<div class="colonne">
												<div class="contenuProtection">
													<div class="flex01"></div>
													<div class="contenuA1">
														<div class="imgFormA">';
															if ($mode == "Afficher" || $mode == "Supprimer") {
															echo '<img src="./IMG/' . $uneProtection->getPhotoProtection() . '" />';
															echo '<input type="hidden" name="AnciennePhotos" value="' . $uneProtection->getPhotoProtection() . '" pattern="">';
															} else if ($mode == "Ajouter" || $mode == "Modifier") {
															echo '<div class=" blockPhoto">
																	<img src="./IMG/' . $uneProtection->getPhotoProtection() . '" />
																	<input type="hidden" name="AnciennePhotos" value="' . $uneProtection->getPhotoProtection() . '" pattern=""/>
																</div>';
																	}echo'
														</div>
													</div>

													<div class="flex01"></div>

													<div class="colonne">
														<div class=""></div>
														<div>
															<label for=DosimetrieProtection class="caseForm  backWhite">' . texte("DosimetrieProtection") ." : ". '</label>
															<div class="flex01"></div>
															<input  class="tv backWhite flex01" type="text" disabled value="' . $uneProtection->getDosimetrieProtection() . '" name=DosimetrieProtection pattern="' . $regex["*"] . '">
															<div class="flex01"></div>
															<div class="caseForm align titreFontLittle backWhite">mSv</div>
														</div>
														<div class=""></div>		
													</div>

													<div class="flex01"></div>	
												</div>
			
												<div class="espace01"></div>
						
												<div class="">
													<div class="flex01"></div>
													<div class=" colonne  ">
														<label for=DescriptionProtection class=" caseForm backWhite">' . texte("Description") . '</label>
														<div class="espace1"></div>
															<div class="scroll4 scroll ">
																<textarea  class="contenutx tv taille15" type="textarea" disabled name=InformationProtection >' . $uneProtection->getDescriptionProtection() . '</textarea>
															</div>
													</div>
			
													<div class="  flex01"></div>
			
													<div class=" colonne">
														<label for=InformationProtection class=" caseForm backWhite">' . texte("InformationProtection") . '</label>
														<div class="espace1"></div>
														<div class="scroll4 scroll ">
															<textarea  class="contenutx tv taille15" type="textarea" name=InformationProtection disabled >'. $uneProtection->getInformationProtection() . '</textarea>
														</div>
													</div>
													<div class="flex01"></div>
												</div>
												<div class="espace1 packActivite"></div>
												<div>
													<div class="flex1"></div>';
														if($_SESSION["utilisateur"]->getIdRole()>1){
															echo'<a>
																	<button class="" type=\"submit\">
																		<i class="fas fa-cross"></i>
																	</button>
																</a>';
															}echo'
													<div class="flex1"></div>
												</div>
												<div class="espace1 packActivite"></div>
											</div>
										</div>
									</div>	
								</fieldset>	
							
							</div>			
							
						</div>
					</form>';
						
					}
					
					?>
				</div>
				
			</div>
			<!-- <div class="espace1 packActivite"></div>  -->
				<?php
				//  echo '<div class="colonne">'; 
				//  	echo '<div class="">test</div>'; 
				/* Selectionne une nouvelle protection */ 
				if($_SESSION["utilisateur"]->getIdRole()>1){
					echo creerSelect( null, "Protections",["idProtection","LibelleProtection"],null,["id='AddProtection'"],null,"Choisir une protection");
				}
				// echo '<div class="">test</div>'; 
				
				// 	echo '<div class="packActivite"></div>'; 
				//  echo "</div>"; 
					}
					
				?>
		</div>
		
		<div class="marge backBlue"> </div>

	</div>
	

	<div class="espace2"></div>
	<?php
		echo '<div class=" ">
				<div class="backBlue "></div>';
				
				echo'<div >';
				/*  Bouton ajouter une activité   */   
					if($_SESSION["utilisateur"]->getIdRole()>1){
					echo'<button type="button" class="boutonDeco" id="BtnAddActivite">Ajouter une activité</button>';
					}
					echo'<button type="button" class="boutonDeco" ><a href="#haut">Retour haut</a></button>';
				
					echo'
				</div>';
				
				echo'<div class="backBlue"></div>';
				
			echo'</div>'; 
			
					/* le template activite */ 
					include "PHP/VIEW/FORM/TemplateActivite.php";
					
				}	
	?>
	
	<div class="espace2"></div>

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

					<a class="boutonB" href="index.php?page=FormOperations2&mode=Modifier&id=' . $uneOperation->getIdOperation() . '">
					 	<i class="fas fa-pen"></i>
					</a>
						
					<a class="boutonC" href="index.php?page=FormOperations2&mode=Supprimer&id=' . $uneOperation->getIdOperation() . '">
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
			} 
			?>	
		</div>
	</div>
</div>
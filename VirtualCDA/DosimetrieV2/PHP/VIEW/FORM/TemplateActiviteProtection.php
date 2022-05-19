
<!-- Model de nouvelle activité  -->
<template id="NewActiviteProtection">
	<div class="ContProtTemp">
		<?php
		echo'
		';  /* Template de formulaire d'activite   */   echo'
		<form  action="index.php?page=ActionActivitesProtections&mode=Ajouter" method="POST" class="protection colonne" name="" enctype="multipart/form-data">
					';  /* Id caché   */   echo'
				<input name= "IdActivite" id="AddIdOperation" value="" type= "hidden" pattern="">
				<input name= "IdActiviteProtection" value="" type= "hidden" pattern="">

				<div class="CentreForm">
					<fieldset class="colonne">
						<legend for=LibelleProtection class="caseForm titreD backWhite " >
							<a aria-expanded="true" class="aPourAccess" ></a>
						</legend>
						<input name= "LibelleProtection" value="" type= "hidden">
										
									<div>
										<div class="colonne">
											<div class="contenuProtection">
												<div class="contenuA1">
													<div class="imgFormA">';
										
														if ($mode == "Afficher" || $mode == "Supprimer") {

														echo '<img src="" />';
														echo '<input type="hidden" name="AnciennePhotos" value="" pattern="">
															';
														} else if ($mode == "Ajouter" || $mode == "Modifier") {

														echo '<div class=" blockPhoto">
																	<img src="" />
																	<div class="caseForm">
																		<input type="hidden" name="AnciennePhotos" value="" pattern=""/>
																		<input type="file" name="Photos" ' . $disabled . ' pattern=""/>
																	</div>
																</div>';
														}
												echo'</div>
												</div>
												<div class="flex01"></div>
												<div class="contenuA2">
												
													<div class="  ">
														<label for=DosimetrieProtection class="  backWhite">' . texte("DosimetrieProtection") . '</label>
														<div class="flex01">
														</div>
														<div class=" backWhite">
														<input  class="tv  " type="text" ' . $disabled . 'value="" name=DosimetrieProtection pattern="' . $regex["*"] . '">
														</div>
													</div>

												</div>
												<div class="flex01"></div>	
											</div>

											<div class="espaceV"></div>
												
										
											<div class="">

													<div class=" colonne  ">
														<label for=DescriptionProtection class="caseForm titreD backWhite">' . texte("DescriptionProtection") . '</label>
														<div class="flex01"></div>
														<input  class="tv  " type="text" ' . $disabled . 'value="" name=DescriptionProtection pattern="' . $regex["*"] . '">
													</div>

													<div class="flex01"></div>

													<div class=" colonne  ">
														<label for=InformationProtection class="caseForm titreD backWhite">' . texte("InformationProtection") . '</label>
														<div class="flex01"></div>
														<input  class="tv  " type="text" ' . $disabled . 'value="" name=InformationProtection pattern="' . $regex["*"] . '">
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
			</form>
						
		';
		?>
	</div>

</template>
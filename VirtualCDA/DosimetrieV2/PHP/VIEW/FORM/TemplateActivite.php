<template id="NewActivite">
	<div class="ContActiTemp">
		<?php
		echo'
		<form class="formAct" action="index.php?page=ActionActivites&mode=Ajouter" method="POST" class="activites colonne" name="" enctype="multipart/form-data">
			<input name= "IdOperation" id="AddIdOperation" value="" type= "hidden" pattern="">
			<input name= "IdActivite" value="" type= "hidden" pattern="">
			<div class="CentreForm backBlue">
				<div class="espace1 packActivite"></div>
				<div class="espace1 backBlue"></div>
				<fieldset class="colonne packActivite">
					<legend for=LibelleActivite class="LegActivite caseForm">
						<a></a>
					</legend>
					<input name= "LibelleActivite" value="" type= "hidden">
					<div>
						<div class="colonne">
							<div class="contenuActivite">
								<div class="contenuA1">
									<div class="imgFormA">';
										if ($mode == "Afficher" || $mode == "Supprimer") {
											echo '<img />';
											echo '<input type="hidden" name="AnciennePhotos" value="" pattern="">';
										} else if ($mode == "Ajouter" || $mode == "Modifier") {
											echo '<div class=" blockPhoto">
													<img  />
													<div class="caseForm">
														<input type="hidden" name="AnciennePhotos" value="" pattern=""/>
														<input type="file" name="Photos" ' . $disabled . ' pattern=""/>
													</div>
												</div>';
										}echo'
									</div>
								</div>
								<div class="flex01"></div>
								<div class="contenuA2">
									<div class="  ">
										<label for=LibelleActivite class="caseForm align titreFontLittle backWhite">' . texte("LibelleActivite") ." : ". '</label>
										<div class="flex01"></div>
										<div class=" ">
											<input  class="  backWhite" type="text" ' . $disabled . 'value="" name=LibelleActivite pattern="' . $regex["*"] . '">
										</div>
									</div>

									<div class="flex02"></div>
									<div class="  ">
										<label for=EffectifActivite class="caseForm align titreFontLittle backWhite">' . texte("EffectifActivite") ." : ". '</label>
										<div class="flex01"></div>
										<div class=" ">
											<input  class="  backWhite" type="text" ' . $disabled . 'value="" name=EffectifActivite pattern="' . $regex["*"] . '">
										</div>
									</div>	

									<div class="flex02"></div>
									<div class="  ">
										<label for=TempsActivite class="caseForm align titreFontLittle backWhite">' . texte("TempsActivite") ." : ". '</label>
										<div class="flex01"></div>
										<div class=" ">
											<input  class="backWhite" type="text" ' . $disabled . 'value="" name=TempsActivite pattern="' . $regex["*"] . '">
										</div>
									</div>	

									<div class="flex02"></div>
									<div class="  ">
										<label for=LibelleBatiment class="flex05 caseForm align titreFontLittle backWhite">' . texte("LibelleBatiment") ." : ". '</label>
										<div class="flex01"></div>
											<div class="caseForm  donneeForm flex02" >'.creerSelect(null,"Batiments",["LibelleBatiment"]).'</div>
									</div>

								</div>
								<div class="flex01"></div>	
															
							</div>
							<div class="espace1"></div>
							'; /* partie basse (description/risque/parade) */ echo'
							
							<div>
								

								<div class="">
									<div class="colonne">
										<label for=DescriptionProtection class="caseForm  titreFontLittle backWhite">' . texte("Description") ." : ". '</label>
										<div class="espace1"></div>
										<textarea  class="contenutx tv taille15" type="textarea"  name="InformationProtection" ></textarea>
									</div>
									<div class="flex01"></div>
									
									<div class="colonne">
										<label for=Risque class="caseForm  titreFontLittle backWhite">' . texte("Risque") ." : ". '</label>
										<div class="espace1"></div>
										<textarea  class="contenutx tv taille15" type="textarea"  name="Risque" ></textarea>
									</div>
									<div class="flex01"></div>

									
									<div class="colonne">
										<label for=Parade class="caseForm  titreFontLittle backWhite">' . texte("Parade") ." : ". '</label>
										<div class="espace1"></div>
										<textarea  class="contenutx tv taille15" type="textarea"  name="Parade" ></textarea>
									</div>
								</div>		
							</div>
						</div>
					
					</fieldset>
					<div>		
							<a>
								<button class="" type="submit">
									<i class="fas fa-paper-plane"></i>
								</button>
							</a>
						</div>
			</div>	
		</form>			
		';
		?>
	</div>
</template>
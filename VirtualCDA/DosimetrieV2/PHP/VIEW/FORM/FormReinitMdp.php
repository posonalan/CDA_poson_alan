<?php
global $regex;


if (isset($_GET['id'])) {
	$elm = UtilisateursManager::findById($_GET['id']);

echo '<div class="espace5"></div>'; 
echo '<main class="center">';
echo '<form class="GridForm" action="index.php?page=ActionUtilisateurs&mode=ChangePwd" method="POST"/>';
echo '<div class="espace5"></div>'; 
echo '<div class="caseForm titreForm col-span-form">Nouveau mot de passe : </div>';
echo '<div class="espace5"></div>'; 
echo '<div class="espace5"></div>'; 
echo '<div class="espace5"></div>'; 
echo '<div class="espace5"></div>'; 
echo '<div class="noDisplay">
		<input type="text" value="'.$elm->getIdUtilisateur().'" name="IdUtilisateur" >
	</div>';

echo '<label for=ReinitMdp class="caseForm labelForm fondLabel">'.texte("ReinitMdp").'</label>';
echo '<div class="caseForm donneeForm">
		<input type="text" value="" name="MotDePasse" pattern="'.$regex["pwd"].'">
	</div>';

echo '<div class="caseForm infoForm"></div>';
echo '<div class="caseForm checkForm"></div>';
echo '<div class="espace5"></div>'; 
echo '<div class="caseForm col-span-form">
	<div></div>
	<div>
		<a href="index.php?page=ListeUtilisateurs">
			<button type="button">
				<i class="fas fa-sign-out-alt fa-rotate-180"></i>
			</button>
		</a>
	</div>
	<div class="flex-0-1"></div>';
	echo '<div class="caseListe"> <button type="submit" href="index.php?page=ActionUtilisateurs&mode=ChangePwd"><i class="fas fa-edit"></i></button></div>';
echo'<div></div>
	</div>';

echo'</form>';

echo '</main>';
echo '<div class="espace5"></div>';
 echo '<div class="espace5"></div>'; 
}
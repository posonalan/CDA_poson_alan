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
	$elm = PostesEntreprisesManager::findById($_GET['id']);
} else {
	$elm = new PostesEntreprises();
}
echo '<div class="espace5"></div>'; 
echo '<main class="center">';
echo '<form class="GridForm" action="index.php?page=ActionPostesEntreprises&mode='.$_GET['mode'].'" method="post"/>';
echo '<div class="espace5"></div>'; 
echo '<div class="caseForm titreForm col-span-form">Formulaire Poste en Entreprise : </div>';
echo '<div class="espace5"></div>'; 
echo '<div class="espace5"></div>'; 
echo '<div class="espace5"></div>'; 
echo '<div class="espace5"></div>'; 
echo '<div class="noDisplay"><input type="hidden" value="'.$elm->getIdPosteEntreprise().'" name=IdPosteEntreprise></div>';

echo '<label for=LibellePosteEntreprise class="caseForm labelForm fondLabel">'.texte("LibellePosteEntreprise").'</label>';
echo '<div class="caseForm donneeForm"><input type="text" '.$disabled .'value="'.$elm->getLibellePosteEntreprise().'" name=LibellePosteEntreprise pattern="'.$regex["*"].'"></div>';

echo '<div class="caseForm infoForm"></div>';
echo '<div class="caseForm checkForm"></div>';
echo '<div class="espace5"></div>'; 
echo '<div class="caseForm col-span-form">
	<div></div>
	<div><a href="index.php?page=ListePostesEntreprises"><button type="button"><i class="fas fa-sign-out-alt fa-rotate-180"></i></button></a></div>
	<div class="flex-0-1"></div>';
	echo ($mode == "Afficher") ? "" : " <div><button type=\"submit\"><i class=\"fas fa-paper-plane\"></i></button></div>";
	echo'<div></div>
	</div>';

echo'</form>';

echo '</main>';
echo '<div class="espace5"></div>';
 echo '<div class="espace5"></div>'; 
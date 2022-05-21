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
	$elm = EnjeuxRadiologiquesManager::findById($_GET['id']);
} else {
	$elm = new EnjeuxRadiologiques();
}
echo '<main class="center">';

echo '<form class="GridForm" action="index.php?page=ActionEnjeuxRadiologiques&mode='.$_GET['mode'].'" method="post"/>';

echo '<div class="caseForm titreForm col-span-form">Formulaire EnjeuxRadiologiques</div>';
	echo '<div class="noDisplay"><input type="hidden" value="'.$elm->getIdEnjeuRadio().'" name=IdEnjeuRadio></div>';
echo '<label for=LibelleEnjeuRadio class="caseForm labelForm">'.texte("LibelleEnjeuRadio").'</label>';
echo '<div class="caseForm donneeForm"><input type="text" '.$disabled .'value="'.$elm->getLibelleEnjeuRadio().'" name=LibelleEnjeuRadio pattern="'.$regex["*"].'"></div>';
echo '<div class="caseForm infoForm"><i class="fas fa-question-circle"></i></div>';
echo '<div class="caseForm checkForm"><i class="fas fa-check-circle"></i></div>';

echo '<div class="caseForm col-span-form">
	<div></div>
	<div><a href="index.php?page=ListeEnjeuxRadiologiques"><button type="button"><i class="fas fa-sign-out-alt fa-rotate-180"></i></button></a></div>
	<div class="flex-0-1"></div>';
	echo ($mode == "Afficher") ? "" : " <div><button type=\"submit\"><i class=\"fas fa-paper-plane\"></i></button></div>";
	echo'<div></div>
	</div>';

echo'</form>';

echo '</main>';
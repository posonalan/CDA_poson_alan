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
	$elm = UtilisateursManager::findById($_GET['id']);
} else {
	$elm = new Utilisateurs();
}
echo '<main class="center">';

echo '<form class="GridForm" action="index.php?page=ActionUtilisateurs&mode='.$_GET['mode'].'" method="post"/>';

echo '<div class=" titreForm col-span-form">Formulaire Utilisateurs</div>';
	echo '<div class="noDisplay"><input type="hidden" value="'.$elm->getIdUtilisateur().'" name=IdUtilisateur></div>';
echo '<label for=Nom class=" labelForm">'.texte("Nom").'</label>';
echo '<div class=" donneeForm"><input type="text" '.$disabled .'value="'.$elm->getNom().'" name=Nom pattern="'.$regex["*"].'"></div>';
echo '<div class=" infoForm"><i class="fas fa-question-circle"></i></div>';
echo '<div class=" checkForm"><i class="fas fa-check-circle"></i></div>';

echo '<label for=Prenom class=" labelForm">'.texte("Prenom").'</label>';
echo '<div class=" donneeForm"><input type="text" '.$disabled .'value="'.$elm->getPrenom().'" name=Prenom pattern="'.$regex["*"].'"></div>';
echo '<div class=" infoForm"><i class="fas fa-question-circle"></i></div>';
echo '<div class=" checkForm"><i class="fas fa-check-circle"></i></div>';

echo '<label for=AdresseMail class=" labelForm">'.texte("AdresseMail").'</label>';
echo '<div class=" donneeForm"><input type="text" '.$disabled .'value="'.$elm->getAdresseMail().'" name=AdresseMail pattern="'.$regex["*"].'"></div>';
echo '<div class=" infoForm"><i class="fas fa-question-circle"></i></div>';
echo '<div class=" checkForm"><i class="fas fa-check-circle"></i></div>';

echo '<label for=MotDePasse class=" labelForm">'.texte("MotDePasse").'</label>';
echo '<div class=" donneeForm"><input type="text" '.$disabled .'value="'.$elm->getMotDePasse().'" name=MotDePasse pattern="'.$regex["*"].'"></div>';
echo '<div class=" infoForm"><i class="fas fa-question-circle"></i></div>';
echo '<div class=" checkForm"><i class="fas fa-check-circle"></i></div>';

echo '<label for=Role class=" labelForm">'.texte("Role").'</label>';
echo '<div class=" donneeForm"><input type="text" '.$disabled .'value="'.$elm->getRole().'" name=Role pattern="'.$regex["*"].'"></div>';
echo '<div class=" infoForm"><i class="fas fa-question-circle"></i></div>';
echo '<div class=" checkForm"><i class="fas fa-check-circle"></i></div>';

echo '<div class=" col-span-form">
	<div></div>
	<div><a href="index.php?page=ListeUtilisateurs"><button type="button"><i class="fas fa-sign-out-alt fa-rotate-180"></i></button></a></div>
	<div class="flex-0-1"></div>';
	echo ($mode == "Afficher") ? "" : " <div><button type=\"submit\"><i class=\"fas fa-paper-plane\"></i></button></div>";
	echo'<div></div>
	</div>';

echo'</form>';

echo '</main>';
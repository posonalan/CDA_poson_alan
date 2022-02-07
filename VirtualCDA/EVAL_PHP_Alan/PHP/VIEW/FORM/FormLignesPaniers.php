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
	$elm = LignesPaniersManager::findById($_GET['id']);
} else {
	$elm = new LignesPaniers();
}
echo '<main class="center">';

echo '<form class="GridForm" action="index.php?page=ActionLignesPaniers&mode='.$_GET['mode'].'" method="post"/>';

echo '<div class=" titreForm col-span-form">Formulaire LignesPaniers</div>';
	echo '<div class="noDisplay"><input type="hidden" value="'.$elm->getIdLignePanier().'" name=IdLignePanier></div>';
echo '<label for=IdArticle class=" labelForm">'.texte("IdArticle").'</label>';
echo '<div class=" donneeForm"><input type="text" '.$disabled .'value="'.$elm->getIdArticle().'" name=IdArticle pattern="'.$regex["*"].'"></div>';
echo '<div class=" infoForm"><i class="fas fa-question-circle"></i></div>';
echo '<div class=" checkForm"><i class="fas fa-check-circle"></i></div>';

echo '<label for=IdPanier class=" labelForm">'.texte("IdPanier").'</label>';
echo '<div class=" donneeForm"><input type="text" '.$disabled .'value="'.$elm->getIdPanier().'" name=IdPanier pattern="'.$regex["*"].'"></div>';
echo '<div class=" infoForm"><i class="fas fa-question-circle"></i></div>';
echo '<div class=" checkForm"><i class="fas fa-check-circle"></i></div>';

echo '<label for=Quantite class=" labelForm">'.texte("Quantite").'</label>';
echo '<div class=" donneeForm"><input type="text" '.$disabled .'value="'.$elm->getQuantite().'" name=Quantite pattern="'.$regex["*"].'"></div>';
echo '<div class=" infoForm"><i class="fas fa-question-circle"></i></div>';
echo '<div class=" checkForm"><i class="fas fa-check-circle"></i></div>';

echo '<div class=" col-span-form">
	<div></div>
	<div><a href="index.php?page=ListeLignesPaniers"><button type="button"><i class="fas fa-sign-out-alt fa-rotate-180"></i></button></a></div>
	<div class="flex-0-1"></div>';
	echo ($mode == "Afficher") ? "" : " <div><button type=\"submit\"><i class=\"fas fa-paper-plane\"></i></button></div>";
	echo'<div></div>
	</div>';

echo'</form>';

echo '</main>';
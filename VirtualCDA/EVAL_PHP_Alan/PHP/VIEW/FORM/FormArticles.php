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
	$elm = ArticlesManager::findById($_GET['id']);
} else {
	$elm = new Articles();
}
echo '<main class="center">';

echo '<form class="GridForm" action="index.php?page=ActionArticles&mode='.$_GET['mode'].'" method="post"/>';

echo '<div class=" titreForm col-span-form">Formulaire Articles</div>';
	echo '<div class="noDisplay"><input type="hidden" value="'.$elm->getIdArticle().'" name=IdArticle></div>';
echo '<label for=LibelleArticle class=" labelForm">'.texte("LibelleArticle").'</label>';
echo '<div class=" donneeForm"><input type="text" '.$disabled .'value="'.$elm->getLibelleArticle().'" name=LibelleArticle pattern="'.$regex["*"].'"></div>';
echo '<div class=" infoForm"><i class="fas fa-question-circle"></i></div>';
echo '<div class=" checkForm"><i class="fas fa-check-circle"></i></div>';

echo '<label for=DescriptionArticle class=" labelForm">'.texte("DescriptionArticle").'</label>';
echo '<div class=" donneeForm"><input type="text" '.$disabled .'value="'.$elm->getDescriptionArticle().'" name=DescriptionArticle pattern="'.$regex["*"].'"></div>';
echo '<div class=" infoForm"><i class="fas fa-question-circle"></i></div>';
echo '<div class=" checkForm"><i class="fas fa-check-circle"></i></div>';

echo '<label for=PrixArticle class="labelForm">'.texte("PrixArticle").'</label>';
echo '<div class=" donneeForm"><input type="text" '.$disabled .'value="'.$elm->getPrixArticle().'" name=PrixArticle pattern="'.$regex["*"].'"></div>';
echo '<div class=" infoForm"><i class="fas fa-question-circle"></i></div>';
echo '<div class=" checkForm"><i class="fas fa-check-circle"></i></div>';

echo '<label for=Photos class=" labelForm">'.texte("Photos").'</label>';
echo '<div class=" donneeForm"><input type="file"
id="photos" name="photos"
accept="image/png, image/jpeg"></div>';
echo '<div class=" infoForm"><i class="fas fa-question-circle"></i></div>';
echo '<div class=" checkForm"><i class="fas fa-check-circle"></i></div>';


echo '<div class=" col-span-form">
	<div></div>
	<div><a href="index.php?page=ListeArticles"><button type="button"><i class="fas fa-sign-out-alt fa-rotate-180"></i></button></a></div>
	<div class="flex-0-1"></div>';
	echo ($mode == "Afficher") ? "" : " <div><button type=\"submit\"><i class=\"fas fa-paper-plane\"></i></button></div>";

	echo'<div>
	</div>';


echo'</form>';

echo '</main>';
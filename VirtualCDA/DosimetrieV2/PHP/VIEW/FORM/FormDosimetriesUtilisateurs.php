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
	$elm = DosimetriesUtilisateursManager::findById($_GET['id']);
} else {
	$elm = new DosimetriesUtilisateurs();
}


echo '<div class="espaceV"></div>'; 
echo '<main class="center ">';

echo '<form class="GridForm" action="index.php?page=ActionDosimetriesUtilisateurs&mode='.$_GET['mode'].'" method="post"/>';

echo '<div class="caseForm titreForm col-span-form">Formulaire DosimetriesUtilisateurs</div>';
	echo '<div class="noDisplay"><input type="hidden" value="'.$elm->getIdDosimetrieUtilisateur().'" name=IdDosimetrieUtilisateur></div>';
echo '<label for=DateIntervention class="caseForm labelForm backWhite">'.texte("DateIntervention").'</label>';
echo '<div class="caseForm donneeForm"><input type="date" '.$disabled .'value="'.$elm->getDateIntervention().'" name=DateIntervention pattern="'.$regex["date"].'"></div>';
echo '<div class="infoForm"></div>';
echo '<div class="checkForm"></div>';

echo '<label for=TempsIntervention class="caseForm labelForm backWhite">'.texte("TempsIntervention").'</label>';
echo '<div class="casreFom donneeForm"><input type="text" '.$disabled .'value="'.$elm->getTempsIntervention().'" name=TempsIntervention pattern="'.$regex["num"].'"></div>';
echo '<div class=" infoForm"></div>';
echo '<div class=" checkForm"></div>';

echo '<label for=DosimetrieUtilisateur class="caseForm labelForm backWhite">'.texte("DosimetrieUtilisateur").'</label>';
echo '<div class="caseForm donneeForm"><input type="text" '.$disabled .'value="'.$elm->getDosimetrieUtilisateur().'" name=DosimetrieUtilisateur pattern="'.$regex["dose"].'"></div>';
echo '<div class="infoForm"></div>';
echo '<div class="checkForm"></div>';


echo '<label for=IdActivite class="caseForm labelForm backWhite">'.texte("IdActivite").'</label>';
echo '<div class="caseForm  donneeForm" '.$disabled.' >'.creerSelect($elm->getIdActivite(),"Activites",["LibelleActivite"]).'</div>';
echo '<div class=" infoForm"></div>';
echo '<div class=" checkForm"></div>';


// echo '<label for=IdUtilisateur class="caseForm labelForm backWhite">'.texte("IdUtilisateur").'</label>';
echo '<div class=" donneeForm"><input type="hidden" '.$disabled .'value="'.$_SESSION["utilisateur"]->getIdUtilisateur().'" name=IdUtilisateur pattern="'.$regex["num"].'"></div>';
echo '<div class=" infoForm"></div>';
echo '<div class=" checkForm"></div>';

echo '<div class="caseForm col-span-form">
	<div></div>
	<div><a href="index.php?page=ListeDosimetriesUtilisateurs"><button type="button"><i class="fas fa-sign-out-alt fa-rotate-180"></i></button></a></div>
	<div class="flex-0-1"></div>';
	echo ($mode == "Afficher") ? "" : " <div><button type=\"submit\"><i class=\"fas fa-paper-plane\"></i></button></div>";
	echo'<div></div>
	</div>';

echo'</form>';

echo '
</main>
<div class="espaceFin">
</div>';
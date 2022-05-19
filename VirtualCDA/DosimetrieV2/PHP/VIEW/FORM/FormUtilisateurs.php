<?php 
/* initié les données regex */ 
global $regex;
/* captation du mode */ 
$mode = $_GET['mode'];
/* par defaut rien n'est masqué */ 
$disabled = " ";
switch ($mode) {
	case "Afficher":
		/* on passe les input en masqué */ 
	case "Supprimer":
		$disabled = " disabled ";
		break;
}
/* on recupere les données par rapport a l'id */ 
if (isset($_GET['id'])) {
	$elm = UtilisateursManager::findById($_GET['id']);
} else {
	/* si pas d'id on crée un nouveau */ 
	$elm = new Utilisateurs();
}

echo '<main class="center">';
/* formulaire utilisateur */ 
echo '<form class="GridForm" action="index.php?page=ActionUtilisateurs&mode='.$_GET['mode'].'" method="post"/>';
/* on cache l'identifiant utilisateur */ 
echo '<div class="caseForm titreForm col-span-form ">Formulaire Utilisateurs</div>';
echo '<div class="noDisplay"><input type="hidden" value="'.$elm->getIdUtilisateur().'" name=IdUtilisateur></div>';
/* Nom utilisateur */ 
echo '<label for=Nom class="caseForm labelForm fondLabel">'.texte("Nom").'</label>';
echo '<div class="caseForm donneeForm  fondLabel"><input type="text" '.$disabled .'value="'.$elm->getNom().'" name=Nom pattern="'.$regex["alpha"].'"></div>';
echo '<div class="caseForm infoForm"></div>';
echo '<div class="caseForm checkForm"></div>';

echo '<label for=Prenom class="caseForm labelForm fondLabel">'.texte("Prenom").'</label>';
echo '<div class="caseForm donneeForm fondLabel"><input type="text" '.$disabled .'value="'.$elm->getPrenom().'" name=Prenom pattern="'.$regex["alpha"].'"></div>';
echo '<div class="caseForm infoForm"></div>';
echo '<div class="caseForm checkForm"></div>';

echo '<label for=AdresseMail class="caseForm labelForm fondLabel">'.texte("AdresseMail").'</label>';
echo '<div class="caseForm donneeForm fondLabel"><input type="text" '.$disabled .'value="'.$elm->getAdresseMail().'" name=AdresseMail pattern="'.$regex["email"].'"></div>';
echo '<div class="caseForm infoForm"></div>';
echo '<div class="caseForm checkForm"></div>';
if ($mode=="Ajouter"){
echo '<label for=MotDePasse class="caseForm labelForm fondLabel">'.texte("MotDePasse").'</label>';
echo '<div class="caseForm donneeForm fondLabel"><input type="text" '.$disabled .'value="'.$elm->getMotDePasse().'" name=MotDePasse pattern="'.$regex["*"].'"></div>';
echo '<div class="caseForm infoForm"></div>';
echo '<div class="caseForm checkForm"></div>';
}
echo '<label for=TelUtilisateur class="caseForm labelForm fondLabel">'.texte("TelUtilisateur").'</label>';
echo '<div class="caseForm donneeForm fondLabel"><input type="text" '.$disabled .'value="'.$elm->getTelUtilisateur().'" name=TelUtilisateur pattern="'.$regex["tel"].'"></div>';
echo '<div class="caseForm infoForm"></div>';
echo '<div class="caseForm checkForm"></div>';

echo '<label for=DosimetrieAvantActivite class="caseForm labelForm fondLabel">'.texte("DosimetrieAvantActivite").'</label>';
echo '<div class="caseForm donneeForm fondLabel"><input type="text" '.$disabled .'value="'.$elm->getDosimetrieAvantActivite().'" name=DosimetrieAvantActivite pattern="'.$regex["dose"].'"></div>';
echo '<div class="caseForm infoForm"></div>';
echo '<div class="caseForm checkForm"></div>';

echo '<label for=DosimetrieApresActivite class="caseForm labelForm fondLabel">'.texte("DosimetrieApresActivite").'</label>';
echo '<div class="caseForm donneeForm fondLabel"><input type="text" '.$disabled .'value="'.$elm->getDosimetrieApresActivite().'" name=DosimetrieApresActivite pattern="'.$regex["dose"].'"></div>';
echo '<div class="caseForm infoForm"></div>';
echo '<div class="caseForm checkForm"></div>';

echo '<label for=DateReleveDosimetrique class="caseForm labelForm fondLabel">'.texte("DateReleveDosimetrique").'</label>';
echo '<div class="caseForm donneeForm fondLabel"><input type="date" '.$disabled .'value="'.$elm->getDateReleveDosimetrique().'" name=DateReleveDosimetrique pattern="'.$regex["*"].'"></div>';
echo '<div class="caseForm infoForm"></div>';
echo '<div class="caseForm checkForm"></div>';

echo '<label for=IdRole class="caseForm labelForm fondLabel">'.texte("IdRole").'</label>';
echo '<div class="caseForm  donneeForm " >'.creerSelect($elm->getIdRole(),"Roles",["LibelleRole"]).'</div>';
echo '<div class="caseForm infoForm"></div>';
echo '<div class="caseForm checkForm"></div>';

echo '<label for=IdPosteEntreprise class="caseForm labelForm fondLabel">'.texte("IdPosteEntreprise").'</label>';
echo '<div class="caseForm  donneeForm " >'.creerSelect($elm->getIdPosteEntreprise(),"PostesEntreprises",["LibellePosteEntreprise"]).'</div>';
echo '<div class="caseForm infoForm"></div>';
echo '<div class="caseForm checkForm"></div>';
echo '<div></div>
<div><a href="index.php?page=FormPostesEntreprises&mode=Ajouter"><button type="button">Crée un nouveau poste</button></a></div>
<div></div>
<div></div>'; 

echo '<label for=IdEntreprise class="caseForm labelForm fondLabel">'.texte("IdEntreprise").'</label>';
echo '<div class="caseForm  donneeForm " >'.creerSelect($elm->getIdEntreprise(),"Entreprises",["LibelleEntreprise"]).'</div>';
echo '<div class="caseForm infoForm"></div>';
echo '<div class="caseForm checkForm"></div>';
echo '<div></div>
<div><a href="index.php?page=FormEntreprises&mode=Ajouter"><button type="button">Crée une nouvelle entreprise</button></a></div>
<div></div>
<div></div>'; 

echo '<div class="caseForm col-span-form">
	<div></div>
	<div><a href="index.php?page=ListeUtilisateurs"><button type="button"><i class="fas fa-sign-out-alt fa-rotate-180"></i></button></a></div>
	<div class="flex-0-1"></div>';
	echo ($mode == "Afficher") ? "" : " <div><button type=\"submit\"><i class=\"fas fa-paper-plane\"></i></button></div>";
	echo'<div></div>
	</div>';

echo'</form>';

echo '</main>';
echo '<div class="espaceV"></div>'; 
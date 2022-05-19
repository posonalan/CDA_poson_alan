<?php

/* initialisation du fichier outils */ 
include "./PHP/CONTROLLER/Outils.php";
include "./PHP/MODEL/OutilsModels.php";
/* initialisation de la fonction charger class */ 
spl_autoload_register("ChargerClasse");
/* initialisation du fichier de parametre */ 
Parametres::init();
/* initialisation du fichier de connexion BDD */ 
DbConnect::init();
/* ouverture de la session */ 
session_start();

/******Les langues******/
/***On récupère la langue***/
if (isset($_GET['lang']) && TextesManager::checkIfLangExist($_GET['lang'])) {
	// tester si la langue est gérée
	$_SESSION['lang'] = $_GET['lang'];
} /* sinon on prend la langue du cookie */  
else if (isset($_COOKIE['lang'])) {
	$_SESSION['lang'] = $_COOKIE['lang'];
} /* sinon on met la langue par defaut FR */ 
else {
	$_SESSION['lang'] = 'FR';
}

//Crée un cookie lang sur la machine de l'utilisateur d'une durée precise .
setcookie("lang", $_SESSION['lang'], time() + 36000, '/');
/******Fin des langues******/

$routes = [
					/* chemin			/ nom 		/ titre / roleRequis / api */ 
	"Default" => ["PHP/VIEW/FORM/", "FormConnexion", "Connexion", 0, false],
	"Inscription" => ["PHP/VIEW/FORM/", "FormInscription", "Inscription", 0, false],
	"Accueil" => ["PHP/VIEW/GENERAL/", "Accueil", "Accueil", 0, false],
	"Localisation" => ["PHP/VIEW/GENERAL/", "Localisation", "Localisation", 1, false],

	"ActionConnexion" => ["PHP/CONTROLLER/ACTION/", "ActionConnexion", "Action de la connexion", 0, false],
	"ActionInscription" => ["PHP/CONTROLLER/ACTION/", "ActionInscription", "Action de l'inscription", 0, false],
	"ActionDeconnexion" => ["PHP/CONTROLLER/ACTION/", "ActionDeconnexion", "Action de deconnexion", 0, false],

	"ListeMailAPI" => ["PHP/MODEL/API/", "ListeMailAPI", "ListeMailAPI", 2, true],

	"ListeActivites" => ["PHP/VIEW/LISTE/", "ListeActivites", "Liste Activites", 0, false],
	"ListeActivites2" => ["PHP/VIEW/LISTE/", "ListeActivites2", "Liste Activites", 0, false],
	"FormActivites" => ["PHP/VIEW/FORM/", "FormActivites", "Formulaire Activites", 0, false],
	"ActionActivites" => ["PHP/CONTROLLER/ACTION/", "ActionActivites", "Action Activites", 0, false],

	"ListeActivites_Protections" => ["PHP/VIEW/LISTE/", "ListeActivites_Protections", "Liste Activites_Protections", 2, false],
	"FormActivites_Protections" => ["PHP/VIEW/FORM/", "FormActivites_Protections", "Formulaire Activites_Protections", 2, false],
	"ActionActivites_Protections" => ["PHP/CONTROLLER/ACTION/", "ActionActivites_Protections", "Action Activites_Protections", 0, false],

	"ListeBatiments" => ["PHP/VIEW/LISTE/", "ListeBatiments", "Liste Batiments", 0, false],
	"ListeBatiments2" => ["PHP/VIEW/LISTE/", "ListeBatiments2", "Liste Batiments", 0, false],
	"FormBatiments" => ["PHP/VIEW/FORM/", "FormBatiments", "Formulaire Batiments", 0, false],
	"FormBatiments2" => ["PHP/VIEW/FORM/", "FormBatiments2", "Formulaire Batiments", 0, false],
	"ActionBatiments" => ["PHP/CONTROLLER/ACTION/", "ActionBatiments", "Action Batiments", 0, false],

	"ListeChantiers" => ["PHP/VIEW/LISTE/", "ListeChantiers", "Liste Chantiers", 0, false],
	"FormChantiers" => ["PHP/VIEW/FORM/", "FormChantiers", "Formulaire Chantiers", 0, false],
	"ActionChantiers" => ["PHP/CONTROLLER/ACTION/", "ActionChantiers", "Action Chantiers", 0, false],

	"ListeChantiers2" => ["PHP/VIEW/LISTE/", "ListeChantiers2", "Liste Chantiers 2", 0, false],
	"FormChantiers2" => ["PHP/VIEW/FORM/", "FormChantiers", "Formulaire Chantiers", 0, false],
	"ActionChantiers2" => ["PHP/CONTROLLER/ACTION/", "ActionChantiers", "Action Chantiers", 0, false],

	"ListeDosimetriesUtilisateurs" => ["PHP/VIEW/LISTE/", "ListeDosimetriesUtilisateurs", "Liste DosimetriesUtilisateurs", 0, false],
	"FormDosimetriesUtilisateurs" => ["PHP/VIEW/FORM/", "FormDosimetriesUtilisateurs", "Formulaire DosimetriesUtilisateurs", 0, false],
	"ActionDosimetriesUtilisateurs" => ["PHP/CONTROLLER/ACTION/", "ActionDosimetriesUtilisateurs", "Action DosimetriesUtilisateurs", 0, false],

	"ListeEnjeuxRadiologiques" => ["PHP/VIEW/LISTE/", "ListeEnjeuxRadiologiques", "Liste EnjeuxRadiologiques", 2, false],
	"FormEnjeuxRadiologiques" => ["PHP/VIEW/FORM/", "FormEnjeuxRadiologiques", "Formulaire EnjeuxRadiologiques", 2, false],
	"ActionEnjeuxRadiologiques" => ["PHP/CONTROLLER/ACTION/", "ActionEnjeuxRadiologiques", "Action EnjeuxRadiologiques", 0, false],

	"ListeEntreprises" => ["PHP/VIEW/LISTE/", "ListeEntreprises", "Liste Entreprises", 2, false],
	"FormEntreprises" => ["PHP/VIEW/FORM/", "FormEntreprises", "Formulaire Entreprises", 2, false],
	"ActionEntreprises" => ["PHP/CONTROLLER/ACTION/", "ActionEntreprises", "Action Entreprises", 0, false],

	"ListeOperations" => ["PHP/VIEW/LISTE/", "ListeOperations", "Liste Operations", 0, false],
	"FormOperations" => ["PHP/VIEW/FORM/", "FormOperations", "Formulaire Operations", 0, false],
	"ActionOperations" => ["PHP/CONTROLLER/ACTION/", "ActionOperations", "Action Operations", 0, false],

	"ListeOperations2" => ["PHP/VIEW/LISTE/", "ListeOperations2", "Liste Chantiers", 0, false],
	"FormOperations2" => ["PHP/VIEW/FORM/", "FormOperations2", "Formulaire Chantiers", 0, false],
	"FormOperations3" => ["PHP/VIEW/FORM/", "FormOperations3", "Formulaire Chantiers", 0, false],


	"ActionOperation_Activite" => ["PHP/CONTROLLER/ACTION/", "ActionOperation_Activite", "Action Chantiers", 0, false],

	"ListeOperations_Utilisateurs" => ["PHP/VIEW/LISTE/", "ListeOperations_Utilisateurs", "Liste Operations_Utilisateurs", 0, false],
	"FormOperations_Utilisateurs" => ["PHP/VIEW/FORM/", "FormOperations_Utilisateurs", "Formulaire Operations_Utilisateurs", 0, false],
	"ActionOperations_Utilisateurs" => ["PHP/CONTROLLER/ACTION/", "ActionOperations_Utilisateurs", "Action Operations_Utilisateurs", 0, false],

	"ListePostesEntreprises" => ["PHP/VIEW/LISTE/", "ListePostesEntreprises", "Liste PostesEntreprises", 0, false],
	"FormPostesEntreprises" => ["PHP/VIEW/FORM/", "FormPostesEntreprises", "Formulaire PostesEntreprises", 0, false],
	"ActionPostesEntreprises" => ["PHP/CONTROLLER/ACTION/", "ActionPostesEntreprises", "Action PostesEntreprises", 0, false],

	"ListeProtections" => ["PHP/VIEW/LISTE/", "ListeProtections", "Liste Protections", 0, false],
	"FormProtections" => ["PHP/VIEW/FORM/", "FormProtections", "Formulaire Protections", 0, false],
	"ActionProtections" => ["PHP/CONTROLLER/ACTION/", "ActionProtections", "Action Protections", 0, false],

	"ListeProtections2" => ["PHP/VIEW/LISTE/", "ListeProtections2", "Liste Protection 2", 0, false],
	"FormProtections2" => ["PHP/VIEW/FORM/", "FormProtection2", "Formulaire Chantiers", 0, false],
	"FormProtectionsModif" => ["PHP/VIEW/FORM/", "FormProtectionsModif", "Formulaire modification chantier", 0, false],
	"ActionProtections2" => ["PHP/CONTROLLER/ACTION/", "ActionProtection2", "Action Chantiers", 0, false],


	"ListeRoles" => ["PHP/VIEW/LISTE/", "ListeRoles", "Liste Roles", 0, false],
	"FormRoles" => ["PHP/VIEW/FORM/", "FormRoles", "Formulaire Roles", 0, false],
	"ActionRoles" => ["PHP/CONTROLLER/ACTION/", "ActionRoles", "Action Roles", 0, false],

	"ListeTranches" => ["PHP/VIEW/LISTE/", "ListeTranches", "Liste Tranches", 0, false],
	"ListeTranches2" => ["PHP/VIEW/LISTE/", "ListeTranches2", "Liste Tranches 2", 0, false],
	"FormTranches" => ["PHP/VIEW/FORM/", "FormTranches", "Formulaire Tranches", 0, false],
	"ActionTranches" => ["PHP/CONTROLLER/ACTION/", "ActionTranches", "Action Tranches", 0, false],

	"ListeUtilisateurs" => ["PHP/VIEW/LISTE/", "ListeUtilisateurs", "Liste Utilisateurs", 0, false],
	"ListeUtilisateurs2" => ["PHP/VIEW/LISTE/", "ListeUtilisateurs2", "Liste Utilisateurs", 0, false],
	"FormUtilisateurs" => ["PHP/VIEW/FORM/", "FormUtilisateurs", "Formulaire Utilisateurs", 0, false],
	"ActionUtilisateurs" => ["PHP/CONTROLLER/ACTION/", "ActionUtilisateurs", "Action Utilisateurs", 0, false],

	"FormReinitMdp" => ["PHP/VIEW/FORM/", "FormReinitMdp", "reinitialisation mot de passe", 0, false],

];

/* navigation page */ 
if (isset($_GET["page"])) {
	$page = $_GET["page"];
	if (isset($routes[$page])) { AfficherPage($routes[$page]); } 
	else {AfficherPage($routes["Default"]);}
} else {/* si probleme on renvoi sur la page par defaut */ 
		AfficherPage($routes["Default"]);}

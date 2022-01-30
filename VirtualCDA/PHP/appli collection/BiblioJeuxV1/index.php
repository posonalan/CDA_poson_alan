<?php

include "./PHP/CONTROLLER/Outils.php";

spl_autoload_register("ChargerClasse");

Parametres::init();

DbConnect::init();

session_start();

/******Les langues******/
/***On récupère la langue***/
if (isset($_GET['lang']) && TextesManager::checkIfLangExist($_GET['lang'])) {
	 // tester si la langue est gérée
	$_SESSION['lang'] = $_GET['lang'];
}else if (isset($_COOKIE['lang'])) {
	$_SESSION['lang'] = $_COOKIE['lang'];
}else{
	$_SESSION['lang'] = 'FR';
}
//Crée un cookie lang sur la machine de l'utilisateur d'une durée de 10h.
setcookie("lang", $_SESSION['lang'], time()+36000, '/');
/******Fin des langues******/

$routes=[
	"Default"=>["PHP/VIEW/FORM/","FormInscriptionConnexion","Connexion & Inscription",0,false],
	"Accueil"=>["PHP/VIEW/GENERAL/","Accueil","Accueil",0,false],

	"ActionConnexion"=>["PHP/CONTROLLER/ACTION/","ActionConnexion","Action de la connexion",0,false],
	"ActionInscription"=>["PHP/CONTROLLER/ACTION/","ActionInscription","Action de l'inscription",0,false],
	"ActionDeconnexion"=>["PHP/CONTROLLER/ACTION/","ActionDeconnexion","Action de deconnexion",0,false],

	"ListeMailAPI"=>["PHP/MODEL/API/","ListeMailAPI", "ListeMailAPI",0,true],

	"ListeAccessoires"=>["PHP/VIEW/LISTE/","ListeAccessoires","Liste Accessoires",0,false],
	"FormAccessoires"=>["PHP/VIEW/FORM/","FormAccessoires","Formulaire Accessoires",0,false],
	"ActionAccessoires"=>["PHP/CONTROLLER/ACTION/","ActionAccessoires","Action Accessoires",0,false],

	"ListeConsoles"=>["PHP/VIEW/LISTE/","ListeConsoles","Liste Consoles",0,false],
	"FormConsoles"=>["PHP/VIEW/FORM/","FormConsoles","Formulaire Consoles",0,false],
	"ActionConsoles"=>["PHP/CONTROLLER/ACTION/","ActionConsoles","Action Consoles",0,false],

	"ListeConsoles_Utilisateurs"=>["PHP/VIEW/LISTE/","ListeConsoles_Utilisateurs","Liste Consoles_Utilisateurs",0,false],
	"FormConsoles_Utilisateurs"=>["PHP/VIEW/FORM/","FormConsoles_Utilisateurs","Formulaire Consoles_Utilisateurs",0,false],
	"ActionConsoles_Utilisateurs"=>["PHP/CONTROLLER/ACTION/","ActionConsoles_Utilisateurs","Action Consoles_Utilisateurs",0,false],

	"ListeConsolesAccessoires"=>["PHP/VIEW/LISTE/","ListeConsolesAccessoires","Liste ConsolesAccessoires",0,false],
	"FormConsolesAccessoires"=>["PHP/VIEW/FORM/","FormConsolesAccessoires","Formulaire ConsolesAccessoires",0,false],
	"ActionConsolesAccessoires"=>["PHP/CONTROLLER/ACTION/","ActionConsolesAccessoires","Action ConsolesAccessoires",0,false],

	"ListeConsolesJeux"=>["PHP/VIEW/LISTE/","ListeConsolesJeux","Liste ConsolesJeux",0,false],
	"FormConsolesJeux"=>["PHP/VIEW/FORM/","FormConsolesJeux","Formulaire ConsolesJeux",0,false],
	"ActionConsolesJeux"=>["PHP/CONTROLLER/ACTION/","ActionConsolesJeux","Action ConsolesJeux",0,false],

	"ListeJeux"=>["PHP/VIEW/LISTE/","ListeJeux","Liste Jeux",0,false],
	"FormJeux"=>["PHP/VIEW/FORM/","FormJeux","Formulaire Jeux",0,false],
	"ActionJeux"=>["PHP/CONTROLLER/ACTION/","ActionJeux","Action Jeux",0,false],

	"ListeJeux_Utilisateurs"=>["PHP/VIEW/LISTE/","ListeJeux_Utilisateurs","Liste Jeux_Utilisateurs",0,false],
	"FormJeux_Utilisateurs"=>["PHP/VIEW/FORM/","FormJeux_Utilisateurs","Formulaire Jeux_Utilisateurs",0,false],
	"ActionJeux_Utilisateurs"=>["PHP/CONTROLLER/ACTION/","ActionJeux_Utilisateurs","Action Jeux_Utilisateurs",0,false],

	"ListeMarques"=>["PHP/VIEW/LISTE/","ListeMarques","Liste Marques",0,false],
	"FormMarques"=>["PHP/VIEW/FORM/","FormMarques","Formulaire Marques",0,false],
	"ActionMarques"=>["PHP/CONTROLLER/ACTION/","ActionMarques","Action Marques",0,false],

	"ListePhotoCollections"=>["PHP/VIEW/LISTE/","ListePhotoCollections","Liste PhotoCollections",0,false],
	"FormPhotoCollections"=>["PHP/VIEW/FORM/","FormPhotoCollections","Formulaire PhotoCollections",0,false],
	"ActionPhotoCollections"=>["PHP/CONTROLLER/ACTION/","ActionPhotoCollections","Action PhotoCollections",0,false],

	"ListeProfiles"=>["PHP/VIEW/LISTE/","ListeProfiles","Liste Profiles",0,false],
	"FormProfiles"=>["PHP/VIEW/FORM/","FormProfiles","Formulaire Profiles",0,false],
	"ActionProfiles"=>["PHP/CONTROLLER/ACTION/","ActionProfiles","Action Profiles",0,false],

	"ListeUtilisateurs"=>["PHP/VIEW/LISTE/","ListeUtilisateurs","Liste Utilisateurs",0,false],
	"FormUtilisateurs"=>["PHP/VIEW/FORM/","FormUtilisateurs","Formulaire Utilisateurs",0,false],
	"ActionUtilisateurs"=>["PHP/CONTROLLER/ACTION/","ActionUtilisateurs","Action Utilisateurs",0,false],

];

if(isset($_GET["page"]))
{

	$page=$_GET["page"];

	if(isset($routes[$page]))
	{
		AfficherPage($routes[$page]);
	}
	else
	{
		AfficherPage($routes["Default"]);
	}
}
else
{
	AfficherPage($routes["Default"]);
}
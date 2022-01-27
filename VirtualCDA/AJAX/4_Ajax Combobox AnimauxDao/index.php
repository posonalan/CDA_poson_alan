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
	"listeAPI"=>["PHP/MODEL/API/","ListeAPI", "ListeAPI",0,true],

	"ListeAlimentations"=>["PHP/VIEW/LISTE/","ListeAlimentations","Liste Alimentations",0,false],
	"FormAlimentations"=>["PHP/VIEW/FORM/","FormAlimentations","Formulaire Alimentations",0,false],
	"ActionAlimentations"=>["PHP/CONTROLLER/ACTION/","ActionAlimentations","Action Alimentations",0,false],

	"ListeAnimaux"=>["PHP/VIEW/LISTE/","ListeAnimaux","Liste Animaux",0,false],
	"FormAnimaux"=>["PHP/VIEW/FORM/","FormAnimaux","Formulaire Animaux",0,false],
	"ActionAnimaux"=>["PHP/CONTROLLER/ACTION/","ActionAnimaux","Action Animaux",0,false],

	"ListeMilieuvies"=>["PHP/VIEW/LISTE/","ListeMilieuvies","Liste Milieuvies",0,false],
	"FormMilieuvies"=>["PHP/VIEW/FORM/","FormMilieuvies","Formulaire Milieuvies",0,false],
	"ActionMilieuvies"=>["PHP/CONTROLLER/ACTION/","ActionMilieuvies","Action Milieuvies",0,false],

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
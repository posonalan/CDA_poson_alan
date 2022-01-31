<?php

include "./PHP/CONTROLLER/Outils.php";

spl_autoload_register("ChargerClasse");

Parametres::init();

DbConnect::init();

session_start();

/******Les langues******/
/***On récupère la langue***/
if (isset($_GET['lang']) && TexteManager::checkIfLangExist($_GET['lang'])) {
	// tester si la langue est gérée
	$_SESSION['lang'] = $_GET['lang'];
} else if (isset($_COOKIE['lang'])) {
	$_SESSION['lang'] = $_COOKIE['lang'];
} else {
	$_SESSION['lang'] = 'FR';
}
//Crée un cookie lang sur la machine de l'utilisateur d'une durée de 10h.
setcookie("lang", $_SESSION['lang'], time() + 36000, '/');
/******Fin des langues******/

$routes = [

	"default" => ["PHP/VIEW/FORM/", "FormInscription", "Identification", 0, false],
	"inscription" => ["PHP/VIEW/FORM/", "FormInscription", "Identification", 0,false],
	"accueil" => ["PHP/VIEW/GENERAL/", "Accueil", "accueil", 0, false],
	"creeNav" => ["PHP/VIEW/GENERAL/", "creeNav", "accueil", 0, false],
	"connection" => ["PHP/VIEW/FORM/", "FormInscription", "Identification", 0, false],
	  "deconnection" => ["PHP/CONTROLLER/ACTION/", "ActionDeconnection", "Erreur", 0, false],

	"actionInscription" => ["PHP/CONTROLLER/ACTION/", "ActionInscription", "Identification", 0, false],
	"actionConnection" => ["PHP/CONTROLLER/ACTION/", "ActionConnection", "Identification", 0, false],

	"listeMilieuVie" => ["PHP/VIEW/LISTE/", "ListeMilieuVie", "Liste des Milieu de vie", 0, false],
	"formMilieuVie" => ["PHP/VIEW/FORM/", "FormMilieuVie", "Gestion des Milieu Vie", 0, false],
	"actionMilieuVie" => ["PHP/CONTROLLER/ACTION/", "ActionMilieuVie", "Mise à jour du Milieu Vie", 0, false],

	"listeAlimentations" => ["PHP/VIEW/LISTE/", "ListeAlimentations", "Liste des Aliments", 0, false],
	"formAlimentations" => ["PHP/VIEW/FORM/", "FormAlimentations", "Gestion des Aliments", 0, false],
	"actionAlimentations" => ["PHP/CONTROLLER/ACTION/", "ActionAlimentations", "Mise à jour du Animaux", 0, false],


	"listeAnimaux" => ["PHP/VIEW/LISTE/", "ListeAnimaux", "Liste des animaux", 0, false],
	"formAnimaux" => ["PHP/VIEW/FORM/", "FormAnimaux", "Gestion des animaux", 0, false],
	"actionAnimaux" => ["PHP/CONTROLLER/ACTION/", "ActionAnimaux", "Mise à jour animaux", 0, false],
	"footer" => ["PHP/VIEW/GENERAL/", "Footer", "Footer", 0, false]];

if (isset($_GET["page"])) {

	$page = $_GET["page"];

	if (isset($routes[$page])) {
		AfficherPage($routes[$page]);
	} else {
		AfficherPage($routes["default"]);
	}
} else {
	AfficherPage($routes["default"]);
}

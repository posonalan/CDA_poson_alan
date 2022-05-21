<?PHP

include "./PHP/CONTROLLER/Outils.php";
spl_autoload_register("ChargerClasse");

//on active la connexion à la base de données
Parametre::init();
DbConnect::init();

session_start(); // initialise la variable de Session

/***************************GESTION DES LANGUES ******************/
// on recupere la langue de l'URL
if (isset($_GET['lang'])) {
    // tester si la langue est gérée
    $_SESSION['lang'] = $_GET['lang'];
}

//on prend la langue de la session sinon FR par défaut
$lang = isset($_SESSION['lang']) ? $_SESSION['lang'] : 'FR';


/* création d'un tableau de redirection, en fonction du page, on choisit la page à afficher */
// Dossier / Nom du fichier / Titre de la page / Autorisation requise / Api ou pas 
$routes = [
    "default" => ["PHP/VIEW/FORM/", "FormConnection", "Identification", 0, false],

    "inscription" => ["PHP/VIEW/FORM/", "FormInscription", "Identification", 0, false],
    "actionInscription" => ["PHP/CONTROLLER/ACTION/", "actionInscription", "Erreur", 0, false],
    "connection" => ["PHP/VIEW/FORM/", "FormConnection", "Identification", 0, false],
    "actionConnection" => ["PHP/CONTROLLER/ACTION/", "actionConnection", "Erreur", 0, false],
    "accueil" => ["PHP/VIEW/GENERAL/", "Accueil", "Accueil", 0, false],
    "deconnection" => ["PHP/CONTROLLER/ACTION/", "Actiondeconnection", "Erreur", 0, false],

    "listeAnimaux" => ["PHP/VIEW/LISTE/", "ListeAnimaux", "Liste de Animaux", 1, false],
    "formAnimaux" => ["PHP/VIEW/FORM/", "FormAnimaux", "Détail de l'animal", 1, false],
    "actionAnimaux" => ["PHP/CONTROLLER/ACTION/", "ActionAnimaux", "Mise à jour du Animaux", 1, false],

    "listeAlimentations" => ["PHP/VIEW/LISTE/", "ListeAlimentations", "Liste des Aliments", 2, false],
    "formAlimentations" => ["PHP/VIEW/FORM/", "FormAlimentations", "Gestion des Aliments", 2, false],
    "actionAlimentations" => ["PHP/CONTROLLER/ACTION/", "ActionAlimentations", "Mise à jour du Animaux", 2, false],

    "listeMilieuVie" => ["PHP/VIEW/LISTE/", "ListeMilieuVie", "Liste des Milieu de vie", 2, false],
    "formMilieuVie" => ["PHP/VIEW/FORM/", "FormMilieuVie", "Gestion des Milieu Vie", 2, false],
    "actionMilieuVie" => ["PHP/CONTROLLER/ACTION/", "ActionMilieuVie", "Mise à jour du Milieu Vie", 2, false]


];

if (isset($_GET["page"])) {
    $page = $_GET["page"];
    //Si cette route existe dans le tableau des routes
    if (isset($routes[$page])) {
        //Afficher la page correspondante
        AfficherPage($routes[$page]);
    } else {
        //Sinon afficher la page par defaut
        AfficherPage($routes["default"]);
    }
} else {
    //Sinon afficher la page par defaut
    AfficherPage($routes["default"]);
}

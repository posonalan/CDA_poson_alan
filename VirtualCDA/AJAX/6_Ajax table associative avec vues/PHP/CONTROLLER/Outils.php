<?php
function ChargerClasse($classe)
{
	if (file_exists("PHP/CONTROLLER/CLASSE/" . $classe . ".Class.php"))
	{
		require "PHP/CONTROLLER/CLASSE/" . $classe . ".Class.php";
	}
	if (file_exists("PHP/MODEL/MANAGER/" . $classe . ".Class.php"))
	{
		require "PHP/MODEL/MANAGER/" . $classe . ".Class.php";
	}
}
spl_autoload_register("ChargerClasse");

function uri()
{
	$uri = $_SERVER['REQUEST_URI'];
	if (substr($uri, strlen($uri) - 1) == "/") // se termine par /
	{
		$uri .= "index.php?";
	}
	else if (in_array("?", str_split($uri))) // si l'uri contient deja un ?
	{
		$uri .= "&";
	}
	else
	{
		$uri .= "?";
	}
	return $uri;
}

function crypte($mot)
{
	return md5(md5($mot));
}

function texte($codeTexte)
{
	$retour=TextesManager::findByCodes($_SESSION['lang'], $codeTexte);;
	if ($retour==false) return $codeTexte;
	return $retour;
}

function afficherPage($page)
{
	$chemin=$page[0];
	$nom=$page[1];
	$titre=$page[2];
	$roleRequis = $page[3];;
	$api = $page[4];
	$roleConnecte = isset($_SESSION["utilisateur"])?$_SESSION["utilisateur"]->getRole():0;
	if  ($roleConnecte>= $roleRequis) {
		if  ($api) {
			include $chemin . $nom . '.php';
		} else {
			include 'PHP/VIEW/GENERAL/Head.php';
			include 'PHP/VIEW/GENERAL/Header.php';
			if (isset($_SESSION["utilisateur"]) && stripos($chemin,"PHP/CONTROLLER/ACTION/") !== 0)
			{
				include 'PHP/VIEW/GENERAL/Nav.php';
			}
			include $chemin . $nom . '.php'; //Chargement de la page en fonction du chemin et du nom
			include 'PHP/VIEW/GENERAL/Footer.php';
		}
	} else {
	$nom = "FormInscriptionConnexion";
		$titre = "Authorisation insuffisante";
		include 'PHP/VIEW/GENERAL/Head.php';
		include 'PHP/VIEW/GENERAL/Header.php';
		include 'PHP/VIEW/FORM/FormInscriptionConnexion.php';
		include 'PHP/VIEW/GENERAL/Footer.php';
	}
}

// A coder pour décoder les informations base de données dans le json
function decode($texte)
{
	return $texte;
}
$regex = [
	"alpha" => "[A-Za-z]{2,}-?[A-Za-z]{2,}",
	"alphaNum" => "[A-Za-z0-9]*",
	"alphaMaj" => "[A-Z]*",
	"alphaMin" => "[a-z]*",
	"num" => "[0-9]*",
	"ucFirst" => "[A-Z][a-z]+",
	"email" => "[A-Za-z]([\.\-_]?[A-Za-z0-9])+@[A-Za-z]([\.\-_]?[A-Za-z0-9])+\.[A-Za-z]{2,4}",
	"date" => "[0-3]?[0-9](\/|-)(0|1)?[0-9](\/|-)[0-9]{4}",
	"pwd" => "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,}",
	"tel" => "0[0-9]([-/. ]?[0-9]{2}){4}",
	"postal" => "[0-9]{5}",
	"*"  => "*"
];


function appelGet($obj, $chaine)
{
	$methode = 'get' . ucfirst($chaine);
	return call_user_func(array($obj, $methode));
}

/**
 * Crée un select a partir des informations passées en parametre
 *
 * @param integer $valeur => Id de l'element a Selectionner
 * 
 * @param string $table => contient Nom de la table sur laquelle la requête sera effectuée.
	 * Exemple : nomTable => "FROM nomTable"
 * 
 * @param array $nomColonnes => contient le noms des champs désirés dans la requête.
	 * Exemple :  [nomColonne1,nomColonne2] => "SELECT nomColonne1, nomColonne2"
 * 
 * @param string $attributs => attributs attendu dans la balise select
 * 
 * Exemples : <select class="filtrefiche" data-serie=3 >
 * 
 * @param array|null $condition => null par défaut, attendu un tableau associatif 
	 * qui peut prendre plusieurs formes en fonction de la complexité des conditions.
	 *
	 *  Exemples : tableau associatif
	 *  [nomColonne => '1'] => "WHERE nomColonne = 1"
	 *  [nomColonne => ['1','3']] => "WHERE nomColonne in (1,3)"
	 *  [nomColonne => '%abcd%'] => "WHERE nomColonne like "%abcd%"
	 *  [nomColonne => '1->5'] => "WHERE nomColonne BETWEEN 1 and 5 "
	 *  Si il y a plusieurs conditions alors :
	 *  [nomColonne1 => '1', nomColonne2 => '%abcd%' ] => "WHERE nomColonne1 = 1 AND nomColonne2 LIKE "%abcd%"
	 * 
 * @param string|null $orderBy $orderBy => null par défaut, contient un string qui contient les noms de colonnes et le type de tri
	 * Exemple :"nomColonne1 , nomColonne2 DESC" => "Order By nomColonne1 , nomColonne2 DESC"
	 * 
 * @return void
 */
function creerSelect(?int $valeur, string $table, array $nomColonnes, ?string $attributs = "", array $condition = null, string $orderBy = null)
{
		$nomId= $table::getAttributes()[0];
		$select = '<select id="' . $nomId . '" name="' . $nomId . '"' . $attributs . '>';
		$methode = $table . 'Manager';
		$libelle= $nomColonnes;
		array_push($nomColonnes, $nomId);
		$liste = $methode::getList($nomColonnes, $condition, $orderBy,  null);
		if ($valeur == null) {
				$select .= '<option value="" SELECTED>'.texte("inputDefault").'</option>';
		} else {
				$select .= '<option value="">'.texte("inputDefault").'</option>';
		}
		foreach ($liste as $elt) {
				$content = "";
				foreach ($libelle as $value) {
						$content .= appelGet($elt, $value) . " ";
				}
				if ($valeur == appelGet($elt, $nomId)) {
						$select .= '<option value="' . appelGet($elt, $nomId) . '" SELECTED>' . $content . '</option>';
				} else {
						$select .= '<option value="' . appelGet($elt, $nomId) . '">' . $content . '</option>';
				}
			}
		$select .= "</select>";
		return $select;
}

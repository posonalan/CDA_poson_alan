<?php
$Session = $_SESSION["utilisateur"]->getIdUtilisateur();
class TranchesManager 
{
	public static function add(Tranches $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(Tranches $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(Tranches $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(Tranches::getAttributes(),"Tranches",["IdTranche" => $id],null,null,false,false)[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?Tranches::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"Tranches",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );
	}

	/* calcule de la moyenne de tout les dosimetries par batiment */ 
	// public static function getMoyenneDosimetriqueBatiments(){

	// 	$db=DbConnect::getDb();
	// 	$q=$db->prepare("select AVG(DosimetrieBatiment) FROM batiments where IdUtilisateur = $session );
	// 	$q->execute();
	// 	$results = $q
	// 	return ($results != false); // renvoi vrai si la requete retourne des données, false sinon

	// }





}
<?php

class Jeux_utilisateursManager 
{

	public static function add(Jeux_utilisateurs $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(Jeux_utilisateurs $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(Jeux_utilisateurs $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(Jeux_utilisateurs::getAttributes(),"Jeux_utilisateurs",["idUtilisateur" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?Jeux_utilisateurs::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"Jeux_utilisateurs",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
}
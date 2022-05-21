<?php

class Jeux_UtilisateursManager 
{

	public static function add(Jeux_Utilisateurs $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(Jeux_Utilisateurs $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(Jeux_Utilisateurs $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(Jeux_Utilisateurs::getAttributes(),"Jeux_Utilisateurs",["idUtilisateur" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?Jeux_Utilisateurs::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"Jeux_Utilisateurs",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
}
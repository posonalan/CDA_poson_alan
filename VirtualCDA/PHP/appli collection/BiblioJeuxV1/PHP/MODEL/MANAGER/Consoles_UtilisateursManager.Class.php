<?php

class Consoles_UtilisateursManager 
{

	public static function add(Consoles_Utilisateurs $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(Consoles_Utilisateurs $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(Consoles_Utilisateurs $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(Consoles_Utilisateurs::getAttributes(),"Consoles_Utilisateurs",["idutilisateur" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?Consoles_Utilisateurs::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"Consoles_Utilisateurs",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
}
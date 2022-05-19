<?php

class Operations_UtilisateursManager 
{

	public static function add(Operations_Utilisateurs $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(Operations_Utilisateurs $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(Operations_Utilisateurs $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(Operations_Utilisateurs::getAttributes(),"Operations_Utilisateurs",["IdOperationUtilisateur" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?Operations_Utilisateurs::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"Operations_Utilisateurs",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
}
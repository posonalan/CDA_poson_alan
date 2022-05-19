<?php

class EntreprisesManager 
{

	public static function add(Entreprises $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(Entreprises $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(Entreprises $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(Entreprises::getAttributes(),"Entreprises",["IdEntreprise" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?Entreprises::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"Entreprises",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
}
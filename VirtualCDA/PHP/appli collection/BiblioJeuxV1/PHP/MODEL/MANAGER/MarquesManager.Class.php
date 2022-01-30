<?php

class MarquesManager 
{

	public static function add(Marques $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(Marques $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(Marques $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(Marques::getAttributes(),"Marques",["idMarque" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?Marques::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"Marques",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
}
<?php

class BatimentsManager 
{

	public static function add(Batiments $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(Batiments $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(Batiments $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(Batiments::getAttributes(),"Batiments",["IdBatiment" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?Batiments::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"Batiments",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
}
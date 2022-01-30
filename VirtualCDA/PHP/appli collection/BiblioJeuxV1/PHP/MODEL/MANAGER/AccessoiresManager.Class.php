<?php

class AccessoiresManager 
{

	public static function add(Accessoires $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(Accessoires $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(Accessoires $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(Accessoires::getAttributes(),"Accessoires",["idAccessoire" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?Accessoires::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"Accessoires",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
}
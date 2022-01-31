<?php

class ConsolesAccessoiresManager 
{

	public static function add(ConsolesAccessoires $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(ConsolesAccessoires $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(ConsolesAccessoires $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(ConsolesAccessoires::getAttributes(),"ConsolesAccessoires",["idConsoleAccessoire" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?ConsolesAccessoires::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"ConsolesAccessoires",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
}
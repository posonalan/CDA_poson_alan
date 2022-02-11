<?php

class ConsolesManager 
{

	public static function add(Consoles $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(Consoles $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(Consoles $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(Consoles::getAttributes(),"Consoles",["idConsole" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?Consoles::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"Consoles",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
}
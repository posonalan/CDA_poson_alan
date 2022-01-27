<?php

class ConsolesJeuxManager 
{

	public static function add(ConsolesJeux $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(ConsolesJeux $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(ConsolesJeux $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(ConsolesJeux::getAttributes(),"ConsolesJeux",["idConsoleJeu" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?ConsolesJeux::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"ConsolesJeux",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
}
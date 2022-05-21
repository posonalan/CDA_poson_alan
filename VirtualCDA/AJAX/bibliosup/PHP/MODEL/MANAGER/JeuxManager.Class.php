<?php

class JeuxManager 
{

	public static function add(Jeux $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(Jeux $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(Jeux $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(Jeux::getAttributes(),"Jeux",["idJeu" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?Jeux::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"Jeux",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
}
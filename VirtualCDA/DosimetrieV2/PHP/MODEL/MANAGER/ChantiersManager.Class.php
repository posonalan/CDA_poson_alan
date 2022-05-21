<?php

class ChantiersManager 
{

	public static function add(Chantiers $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(Chantiers $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(Chantiers $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(Chantiers::getAttributes(),"Chantiers",["IdChantier" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?Chantiers::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"Chantiers",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
}
<?php

class EnjeuxRadiologiquesManager 
{

	public static function add(EnjeuxRadiologiques $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(EnjeuxRadiologiques $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(EnjeuxRadiologiques $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(EnjeuxRadiologiques::getAttributes(),"EnjeuxRadiologiques",["IdEnjeuRadio" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?EnjeuxRadiologiques::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"EnjeuxRadiologiques",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
}
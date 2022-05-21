<?php

class ChantiersVuesManager 
{

	public static function add(ChantiersVues $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(ChantiersVues $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(ChantiersVues $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(ChantiersVues::getAttributes(),"ChantiersVues",["IdChantier" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?ChantiersVues::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"ChantiersVues",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
}
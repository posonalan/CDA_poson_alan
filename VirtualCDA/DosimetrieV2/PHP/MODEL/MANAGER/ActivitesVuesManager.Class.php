<?php

class ActivitesVuesManager 
{

	public static function add(ActivitesVues $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(ActivitesVues $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(ActivitesVues $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(ActivitesVues::getAttributes(),"ActivitesVues",["IdActivite" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?ActivitesVues::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"ActivitesVues",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
}
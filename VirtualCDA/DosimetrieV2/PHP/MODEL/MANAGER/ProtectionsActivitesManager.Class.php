<?php

class ProtectionsActivitesManager 
{

	public static function add(ProtectionsActivites $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(ProtectionsActivites $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(ProtectionsActivites $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(ProtectionsActivites::getAttributes(),"ProtectionsActivites",["IdActiviteProtection" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?ProtectionsActivites::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"ProtectionsActivites",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	
	}



}



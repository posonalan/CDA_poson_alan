<?php

class ActivitesProtectionsManager 
{

	public static function add(ActivitesProtections $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(ActivitesProtections $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(ActivitesProtections $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(ActivitesProtections::getAttributes(),"ActivitesProtections",["IdActiviteProtection" => $id])[0];
	}

	public static function findLastAdd()
	{
 		return DAO::select(ActivitesProtections::getAttributes(),"ActivitesProtections",null,"IdActiviteProtection desc",1,false,false)[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?ActivitesProtections::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"ActivitesProtections",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	
	}



}



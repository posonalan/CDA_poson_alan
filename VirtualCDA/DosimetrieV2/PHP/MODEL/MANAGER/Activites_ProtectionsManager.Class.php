<?php

class Activites_ProtectionsManager 
{

	public static function add(Activites_Protections $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(Activites_Protections $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(Activites_Protections $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(Activites_Protections::getAttributes(),"Activites_Protections",["IdActiviteProtection" => $id])[0];
	}
	public static function findLastAdd()
	{
 		return DAO::select(Activites_Protections::getAttributes(),"Activites_Protections",null,"IdActiviteProtection desc",1,false,false)[0];
	}
	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?Activites_Protections::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"Activites_Protections",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
}
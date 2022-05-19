<?php

class ProtectionsManager 
{

	public static function add(Protections $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(Protections $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(Protections $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(Protections::getAttributes(),"Protections",["IdProtection" => $id])[0];
	}

	public static function findLastAdd()
	{
 		return DAO::select(Protections::getAttributes(),"Protections",null,"idProtection desc",1,false,false)[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?Protections::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"Protections",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	
	}



}



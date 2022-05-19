<?php

class OperationsManager 
{

	public static function add(Operations $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(Operations $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(Operations $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(Operations::getAttributes(),"Operations",["IdOperation" => $id])[0];
	}

	public static function findLastAdd()
	{
 		return DAO::select(Operations::getAttributes(),"Operations",null,"idOperation desc",1,false,false)[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?Operations::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"Operations",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
}
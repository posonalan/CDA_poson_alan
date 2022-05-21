<?php

class TranchesVuesManager 
{

	public static function add(TranchesVues $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(TranchesVues $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(TranchesVues $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(TranchesVues::getAttributes(),"TranchesVues",["IdTranche" => $id],null,null,false,false)[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?TranchesVues::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"TranchesVues",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
}
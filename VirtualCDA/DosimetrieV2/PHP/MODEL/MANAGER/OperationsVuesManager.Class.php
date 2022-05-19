<?php

class OperationsVuesManager 
{

	public static function add(OperationsVues $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(OperationsVues $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(OperationsVues $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(OperationsVues::getAttributes(),"OperationsVues",["IdOperation" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?OperationsVues::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"OperationsVues",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
}
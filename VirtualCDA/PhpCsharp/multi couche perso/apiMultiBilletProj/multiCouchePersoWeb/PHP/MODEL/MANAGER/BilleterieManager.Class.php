<?php

class BilleterieManager 
{

	public static function add(Billeterie $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(Billeterie $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(Billeterie $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(Billeterie::getAttributes(),"Billeterie",["IdBillet" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?Billeterie::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"Billeterie",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
}
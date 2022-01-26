<?php

class PhotoCollectionsManager 
{

	public static function add(PhotoCollections $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(PhotoCollections $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(PhotoCollections $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(PhotoCollections::getAttributes(),"PhotoCollections",["IdPhotoCollection" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?PhotoCollections::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"PhotoCollections",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
}
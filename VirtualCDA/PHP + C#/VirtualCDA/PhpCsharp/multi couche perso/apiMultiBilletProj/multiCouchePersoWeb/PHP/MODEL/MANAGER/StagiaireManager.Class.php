<?php

class StagiaireManager 
{

	public static function add(Stagiaire $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(Stagiaire $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(Stagiaire $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(Stagiaire::getAttributes(),"Stagiaire",["IdStagiaire" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?Stagiaire::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"Stagiaire",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
}
<?php

class DosimetriesUtilisateursManager 
{

	public static function add(DosimetriesUtilisateurs $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(DosimetriesUtilisateurs $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(DosimetriesUtilisateurs $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(DosimetriesUtilisateurs::getAttributes(),
		 "DosimetriesUtilisateurs",["IdDosimetrieUtilisateur" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null,
	 string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?DosimetriesUtilisateurs::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"DosimetriesUtilisateurs",  
		 $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
	}


<?php

class PostesEntreprisesManager 
{

	public static function add(PostesEntreprises $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(PostesEntreprises $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(PostesEntreprises $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(PostesEntreprises::getAttributes(),"PostesEntreprises",["IdPosteEntreprise" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?PostesEntreprises::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"PostesEntreprises",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}
}
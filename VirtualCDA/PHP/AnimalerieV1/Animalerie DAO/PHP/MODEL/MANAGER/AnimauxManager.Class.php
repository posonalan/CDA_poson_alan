<?php

class AnimauxManager 
{

	public static function add(Animaux $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(Animaux $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(Animaux $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(Animaux::getAttributes(),"Animaux",["idAnimal" => $id])[0];
	}

	public static function getList()
	{
 		return DAO::select(Animaux::getAttributes(),"Animaux");
	}
}
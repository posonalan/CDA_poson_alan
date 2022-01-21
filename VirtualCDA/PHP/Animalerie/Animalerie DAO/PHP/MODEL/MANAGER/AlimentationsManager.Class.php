<?php

class AlimentationsManager 
{

	public static function add(Alimentations $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(Alimentations $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(Alimentations $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(Alimentations::getAttributes(),"Alimentations",["idAliment" => $id])[0];
	}

	public static function getList()
	{
 		return DAO::select(Alimentations::getAttributes(),"Alimentations");
	}
}
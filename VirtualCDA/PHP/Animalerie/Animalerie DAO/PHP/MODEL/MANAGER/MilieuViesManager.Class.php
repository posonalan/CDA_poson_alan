<?php

class MilieuViesManager 
{

	public static function add(MilieuVies $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(MilieuVies $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(MilieuVies $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(MilieuVies::getAttributes(),"MilieuVies",["idMilieuVie" => $id])[0];
	}

	public static function getList()
	{
 		return DAO::select(MilieuVies::getAttributes(),"MilieuVies");
	}
  
}
<?php

class MilieuviesManager
{

	public static function add(Milieuvies $obj)
	{
		return DAO::add($obj);
	}

	public static function update(Milieuvies $obj)
	{
		return DAO::update($obj);
	}

	public static function delete(Milieuvies $obj)
	{
		return DAO::delete($obj);
	}

	public static function findById($id)
	{
		return DAO::select(Milieuvies::getAttributes(), "Milieuvies", ["idMilieuVie" => $id])[0];
	}

	public static function getList(array $nomColonnes = null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
		$nomColonnes = ($nomColonnes == null) ? Milieuvies::getAttributes() : $nomColonnes;
		return DAO::select($nomColonnes, "Milieuvies",   $conditions,  $orderBy,  $limit,  $api,  $debug);
	}

	static public function count()
	{
		$db = DbConnect::getDb(); // Instance de PDO.

		$q = $db->query('SELECT count(*) as nb FROM milieuvies');

		$donnees = $q->fetch(PDO::FETCH_ASSOC);

		return $donnees;
	}
}

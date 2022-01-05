<?php

class AlimentationsManager 
{
	public static function add(Alimentations $obj)
	{
 		$db=DbConnect::getDb();
		$q=$db->prepare("INSERT INTO Alimentations (LibelleAliment) VALUES (:LibelleAliment)");
		// vérifier qu'il ne contient pas de ;
		$q->bindValue(":LibelleAliment", $obj->getLibelleAliment(), PDO::PARAM_STR);
		$q->execute();
	}

	public static function update(Alimentations $obj)
	{
 		$db=DbConnect::getDb();
		$q=$db->prepare("UPDATE Alimentations SET LibelleAliment=:LibelleAliment WHERE idAliment=:idAliment");
		/* pdo:: forcer a un int */ 
		$q->bindValue(":idAliment", $obj->getIdAliment(), PDO::PARAM_INT);
		$q->bindValue(":LibelleAliment", $obj->getLibelleAliment(),PDO::PARAM_STR);
		$q->execute();
	}
	public static function delete(Alimentations $obj)
	{
 		$db=DbConnect::getDb();
		$id = (int) $obj->getIdAliment(); // permet de bloquer les injections SQL
		$db->exec("DELETE FROM Alimentations WHERE idAliment=" .$id);
	}
	public static function findById($id)
	{
 		$db=DbConnect::getDb();
		$id = (int) $id;
		$q=$db->query("SELECT * FROM Alimentations WHERE idAliment =".$id);
		$results = $q->fetch(PDO::FETCH_ASSOC);
		if($results != false)
		{
			return new Alimentations($results);
		}
		else
		{
			return false;
		}
	}
	public static function getList()
	{
 		$db=DbConnect::getDb();
		$liste = [];
		$q = $db->query("SELECT * FROM Alimentations");
		while($donnees = $q->fetch(PDO::FETCH_ASSOC))
		{
			if($donnees != false)
			{
				$liste[] = new Alimentations($donnees);
			}
		}
		return $liste;
	}
}
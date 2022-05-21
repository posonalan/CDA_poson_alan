<?php 



class MilieuVieManager {


	public static function add(MilieuVie $obj)
	{
 		$db=DbConnect::getDb();
		$q=$db->prepare("INSERT INTO MilieuVie (libelleMilieuVie, typeMilieuVie) VALUES (:libelleMilieuVie, :typeMilieuVie)");
		// vérifier qu'il ne contient pas de ;
		$q->bindValue(":libelleMilieuVie", $obj->getLibelleMilieuVie(), PDO::PARAM_STR);
        $q->bindValue(":typeMilieuVie", $obj->getTypeMilieuVie(), PDO::PARAM_STR);

		$q->execute();
	}

	public static function update(MilieuVie $obj)
	{
 		$db=DbConnect::getDb();
		$q=$db->prepare("UPDATE MilieuVie SET libelleMilieuVie=:libelleMilieuVie, typeMilieuVie=:typeMilieuVie WHERE idMilieuVie=:idMilieuVie");
		/* pdo:: forcer a un int */ 
		$q->bindValue(":idMilieuVie", $obj->getIdMilieuVie(), PDO::PARAM_INT);
		$q->bindValue(":libelleMilieuVie", $obj->getLibelleMilieuVie(),PDO::PARAM_STR);
        $q->bindValue(":typeMilieuVie", $obj->getTypeMilieuVie(), PDO::PARAM_STR);
		$q->execute();
	}
	public static function delete(MilieuVie $obj)
	{
 		$db=DbConnect::getDb();
		$id = (int) $obj->getIdMilieuVie(); // permet de bloquer les injections SQL
		$db->exec("DELETE FROM MilieuVie WHERE idMilieuVie=" .$id);
	}
	public static function findById($id)
	{
 		$db=DbConnect::getDb();
		$id = (int) $id;
		$q=$db->query("SELECT * FROM MilieuVie WHERE idMilieuVie =".$id);
		$results = $q->fetch(PDO::FETCH_ASSOC);
		if($results != false)
		{
			return new MilieuVie($results);
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
		$q = $db->query("SELECT * FROM MilieuVie");
		while($donnees = $q->fetch(PDO::FETCH_ASSOC))
		{
			if($donnees != false)
			{
				$liste[] = new MilieuVie($donnees);
			}
		}
		return $liste;
	}

}


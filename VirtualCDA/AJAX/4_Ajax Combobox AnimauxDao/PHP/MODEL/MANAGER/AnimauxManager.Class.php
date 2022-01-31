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

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?Animaux::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"Animaux",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	
	}


	public static function getListByMilieuVie($idMilieuVie, $api){
        $id=(int) $idMilieuVie;
        $db = DbConnect::getDb();
        $liste = [];
        $q = $db->query("SELECT * FROM animaux where idMilieuVie=$id");
        while ($donnees = $q->fetch(PDO::FETCH_ASSOC))
        {
            if ($donnees != false)
            {
				$liste[] = new Animaux($donnees);
				$json[]=$donnees;
            }
        }
		if (!$api)  return $liste;
		return $json;
    }


}
<?php

class JeuxManager 
{

	public static function add(Jeux $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(Jeux $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(Jeux $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(Jeux::getAttributes(),"Jeux",["idJeu" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?Jeux::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"Jeux",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}

		public static function getListById($listeId,$api)
		{
			$db = DbConnect::getDb();
			$requete = $db->query("SELECT * FROM jeux where idJeu in ".$listeId);
			while ($donnees = $requete->fetch(PDO::FETCH_ASSOC)) {
				if ($api) {
					$listeJeux[] = $donnees;
				}else{
					$listeJeux[] = new Jeux($donnees);
				}
			}
			return $listeJeux;
		}




	}
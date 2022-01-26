<?php

class ProfilesManager 
{

	public static function add(Profiles $obj)
	{
 		return DAO::add($obj);
	}

	public static function update(Profiles $obj)
	{
 		return DAO::update($obj);
	}

	public static function delete(Profiles $obj)
	{
 		return DAO::delete($obj);
	}

	public static function findById($id)
	{
 		return DAO::select(Profiles::getAttributes(),"Profiles",["idProfile" => $id])[0];
	}

	public static function getList(array $nomColonnes=null,  array $conditions = null, string $orderBy = null, string $limit = null, bool $api = false, bool $debug = false)
	{
 		$nomColonnes = ($nomColonnes==null)?Profiles::getAttributes():$nomColonnes;
		return DAO::select($nomColonnes,"Profiles",   $conditions ,  $orderBy,  $limit ,  $api,  $debug );	}

		public static function getListByUtilisateurs($idUtilisateur, $api)
		{
			$db = DbConnect::getDb();
			$requete = $db->query("SELECT * FROM profiles where idUtilisateur = ".$idUtilisateur);
			while ($donnees = $requete->fetch(PDO::FETCH_ASSOC)) {
				if ($api) {
					$listeProfiles[] = $donnees;
				}else{
					$listeProfiles[] = new Profiles($donnees);
				}
			}
			return $listeProfiles;
		}



	}
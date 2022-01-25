<?php

class AnimauxManager
{
	static public function add(Animaux $Animal)
	{
		$db = DbConnect::getDb(); // Instance de PDO.
		// Pr�paration de la requ�te d'insertion.
		$q = $db->prepare('INSERT INTO Animaux(libelleAnimal, dateNaissance) VALUES(:libelleAnimal, :dateNaissance)');
		// Assignation des valeurs pour le nom, le pr�nom.
		$q->bindValue(':libelleAnimal', $Animal->getLibelleAnimal());
		$q->bindValue(':dateNaissance', $Animal->getDateNaissance());
		// Ex�cution de la requ�te.
		$q->execute();
	}

	static public function update(Animaux $Animal)
	{
		$db = DbConnect::getDb(); // Instance de PDO.
		// Pr�pare une requ�te de type UPDATE.
		$q = $db->prepare('UPDATE Animaux SET libelleAnimal=:libelleAnimal, dateNaissance=:dateNaissance WHERE idAnimal = :idAnimal');
		// Assignation des valeurs � la requ�te.
		$q->bindValue(':idAnimal', $Animal->getIdAnimal());
		$q->bindValue(':libelleAnimal', $Animal->getLibelleAnimal());
		$q->bindValue(':dateNaissance', $Animal->getDateNaissance());
		// Ex�cution de la requ�te.
		$q->execute();
	}

	static public function delete(Animaux $Animal)
	{
		$db = DbConnect::getDb(); // Instance de PDO.
		// Ex�cute une requ�te de type DELETE.
		$db->exec('DELETE FROM Animaux WHERE id = ' . $Animal->getIdAnimal());
	}

	static public function getById($id)
	{
		$db = DbConnect::getDb(); // Instance de PDO.
		// Ex�cute une requ�te de type SELECT avec une clause WHERE, et retourne un objet Animaux.
		$id = (int) $id;
		$q = $db->query('SELECT idAnimal, libelleAnimal, dateNaissance FROM Animaux WHERE id = ' . $id);
		$donnees = $q->fetch(PDO::FETCH_ASSOC);
		return new Animaux($donnees);
	}

	static public function getList($api)
	{
		$db = DbConnect::getDb(); // Instance de PDO.
		// Retourne la liste de tous les Animauxs.
		$q = $db->query('SELECT idAnimal, libelleAnimal, dateNaissance FROM Animaux ORDER BY libelleAnimal');
		while ($donnees = $q->fetch(PDO::FETCH_ASSOC)) {
			if($api) $Animals[] = $donnees;
			else $Animals[] = new Animaux($donnees);
		}
		return $Animals;
	}
	static public function getListAPI()
	{
		$db = DbConnect::getDb(); // Instance de PDO.
		// Retourne la liste de tous les Animauxs.
		$q = $db->query('SELECT idAnimal, libelleAnimal, dateNaissance FROM Animaux ORDER BY libelleAnimal');
		while ($donnees = $q->fetch(PDO::FETCH_ASSOC)) {
			$json[] = $donnees;
		}
		return $json;
	}


	

	static public function count()
	{
		$db = DbConnect::getDb(); // Instance de PDO.
		// Retourne la liste de tous les Animauxs.
		$q = $db->query('SELECT count(*) as nb FROM Animaux');
		$donnees = $q->fetch(PDO::FETCH_ASSOC);
		return $donnees;
	}
}

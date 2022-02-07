<?php

class Jeux_Utilisateurs 
{

	/*****************Attributs***************** */

	private $_idUtilisateur;
	private $_nom;
	private $_prenom;
	private $_idJeu;
	private $_libelleJeu;
	private $_idMarque;
	private static $_attributes=["idUtilisateur","nom","prenom","idJeu","libelleJeu","idMarque"];
	/***************** Accesseurs ***************** */


	public function getIdUtilisateur()
	{
		return $this->_idUtilisateur;
	}

	public function setIdUtilisateur(int $idUtilisateur)
	{
		$this->_idUtilisateur=$idUtilisateur;
	}

	public function getNom()
	{
		return $this->_nom;
	}

	public function setNom(?string $nom)
	{
		$this->_nom=$nom;
	}

	public function getPrenom()
	{
		return $this->_prenom;
	}

	public function setPrenom(?string $prenom)
	{
		$this->_prenom=$prenom;
	}

	public function getIdJeu()
	{
		return $this->_idJeu;
	}

	public function setIdJeu(int $idJeu)
	{
		$this->_idJeu=$idJeu;
	}

	public function getLibelleJeu()
	{
		return $this->_libelleJeu;
	}

	public function setLibelleJeu(?string $libelleJeu)
	{
		$this->_libelleJeu=$libelleJeu;
	}

	public function getIdMarque()
	{
		return $this->_idMarque;
	}

	public function setIdMarque(int $idMarque)
	{
		$this->_idMarque=$idMarque;
	}

	public static function getAttributes()
	{
		return self::$_attributes;
	}

	/*****************Constructeur***************** */

	public function __construct(array $options = [])
	{
 		if (!empty($options)) // empty : renvoi vrai si le tableau est vide
		{
			$this->hydrate($options);
		}
	}
	public function hydrate($data)
	{
 		foreach ($data as $key => $value)
		{
 			$methode = "set".ucfirst($key); //ucfirst met la 1ere lettre en majuscule
			if (is_callable(([$this, $methode]))) // is_callable verifie que la methode existe
			{
				$this->$methode($value===""?null:$value);
			}
		}
	}

	/*****************Autres Méthodes***************** */

	/**
	* Transforme l'objet en chaine de caractères
	*
	* @return String
	*/
	public function toString()
	{
		return "IdUtilisateur : ".$this->getIdUtilisateur()."Nom : ".$this->getNom()."Prenom : ".$this->getPrenom()."IdJeu : ".$this->getIdJeu()."LibelleJeu : ".$this->getLibelleJeu()."IdMarque : ".$this->getIdMarque()."\n";
	}
}
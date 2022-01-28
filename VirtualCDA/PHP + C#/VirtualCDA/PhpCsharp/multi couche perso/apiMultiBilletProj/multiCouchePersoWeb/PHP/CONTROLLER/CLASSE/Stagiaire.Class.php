<?php

class Stagiaire 
{

	/*****************Attributs***************** */

	private $_IdStagiaire;
	private $_Nom;
	private $_Prenom;
	private $_IdBillet;
	private static $_attributes=["IdStagiaire","Nom","Prenom","IdBillet"];
	/***************** Accesseurs ***************** */


	public function getIdStagiaire()
	{
		return $this->_IdStagiaire;
	}

	public function setIdStagiaire(int $IdStagiaire)
	{
		$this->_IdStagiaire=$IdStagiaire;
	}

	public function getNom()
	{
		return $this->_Nom;
	}

	public function setNom(string $Nom)
	{
		$this->_Nom=$Nom;
	}

	public function getPrenom()
	{
		return $this->_Prenom;
	}

	public function setPrenom(string $Prenom)
	{
		$this->_Prenom=$Prenom;
	}

	public function getIdBillet()
	{
		return $this->_IdBillet;
	}

	public function setIdBillet(int $IdBillet)
	{
		$this->_IdBillet=$IdBillet;
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
		return "IdStagiaire : ".$this->getIdStagiaire()."Nom : ".$this->getNom()."Prenom : ".$this->getPrenom()."IdBillet : ".$this->getIdBillet()."\n";
	}
}
<?php

class Consoles_Utilisateurs 
{

	/*****************Attributs***************** */

	private $_idutilisateur;
	private $_nom;
	private $_prenom;
	private $_idConsole;
	private $_libelleConsole;
	private $_idMarque;
	private static $_attributes=["idutilisateur","nom","prenom","idConsole","libelleConsole","idMarque"];
	/***************** Accesseurs ***************** */


	public function getIdutilisateur()
	{
		return $this->_idutilisateur;
	}

	public function setIdutilisateur(int $idutilisateur)
	{
		$this->_idutilisateur=$idutilisateur;
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

	public function getIdConsole()
	{
		return $this->_idConsole;
	}

	public function setIdConsole(int $idConsole)
	{
		$this->_idConsole=$idConsole;
	}

	public function getLibelleConsole()
	{
		return $this->_libelleConsole;
	}

	public function setLibelleConsole(?string $libelleConsole)
	{
		$this->_libelleConsole=$libelleConsole;
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
		return "Idutilisateur : ".$this->getIdutilisateur()."Nom : ".$this->getNom()."Prenom : ".$this->getPrenom()."IdConsole : ".$this->getIdConsole()."LibelleConsole : ".$this->getLibelleConsole()."IdMarque : ".$this->getIdMarque()."\n";
	}
}
<?php

class Profiles 
{

	/*****************Attributs***************** */

	private $_idProfile;
	private $_idUtilisateur;
	private $_idJeu;
	private $_idAccessoire;
	private $_idConsole;
	private static $_attributes=["idProfile","idUtilisateur","idJeu","idAccessoire","idConsole"];
	/***************** Accesseurs ***************** */


	public function getIdProfile()
	{
		return $this->_idProfile;
	}

	public function setIdProfile(int $idProfile)
	{
		$this->_idProfile=$idProfile;
	}

	public function getIdUtilisateur()
	{
		return $this->_idUtilisateur;
	}

	public function setIdUtilisateur(?int $idUtilisateur)
	{
		$this->_idUtilisateur=$idUtilisateur;
	}

	public function getIdJeu()
	{
		return $this->_idJeu;
	}

	public function setIdJeu(?int $idJeu)
	{
		$this->_idJeu=$idJeu;
	}

	public function getIdAccessoire()
	{
		return $this->_idAccessoire;
	}

	public function setIdAccessoire(?int $idAccessoire)
	{
		$this->_idAccessoire=$idAccessoire;
	}

	public function getIdConsole()
	{
		return $this->_idConsole;
	}

	public function setIdConsole(?int $idConsole)
	{
		$this->_idConsole=$idConsole;
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
		return "IdProfile : ".$this->getIdProfile()."IdUtilisateur : ".$this->getIdUtilisateur()."IdJeu : ".$this->getIdJeu()."IdAccessoire : ".$this->getIdAccessoire()."IdConsole : ".$this->getIdConsole()."\n";
	}
}
<?php

class Consoles 
{

	/*****************Attributs***************** */

	private $_idConsole;
	private $_libelleConsole;
	private $_PhotoConsole;
	private $_idMarque;
	private static $_attributes=["idConsole","libelleConsole","PhotoConsole","idMarque"];
	/***************** Accesseurs ***************** */


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

	public function getPhotoConsole()
	{
		return $this->_PhotoConsole;
	}

	public function setPhotoConsole( $PhotoConsole)
	{
		$this->_PhotoConsole=$PhotoConsole;
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
		return "IdConsole : ".$this->getIdConsole()."LibelleConsole : ".$this->getLibelleConsole()."PhotoConsole : ".$this->getPhotoConsole()."IdMarque : ".$this->getIdMarque()."\n";
	}
}
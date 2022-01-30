<?php

class Accessoires 
{

	/*****************Attributs***************** */

	private $_idAccessoire;
	private $_libelleAccessoire;
	private $_PhotoAccessoire;
	private $_idMarque;
	private static $_attributes=["idAccessoire","libelleAccessoire","PhotoAccessoire","idMarque"];
	/***************** Accesseurs ***************** */


	public function getIdAccessoire()
	{
		return $this->_idAccessoire;
	}

	public function setIdAccessoire(int $idAccessoire)
	{
		$this->_idAccessoire=$idAccessoire;
	}

	public function getLibelleAccessoire()
	{
		return $this->_libelleAccessoire;
	}

	public function setLibelleAccessoire(?string $libelleAccessoire)
	{
		$this->_libelleAccessoire=$libelleAccessoire;
	}

	public function getPhotoAccessoire()
	{
		return $this->_PhotoAccessoire;
	}

	public function setPhotoAccessoire( $PhotoAccessoire)
	{
		$this->_PhotoAccessoire=$PhotoAccessoire;
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
		return "IdAccessoire : ".$this->getIdAccessoire()."LibelleAccessoire : ".$this->getLibelleAccessoire()."PhotoAccessoire : ".$this->getPhotoAccessoire()."IdMarque : ".$this->getIdMarque()."\n";
	}
}
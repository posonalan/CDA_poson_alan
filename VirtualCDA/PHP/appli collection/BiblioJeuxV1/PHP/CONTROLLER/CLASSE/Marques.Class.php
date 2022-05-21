<?php

class Marques 
{

	/*****************Attributs***************** */

	private $_idMarque;
	private $_libelleMarque;
	private $_PhotoMarque;
	private static $_attributes=["idMarque","libelleMarque","PhotoMarque"];
	/***************** Accesseurs ***************** */


	public function getIdMarque()
	{
		return $this->_idMarque;
	}

	public function setIdMarque(int $idMarque)
	{
		$this->_idMarque=$idMarque;
	}

	public function getLibelleMarque()
	{
		return $this->_libelleMarque;
	}

	public function setLibelleMarque(?string $libelleMarque)
	{
		$this->_libelleMarque=$libelleMarque;
	}

	public function getPhotoMarque()
	{
		return $this->_PhotoMarque;
	}

	public function setPhotoMarque( $PhotoMarque)
	{
		$this->_PhotoMarque=$PhotoMarque;
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
		return "IdMarque : ".$this->getIdMarque()."LibelleMarque : ".$this->getLibelleMarque()."PhotoMarque : ".$this->getPhotoMarque()."\n";
	}
}
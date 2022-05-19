<?php

class ChantiersVues 
{

	/*****************Attributs***************** */

	private $_IdChantier;
	private $_LibelleChantier;
	private $_DescriptionChantier;
	private $_PhotoChantier;
	private $_dosimetrieChantier;
	private static $_attributes=["IdChantier","LibelleChantier","DescriptionChantier","PhotoChantier","dosimetrieChantier"];
	/***************** Accesseurs ***************** */


	public function getIdChantier()
	{
		return $this->_IdChantier;
	}

	public function setIdChantier(?int $IdChantier)
	{
		$this->_IdChantier=$IdChantier;
	}

	public function getLibelleChantier()
	{
		return $this->_LibelleChantier;
	}

	public function setLibelleChantier(?string $LibelleChantier)
	{
		$this->_LibelleChantier=$LibelleChantier;
	}

	public function getDescriptionChantier()
	{
		return $this->_DescriptionChantier;
	}

	public function setDescriptionChantier(?string $DescriptionChantier)
	{
		$this->_DescriptionChantier=$DescriptionChantier;
	}

	public function getPhotoChantier()
	{
		return $this->_PhotoChantier;
	}

	public function setPhotoChantier(?string $PhotoChantier)
	{
		$this->_PhotoChantier=$PhotoChantier;
	}

	public function getDosimetrieChantier()
	{
		return $this->_dosimetrieChantier;
	}

	public function setDosimetrieChantier(?float $dosimetrieChantier)
	{
		$this->_dosimetrieChantier=$dosimetrieChantier;
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
		return "IdChantier : ".$this->getIdChantier()."LibelleChantier : ".$this->getLibelleChantier()."DescriptionChantier : ".$this->getDescriptionChantier()."PhotoChantier : ".$this->getPhotoChantier()."DosimetrieChantier : ".$this->getDosimetrieChantier()."\n";
	}
}
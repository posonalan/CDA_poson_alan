<?php

class Batiments 
{

	/*****************Attributs***************** */

	private $_IdBatiment;
	private $_LibelleBatiment;
	private $_DescriptionBatiment;
	private $_PhotoBatiment;
	private $_DosimetrieBatiment;
	private $_IdEnjeuRadio;
	private $_IdTranche;
	private static $_attributes=["IdBatiment","LibelleBatiment","DescriptionBatiment","PhotoBatiment","DosimetrieBatiment","IdEnjeuRadio","IdTranche"];
	/***************** Accesseurs ***************** */


	public function getIdBatiment()
	{
		return $this->_IdBatiment;
	}

	public function setIdBatiment(?int $IdBatiment)
	{
		$this->_IdBatiment=$IdBatiment;
	}

	public function getLibelleBatiment()
	{
		return $this->_LibelleBatiment;
	}

	public function setLibelleBatiment(?string $LibelleBatiment)
	{
		$this->_LibelleBatiment=$LibelleBatiment;
	}

	public function getDescriptionBatiment()
	{
		return $this->_DescriptionBatiment;
	}

	public function setDescriptionBatiment(?string $DescriptionBatiment)
	{
		$this->_DescriptionBatiment=$DescriptionBatiment;
	}

	public function getPhotoBatiment()
	{
		return $this->_PhotoBatiment;
	}

	public function setPhotoBatiment(?string $PhotoBatiment)
	{
		$this->_PhotoBatiment=$PhotoBatiment;
	}

	public function getDosimetrieBatiment()
	{
		return $this->_DosimetrieBatiment;
	}

	public function setDosimetrieBatiment(?float $DosimetrieBatiment)
	{
		$this->_DosimetrieBatiment=$DosimetrieBatiment;
	}

	public function getIdEnjeuRadio()
	{
		return $this->_IdEnjeuRadio;
	}

	public function setIdEnjeuRadio(int $IdEnjeuRadio)
	{
		$this->_IdEnjeuRadio=$IdEnjeuRadio;
	}

	public function getIdTranche()
	{
		return $this->_IdTranche;
	}

	public function setIdTranche(int $IdTranche)
	{
		$this->_IdTranche=$IdTranche;
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
		return "IdBatiment : ".$this->getIdBatiment()."LibelleBatiment : ".$this->getLibelleBatiment()."DescriptionBatiment : ".$this->getDescriptionBatiment()."PhotoBatiment : ".$this->getPhotoBatiment()."DosimetrieBatiment : ".$this->getDosimetrieBatiment()."IdEnjeuRadio : ".$this->getIdEnjeuRadio()."IdTranche : ".$this->getIdTranche()."\n";
	}
}
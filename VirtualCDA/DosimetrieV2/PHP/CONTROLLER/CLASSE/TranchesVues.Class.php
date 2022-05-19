<?php
class TranchesVues 
{
	/*****************Attributs***************** */
	private $_IdTranche;
	private $_LibelleTranche;
	private $_DescriptionTranche;
	private $_PhotoTranche;
	private $_IdChantier;
	private $_dosimetrieTranche;
	private static $_attributes=["IdTranche","LibelleTranche","DescriptionTranche","PhotoTranche","IdChantier","dosimetrieTranche"];
	/***************** Accesseurs ***************** */

	public function getIdTranche()
	{
		return $this->_IdTranche;
	}

	public function setIdTranche(?int $IdTranche)
	{
		$this->_IdTranche=$IdTranche;
	}

	public function getLibelleTranche()
	{
		return $this->_LibelleTranche;
	}

	public function setLibelleTranche(?string $LibelleTranche)
	{
		$this->_LibelleTranche=$LibelleTranche;
	}

	public function getDescriptionTranche()
	{
		return $this->_DescriptionTranche;
	}

	public function setDescriptionTranche(?string $DescriptionTranche)
	{
		$this->_DescriptionTranche=$DescriptionTranche;
	}

	public function getPhotoTranche()
	{
		return $this->_PhotoTranche;
	}

	public function setPhotoTranche(?string $PhotoTranche)
	{
		$this->_PhotoTranche=$PhotoTranche;
	}

	public function getIdChantier()
	{
		return $this->_IdChantier;
	}

	public function setIdChantier(?int $IdChantier)
	{
		$this->_IdChantier=$IdChantier;
	}

	public function getDosimetrieTranche()
	{
		return $this->_dosimetrieTranche;
	}

	public function setDosimetrieTranche(?float $dosimetrieTranche)
	{
		$this->_dosimetrieTranche=$dosimetrieTranche;
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
		return "IdTranche : ".$this->getIdTranche()."LibelleTranche : ".$this->getLibelleTranche()."DescriptionTranche : ".$this->getDescriptionTranche()."PhotoTranche : ".$this->getPhotoTranche()."IdChantier : ".$this->getIdChantier()."DosimetrieTranche : ".$this->getDosimetrieTranche()."\n";
	}
}
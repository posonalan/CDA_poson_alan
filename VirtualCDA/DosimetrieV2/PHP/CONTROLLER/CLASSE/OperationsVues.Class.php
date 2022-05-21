<?php

class OperationsVues 
{

	/*****************Attributs***************** */

	private $_IdOperation;
	private $_LibelleOperation;
	private $_DescriptionOperation;
	private $_InformationOperation;
	private $_PhotoOperation;
	private $_IdChantier;
	private $_EffectifOperation;
	private $_TempsOperation;
	private $_DosimetrieOperation;
	private static $_attributes=["IdOperation","LibelleOperation","DescriptionOperation","InformationOperation","PhotoOperation","IdChantier","EffectifOperation","TempsOperation","DosimetrieOperation"];
	/***************** Accesseurs ***************** */


	public function getIdOperation()
	{
		return $this->_IdOperation;
	}

	public function setIdOperation(?int $IdOperation)
	{
		$this->_IdOperation=$IdOperation;
	}

	public function getLibelleOperation()
	{
		return $this->_LibelleOperation;
	}

	public function setLibelleOperation(?string $LibelleOperation)
	{
		$this->_LibelleOperation=$LibelleOperation;
	}

	public function getDescriptionOperation()
	{
		return $this->_DescriptionOperation;
	}

	public function setDescriptionOperation(?string $DescriptionOperation)
	{
		$this->_DescriptionOperation=$DescriptionOperation;
	}

	public function getInformationOperation()
	{
		return $this->_InformationOperation;
	}

	public function setInformationOperation(?string $InformationOperation)
	{
		$this->_InformationOperation=$InformationOperation;
	}

	public function getPhotoOperation()
	{
		return $this->_PhotoOperation;
	}

	public function setPhotoOperation(?string $PhotoOperation)
	{
		$this->_PhotoOperation=$PhotoOperation;
	}

	public function getIdChantier()
	{
		return $this->_IdChantier;
	}

	public function setIdChantier(?int $IdChantier)
	{
		$this->_IdChantier=$IdChantier;
	}

	public function getEffectifOperation()
	{
		return $this->_EffectifOperation;
	}

	public function setEffectifOperation(?float $EffectifOperation)
	{
		$this->_EffectifOperation=$EffectifOperation;
	}

	public function getTempsOperation()
	{
		return $this->_TempsOperation;
	}

	public function setTempsOperation(?float $TempsOperation)
	{
		$this->_TempsOperation=$TempsOperation;
	}

	public function getDosimetrieOperation()
	{
		return $this->_DosimetrieOperation;
	}

	public function setDosimetrieOperation(?float $DosimetrieOperation)
	{
		$this->_DosimetrieOperation=$DosimetrieOperation;
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
		return "IdOperation : ".$this->getIdOperation()."LibelleOperation : ".$this->getLibelleOperation()."DescriptionOperation : ".$this->getDescriptionOperation()."InformationOperation : ".$this->getInformationOperation()."PhotoOperation : ".$this->getPhotoOperation()."IdChantier : ".$this->getIdChantier()."EffectifOperation : ".$this->getEffectifOperation()."TempsOperation : ".$this->getTempsOperation()."DosimetrieOperation : ".$this->getDosimetrieOperation()."\n";
	}
}
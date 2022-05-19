<?php

class ActivitesProtections 
{

	/*****************Attributs***************** */
	private $_IdActiviteProtection;
	private $_IdActivite;
	private $_IdProtection;
	private $_LibelleProtection;
	private $_DescriptionProtection;
	private $_PhotoProtection;
	private $_DosimetrieProtection;
	private $_InformationProtection;
	private static $_attributes=["IdActiviteProtection","IdActivite","IdProtection","LibelleProtection","DescriptionProtection","PhotoProtection","DosimetrieProtection","InformationProtection"];
	/***************** Accesseurs ***************** */


public function getIdActiviteProtection()
	{
		return $this->_IdActiviteProtection;
	}

	public function setIdActiviteProtection(?int $IdActiviteProtection)
	{
		$this->_IdActiviteProtection=$IdActiviteProtection;
	}

public function getIdActivite()
	{
		return $this->_IdActivite;
	}

	public function setIdActivite(?int $IdActivite)
	{
		$this->_IdActivite=$IdActivite;
	}

	public function getIdProtection()
	{
		return $this->_IdProtection;
	}

	public function setIdProtection(?int $IdProtection)
	{
		$this->_IdProtection=$IdProtection;
	}

	public function getLibelleProtection()
	{
		return $this->_LibelleProtection;
	}

	public function setLibelleProtection(?string $LibelleProtection)
	{
		$this->_LibelleProtection=$LibelleProtection;
	}

	public function getDescriptionProtection()
	{
		return $this->_DescriptionProtection;
	}

	public function setDescriptionProtection(?string $DescriptionProtection)
	{
		$this->_DescriptionProtection=$DescriptionProtection;
	}

	public function getPhotoProtection()
	{
		return $this->_PhotoProtection;
	}

	public function setPhotoProtection(?string $PhotoProtection)
	{
		$this->_PhotoProtection=$PhotoProtection;
	}

	public function getDosimetrieProtection()
	{
		return $this->_DosimetrieProtection;
	}

	public function setDosimetrieProtection(?float $DosimetrieProtection)
	{
		$this->_DosimetrieProtection=$DosimetrieProtection;
	}

	public function getInformationProtection()
	{
		return $this->_InformationProtection;
	}

	public function setInformationProtection(?string $InformationProtection)
	{
		$this->_InformationProtection=$InformationProtection;
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
		return 
		"IdActiviteProtection : ".$this->getIdActiviteProtection().
		"IdActivite : ".$this->getIdActivite().
		"IdProtection : ".$this->getIdProtection().
		"LibelleProtection : ".$this->getLibelleProtection().
		"DescriptionProtection : ".$this->getDescriptionProtection().
		"PhotoProtection : ".$this->getPhotoProtection().
		"DosimetrieProtection : ".$this->getDosimetrieProtection().
		"InformationProtection : ".$this->getInformationProtection().
		"\n";
	}
}
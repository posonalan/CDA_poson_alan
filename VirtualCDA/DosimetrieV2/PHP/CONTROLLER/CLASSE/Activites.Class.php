<?php

class Activites 
{

	/*****************Attributs***************** */

	private $_IdActivite;
	private $_LibelleActivite;
	private $_DescriptionActivite;
	private $_Risque;
	private $_Parade;
	private $_PhotoActivite;
	private $_EffectifActivite;
	private $_TempsActivite;
	private $_IdOperation;
	private $_IdBatiment;
	private static $_attributes=["IdActivite","LibelleActivite","DescriptionActivite","Risque","Parade","PhotoActivite","EffectifActivite","TempsActivite","IdOperation","IdBatiment"];
	/***************** Accesseurs ***************** */


	public function getIdActivite()
	{
		return $this->_IdActivite;
	}

	public function setIdActivite(?int $IdActivite)
	{
		$this->_IdActivite=$IdActivite;
	}

	public function getLibelleActivite()
	{
		return $this->_LibelleActivite;
	}

	public function setLibelleActivite(?string $LibelleActivite)
	{
		$this->_LibelleActivite=$LibelleActivite;
	}

	public function getDescriptionActivite()
	{
		return $this->_DescriptionActivite;
	}

	public function setDescriptionActivite(?string $DescriptionActivite)
	{
		$this->_DescriptionActivite=$DescriptionActivite;
	}

	public function getRisque()
	{
		return $this->_Risque;
	}

	public function setRisque(?string $Risque)
	{
		$this->_Risque=$Risque;
	}

	public function getParade()
	{
		return $this->_Parade;
	}

	public function setParade(?string $Parade)
	{
		$this->_Parade=$Parade;
	}

	public function getPhotoActivite()
	{
		return $this->_PhotoActivite;
	}

	public function setPhotoActivite(?string $PhotoActivite)
	{
		$this->_PhotoActivite=$PhotoActivite;
	}

	public function getEffectifActivite()
	{
		return $this->_EffectifActivite;
	}

	public function setEffectifActivite(?int $EffectifActivite)
	{
		$this->_EffectifActivite=$EffectifActivite;
	}

	public function getTempsActivite()
	{
		return $this->_TempsActivite;
	}


	public function setTempsActivite(?int $TempsActivite)
	{
		$this->_TempsActivite=$TempsActivite;
	}


	public function getIdOperation()
	{
		return $this->_IdOperation;
	}

	public function setIdOperation(int $IdOperation)
	{
		$this->_IdOperation=$IdOperation;
	}

	public function getIdBatiment()
	{
		return $this->_IdBatiment;
	}

	public function setIdBatiment(int $IdBatiment)
	{
		$this->_IdBatiment=$IdBatiment;
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
		return "IdActivite : ".$this->getIdActivite()
		."LibelleActivite : ".$this->getLibelleActivite()
		."DescriptionActivite : ".$this->getDescriptionActivite()
		."Risque : ".$this->getRisque()
		."Parade : ".$this->getParade()
		."PhotoActivite : ".$this->getPhotoActivite()
		."EffectifActivite : ".$this->getEffectifActivite()
		."TempsActivite : ".$this->getTempsActivite()
		."IdOperation : ".$this->getIdOperation()
		."IdBatiment : ".$this->getIdBatiment()."\n";
	}
}
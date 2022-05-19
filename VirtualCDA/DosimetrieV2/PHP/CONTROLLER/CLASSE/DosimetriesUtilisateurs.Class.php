<?php

class DosimetriesUtilisateurs 
{

	/*****************Attributs***************** */

	private $_IdDosimetrieUtilisateur;
	private $_DateIntervention;
	private $_TempsIntervention;
	private $_DosimetrieUtilisateur;
	private $_IdActivite;
	private $_IdUtilisateur;
	private static $_attributes=["IdDosimetrieUtilisateur","DateIntervention","TempsIntervention","DosimetrieUtilisateur","IdActivite","IdUtilisateur"];
	/***************** Accesseurs ***************** */


	public function getIdDosimetrieUtilisateur()
	{
		return $this->_IdDosimetrieUtilisateur;
	}

	public function setIdDosimetrieUtilisateur(?int $IdDosimetrieUtilisateur)
	{
		$this->_IdDosimetrieUtilisateur=$IdDosimetrieUtilisateur;
	}

	public function getDateIntervention()
	{
		return is_null($this->_DateIntervention)?null:$this->_DateIntervention->format('Y-n-j');
	}

	public function setDateIntervention(?string $DateIntervention)
	{
		$this->_DateIntervention=is_null($DateIntervention)?null:DateTime::createFromFormat("Y-n-j",$DateIntervention);
	}

	public function getTempsIntervention()
	{
		return $this->_TempsIntervention;
	}

	public function setTempsIntervention(?int $TempsIntervention)
	{
		$this->_TempsIntervention=$TempsIntervention;
	}

	public function getDosimetrieUtilisateur()
	{
		return $this->_DosimetrieUtilisateur;
	}

	public function setDosimetrieUtilisateur(?float $DosimetrieUtilisateur)
	{
		$this->_DosimetrieUtilisateur=$DosimetrieUtilisateur;
	}

	public function getIdActivite()
	{
		return $this->_IdActivite;
	}

	public function setIdActivite(int $IdActivite)
	{
		$this->_IdActivite=$IdActivite;
	}

	public function getIdUtilisateur()
	{
		return $this->_IdUtilisateur;
	}

	public function setIdUtilisateur(int $IdUtilisateur)
	{
		$this->_IdUtilisateur=$IdUtilisateur;
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
		return "IdDosimetrieUtilisateur : ".$this->getIdDosimetrieUtilisateur()
		."DateIntervention : ".$this->getDateIntervention()
		."TempsIntervention : ".$this->getTempsIntervention()
		."DosimetrieUtilisateur : ".$this->getDosimetrieUtilisateur()
		
		."IdActivite : ".$this->getIdActivite()
		."IdUtilisateur : ".$this->getIdUtilisateur()
		."\n";
	}
}
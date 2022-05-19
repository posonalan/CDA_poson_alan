<?php

class EnjeuxRadiologiques 
{

	/*****************Attributs***************** */

	private $_IdEnjeuRadio;
	private $_LibelleEnjeuRadio;
	private static $_attributes=["IdEnjeuRadio","LibelleEnjeuRadio"];
	/***************** Accesseurs ***************** */


	public function getIdEnjeuRadio()
	{
		return $this->_IdEnjeuRadio;
	}

	public function setIdEnjeuRadio(?int $IdEnjeuRadio)
	{
		$this->_IdEnjeuRadio=$IdEnjeuRadio;
	}

	public function getLibelleEnjeuRadio()
	{
		return $this->_LibelleEnjeuRadio;
	}

	public function setLibelleEnjeuRadio(?string $LibelleEnjeuRadio)
	{
		$this->_LibelleEnjeuRadio=$LibelleEnjeuRadio;
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
		return "IdEnjeuRadio : ".$this->getIdEnjeuRadio()."LibelleEnjeuRadio : ".$this->getLibelleEnjeuRadio()."\n";
	}
}
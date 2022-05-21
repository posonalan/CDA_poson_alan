<?php

class Entreprises 
{

	/*****************Attributs***************** */

	private $_IdEntreprise;
	private $_LibelleEntreprise;
	private static $_attributes=["IdEntreprise","LibelleEntreprise"];
	/***************** Accesseurs ***************** */


	public function getIdEntreprise()
	{
		return $this->_IdEntreprise;
	}

	public function setIdEntreprise(?int $IdEntreprise)
	{
		$this->_IdEntreprise=$IdEntreprise;
	}

	public function getLibelleEntreprise()
	{
		return $this->_LibelleEntreprise;
	}

	public function setLibelleEntreprise(?string $LibelleEntreprise)
	{
		$this->_LibelleEntreprise=$LibelleEntreprise;
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
		return $this->getLibelleEntreprise();
	}
}
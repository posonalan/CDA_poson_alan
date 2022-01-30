<?php

class Billeterie 
{

	/*****************Attributs***************** */

	private $_IdBillet;
	private $_LibelleBillet;
	private static $_attributes=["IdBillet","LibelleBillet"];
	/***************** Accesseurs ***************** */


	public function getIdBillet()
	{
		return $this->_IdBillet;
	}

	public function setIdBillet(int $IdBillet)
	{
		$this->_IdBillet=$IdBillet;
	}

	public function getLibelleBillet()
	{
		return $this->_LibelleBillet;
	}

	public function setLibelleBillet(string $LibelleBillet)
	{
		$this->_LibelleBillet=$LibelleBillet;
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
		return "IdBillet : ".$this->getIdBillet()."LibelleBillet : ".$this->getLibelleBillet()."\n";
	}
}
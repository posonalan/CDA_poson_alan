<?php

class Activites_Protections 
{

	/*****************Attributs***************** */

	private $_IdActiviteProtection;
	private $_IdActivite;
	private $_IdProtection;
	private static $_attributes=["IdActiviteProtection","IdActivite","IdProtection"];
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
		return "IdActiviteProtection : ".$this->getIdActiviteProtection()."IdActivite : ".$this->getIdActivite()."IdProtection : ".$this->getIdProtection()."\n";
	}
}
<?php

class PostesEntreprises 
{

	/*****************Attributs***************** */

	private $_IdPosteEntreprise;
	private $_LibellePosteEntreprise;
	private static $_attributes=["IdPosteEntreprise","LibellePosteEntreprise"];
	/***************** Accesseurs ***************** */


	public function getIdPosteEntreprise()
	{
		return $this->_IdPosteEntreprise;
	}

	public function setIdPosteEntreprise(?int $IdPosteEntreprise)
	{
		$this->_IdPosteEntreprise=$IdPosteEntreprise;
	}

	public function getLibellePosteEntreprise()
	{
		return $this->_LibellePosteEntreprise;
	}

	public function setLibellePosteEntreprise(?string $LibellePosteEntreprise)
	{
		$this->_LibellePosteEntreprise=$LibellePosteEntreprise;
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
		return $this->getLibellePosteEntreprise();
	}
}
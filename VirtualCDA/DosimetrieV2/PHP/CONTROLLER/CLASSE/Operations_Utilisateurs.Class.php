<?php

class Operations_Utilisateurs 
{

	/*****************Attributs***************** */

	private $_IdOperationUtilisateur;
	private $_IdOperation;
	private $_IdUtilisateur;
	private static $_attributes=["IdOperationUtilisateur","IdOperation","IdUtilisateur"];
	/***************** Accesseurs ***************** */


	public function getIdOperationUtilisateur()
	{
		return $this->_IdOperationUtilisateur;
	}

	public function setIdOperationUtilisateur(?int $IdOperationUtilisateur)
	{
		$this->_IdOperationUtilisateur=$IdOperationUtilisateur;
	}

	public function getIdOperation()
	{
		return $this->_IdOperation;
	}

	public function setIdOperation(?int $IdOperation)
	{
		$this->_IdOperation=$IdOperation;
	}

	public function getIdUtilisateur()
	{
		return $this->_IdUtilisateur;
	}

	public function setIdUtilisateur(?int $IdUtilisateur)
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
		return "IdOperationUtilisateur : ".$this->getIdOperationUtilisateur()."IdOperation : ".$this->getIdOperation()."IdUtilisateur : ".$this->getIdUtilisateur()."\n";
	}
}
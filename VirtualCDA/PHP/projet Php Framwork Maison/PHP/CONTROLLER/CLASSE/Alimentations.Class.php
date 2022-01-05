<?php

class Alimentations 
{

	/*****************Attributs***************** */

	private $_idAliment;
	private $_LibelleAliment;

	/***************** Accesseurs ***************** */


	public function getIdAliment()
	{
		return $this->_idAliment;
	}

	public function setIdAliment($idAliment)
	{
		$this->_idAliment=$idAliment;
	}

	public function getLibelleAliment()
	{
		return $this->_LibelleAliment;
	}

	public function setLibelleAliment($LibelleAliment)
	{
		$this->_LibelleAliment=$LibelleAliment;
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
				$this->$methode($value);
			}
		}
	}
}
<?php

class ConsolesAccessoires 
{

	/*****************Attributs***************** */

	private $_idConsoleAccessoire;
	private $_idAccessoire;
	private $_idConsole;
	private static $_attributes=["idConsoleAccessoire","idAccessoire","idConsole"];
	/***************** Accesseurs ***************** */


	public function getIdConsoleAccessoire()
	{
		return $this->_idConsoleAccessoire;
	}

	public function setIdConsoleAccessoire(int $idConsoleAccessoire)
	{
		$this->_idConsoleAccessoire=$idConsoleAccessoire;
	}

	public function getIdAccessoire()
	{
		return $this->_idAccessoire;
	}

	public function setIdAccessoire(?int $idAccessoire)
	{
		$this->_idAccessoire=$idAccessoire;
	}

	public function getIdConsole()
	{
		return $this->_idConsole;
	}

	public function setIdConsole(?int $idConsole)
	{
		$this->_idConsole=$idConsole;
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
		return "IdConsoleAccessoire : ".$this->getIdConsoleAccessoire()."IdAccessoire : ".$this->getIdAccessoire()."IdConsole : ".$this->getIdConsole()."\n";
	}
}
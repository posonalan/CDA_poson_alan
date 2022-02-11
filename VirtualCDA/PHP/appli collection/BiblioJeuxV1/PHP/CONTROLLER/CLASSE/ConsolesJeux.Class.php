<?php

class ConsolesJeux 
{

	/*****************Attributs***************** */

	private $_idConsoleJeu;
	private $_idJeu;
	private $_idConsole;
	private static $_attributes=["idConsoleJeu","idJeu","idConsole"];
	/***************** Accesseurs ***************** */


	public function getIdConsoleJeu()
	{
		return $this->_idConsoleJeu;
	}

	public function setIdConsoleJeu(int $idConsoleJeu)
	{
		$this->_idConsoleJeu=$idConsoleJeu;
	}

	public function getIdJeu()
	{
		return $this->_idJeu;
	}

	public function setIdJeu(?int $idJeu)
	{
		$this->_idJeu=$idJeu;
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
		return "IdConsoleJeu : ".$this->getIdConsoleJeu()."IdJeu : ".$this->getIdJeu()."IdConsole : ".$this->getIdConsole()."\n";
	}
}
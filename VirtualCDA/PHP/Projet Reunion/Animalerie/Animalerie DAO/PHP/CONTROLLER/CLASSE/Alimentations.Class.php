<?php

class Alimentations {



/*****************Attributs***************** */

private $_idAliment;
private $_libelleAliment;

private static $_attributes=["idAliment","libelleAliment"];




/***************** Accesseurs ***************** */

public function getIdAliment()
{
return $this->_idAliment;
}

public function setIdAliment(int $idAliment)
{
$this->_idAliment = $idAliment;
}

public function getLibelleAliment()
{
return $this->_libelleAliment;
}

public function setLibelleAliment(string $libelleAliment)
{
$this->_libelleAliment = $libelleAliment;
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
				$this->$methode($value);
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
		return 
        "\n******".
        "IdAliment : ".$this->getIdAliment().
        "LibelleAliment : ".$this->getLibelleAliment().
        "\n";
	}









}
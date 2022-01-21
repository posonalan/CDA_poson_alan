<?php

class MilieuVies {



/*****************Attributs***************** */

private $_idMilieuVie;
private $_libelleMilieuVie;
private $_situationGeographique;
private $_climat;


private static $_attributes=["idMilieuVie","libelleMilieuVie","situationGeographique","climat"];

/***************** Accesseurs ***************** */


public function getIdMilieuVie()
{
return $this->_idMilieuVie;
}

public function setIdMilieuVie($idMilieuVie)
{
$this->_idMilieuVie = $idMilieuVie;
}

public function getLibelleMilieuVie()
{
return $this->_libelleMilieuVie;
}

public function setLibelleMilieuVie($libelleMilieuVie)
{
$this->_libelleMilieuVie = $libelleMilieuVie;
}

public function getSituationGeographique()
{
return $this->_situationGeographique;
}

public function setSituationGeographique($situationGeographique)
{
$this->_situationGeographique = $situationGeographique;
}

public function getClimat()
{
return $this->_climat;
}

public function setClimat($climat)
{
$this->_climat = $climat;
}

static public function getAttributes()
{
return self::$_attributes;
}

static public function setAttributes($attributes)
{
self::$_attributes = $attributes;
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
        "IdMilieuVie : ".$this->getIdMilieuVie().
        "LibelleMilieuVie : ".$this->getLibelleMilieuVie().
		"Situation Geographique : ".$this->getSituationGeographique().
		"Climat : ".$this->getClimat().
        "\n";

	}



}



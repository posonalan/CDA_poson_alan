<?php

class Animaux {



/*****************Attributs***************** */

private $_idAnimal;
private $_libelleAnimal;
private $_prix;
private $_dateDeNaissance;
private $_idAliment;
private $_idMilieuVie;

private static $_attributes=["idAnimal","libelleAnimal","prix","dateDeNaissance","idAliment","idMilieuVie"];

/***************** Accesseurs ***************** */

public function getIdAnimal()
{
return $this->_idAnimal;
}

public function setIdAnimal($idAnimal)
{
$this->_idAnimal = $idAnimal;
}

public function getLibelleAnimal()
{
return $this->_libelleAnimal;
}

public function setLibelleAnimal($libelleAnimal)
{
$this->_libelleAnimal = $libelleAnimal;
}

public function getPrix()
{
return $this->_prix;
}

public function setPrix($prix)
{
$this->_prix = $prix;
}

public function getDateDeNaissance()
{
return $this->_dateDeNaissance;
}

public function setDateDeNaissance($dateDeNaissance)
{
$this->_dateDeNaissance = $dateDeNaissance;
}

public function getIdAliment()
{
return $this->_idAliment;
}

public function setIdAliment($idAliment)
{
$this->_idAliment = $idAliment;
}

public function getIdMilieuVie()
{
return $this->_idMilieuVie;
}

public function setIdMilieuVie($idMilieuVie)
{
$this->_idMilieuVie = $idMilieuVie;
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
        "IdAnimal : ".$this->getIdAnimal().
        "LibelleAnimal : ".$this->getLibelleAnimal().
		"Prix : ".$this->getPrix().
		"Date de naissance : ".$this->getDateDeNaissance().
		"idAliment : ".$this->getIdAliment().
		"idMilieuVie : ".$this->getIdMilieuVie().
        "\n";

	}

	






}



<?php



class Enfant{
private $_nom;
private $_prenom;
private $_age;

public function getNom()
{
return $this->_nom;
}

public function setNom($nom)
{
$this->_nom = $nom;
}

public function getPrenom()
{
return $this->_prenom;
}

public function setPrenom($prenom)
{
$this->_prenom = $prenom;
}

public function getAge()
{
return $this->_age;
}

public function setAge($age)
{
$this->_age = $age;
}

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
            $methode = "set" . ucfirst($key); //ucfirst met la 1ere lettre en majuscule
            if (is_callable(([$this, $methode]))) // is_callable verifie que la methode existe
            {
                $this->$methode($value);
            }
        }
    }

    public function toString()
    {
        return "*** Enfant ***  Nom :" . $this->getNom() . "\nPrenom :" . $this->getPrenom() . "\nAge :" . $this->getAge()."\n";
    }


public function ChequeNoelEnfant(){

    /* on va chercher l'age */ 
    $a = $this->getAge();

    /* si son age est inferieur a 11 ans */ 
    if ($a >=0 && $a<11 ){

        return 20; /* euro */ 

    }
    /* si inferieur a 16 ans */
    else if ( $a<16 ){

        return 30; /* euro */ 

    }
    /* si inferieur a 16 ans */
    else if ( $a<19 ){

        return 50; /* euro */ 

    }
    else {
        return 0 ; /* retourne rien */ 
    }
}




}


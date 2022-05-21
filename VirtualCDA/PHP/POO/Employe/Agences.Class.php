<?php

class Agence {

    /* attribut */
    private $_Nom; 
    private $_Adresse; 
    private $_CodePostal;
    private $_Ville;
    private $_Restauration;


    public function getNom()
    {
        return $this->_Nom;
    }

    public function setNom($Nom)
    {
        $this->_Nom = $Nom;
    }

    public function getAdresse()
    {
        return $this->_Adresse;
    }

    public function setAdresse($Adresse)
    {
        $this->_Adresse = $Adresse;
    }

    public function getCodePostal()
    {
        return $this->_CodePostal;
    }

    public function setCodePostal($CodePostal)
    {
        $this->_CodePostal = $CodePostal;
    }

    public function getVille()
    {
        return $this->_Ville;
    }

    public function setVille($Ville)
    {
        $this->_Ville = $Ville;
    }

    public function getRestauration()
    {
        return $this->_restauration;
    }

    public function setRestauration($restauration)
    {
        $this->_restauration = $restauration;
    }



    /* Construct */ 


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
    return "Nom :" . $this->getNom() . "\nAdresse :" . $this->getAdresse()."\nCode postal : " . $this->getCodePostal()."\nVille : " . $this->getVille(). "\nRestauration :" . $this->getRestauration();

}
    
}
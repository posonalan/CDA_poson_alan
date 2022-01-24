<?php

class Client
{
 /* attributs */ 

    public $_nom;
    public $_prenom;
    public $_age;

    /* assesseurs */ 

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
              $methode = "set" . ucfirst($key); //ucfirst met la 1ere lettre en majuscule
              if (is_callable(([$this, $methode]))) // is_callable verifie que la methode existe
              {
                  $this->$methode($value);
              }
          }
      }

      public function toString()
      {
          return " ***** Client *****\n".
          " Nom : ". $this->getNom()."\n".
         "Prenom : ".$this->getPrenom()."\n".
         "Age : ".$this->getAge()."\n"
         ;
      }




  
    }

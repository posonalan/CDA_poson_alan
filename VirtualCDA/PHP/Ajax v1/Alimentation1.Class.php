<?php

class Alimentation1 implements JsonSerializable
{

    /*****************Attributs***************** */
    private $_libelleAliment;
    private $_typeAliment;
    private $_poid;
    private $_couleur; 

    /*****************Accesseurs***************** */



    public function getLibelleAliment()
    {
        return $this->_libelleAliment;
    }

    public function setLibelleAliment($libelleAliment)
    {
        $this->_libelleAliment = $libelleAliment;
    }

    public function getTypeAliment()
    {
        return $this->_typeAliment;
    }

    public function setTypeAliment($typeAliment)
    {
        $this->_typeAliment = $typeAliment;
    }

    public function getPoid()
    {
        return $this->_poid;
    }

    public function setPoid($poid)
    {
        $this->_poid = $poid;
    }

    public function getCouleur()
    {
        return $this->_couleur;
    }

    public function setCouleur($couleur)
    {
        $this->_couleur = $couleur;
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
          return "";
      }

      public function jsonSerialize()
      {
          return 
          [
              'Nom de l\'aliment ' => $this->getLibelleAliment(),
              'Type de l\'aliment' => $this->getTypeAliment(),
              'Poid de l\'aliment'=>$this->getPoid(),
              'Couleur de l\'aliment'=>$this->getCouleur()
          ];
      }

}
<?php

class Alimentation2 
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

      public static function XMLEncode(Alimentation2 $a)
      {
          return 
          [
              'Nom de l\'aliment ' => $a->getLibelleAliment(),
              'Type de l\'aliment' => $a->getTypeAliment(),
              'Poid de l\'aliment'=>$a->getPoid(),
              'Couleur de l\'aliment'=>$a->getCouleur()
          ];
      }

}
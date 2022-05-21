<?php



class MilieuVie
{




    /* attributs */


    private $_idMilieuVie;
    private $_libelleMilieuVie;
    private $_typeMilieuVie;


    /* accesseur */

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

    public function getTypeMilieuVie()
    {
        return $this->_typeMilieuVie;
    }

    public function setTypeMilieuVie($typeMilieuVie)
    {
        $this->_typeMilieuVie = $typeMilieuVie;
    }



    /* constructeur */


    public function __construct(array $options = [])
    {
        if (!empty($options)) // empty : renvoi vrai si le tableau est vide
        {
            $this->hydrate($options);
        }
    }
    public function hydrate($data)
    {
        foreach ($data as $key => $value) {
            $methode = "set" . ucfirst($key); //ucfirst met la 1ere lettre en majuscule
            if (is_callable(([$this, $methode]))) // is_callable verifie que la methode existe
            {
                $this->$methode($value);
            }
        }
    }



    


}

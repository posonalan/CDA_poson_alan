<?php 

class Employe {
    
    /* attribut */
    private $_Nom; 
    private $_Prenom; 
    private $_DateEmboche;
    private $_Fonction; /* Poste */ 
    private $_Salaire; /* en k euros brut annuel */
    private $_Service; /* exemple compta, commercial ... */ 
    private $_agence;
    private $_enfants = [];
   

    /* accesseur */ 

    public function getNom()
    {
        return $this->_Nom;
    }

    public function setNom($Nom)
    {
        $this->_Nom = $Nom;
    }

    public function getPrenom()
    {
        return $this->_Prenom;
    }

    public function setPrenom($Prenom)
    {
        $this->_Prenom = $Prenom;
    }

    public function getDateEmboche()
    {
        return $this->_DateEmboche;
    }

    public function setDateEmboche($DateEmboche)
    {
        $this->_DateEmboche = $DateEmboche;
    }

    public function getFonction()
    {
        return $this->_Fonction;
    }

    public function setFonction($Fonction)
    {
        $this->_Fonction = $Fonction;
    }

    public function getSalaire()
    {
        return $this->_Salaire;
    }

    public function setSalaire($Salaire)
    {
        $this->_Salaire = $Salaire;
    }

    public function getService()
    {
        return $this->_Service;
    }

    public function setService($Service)
    {
        $this->_Service = $Service;
    }

    public function getAgence()
    {
        return $this->_agence;
    }

    public function setAgence(Agence $agence)
    {
        $this->_agence = $agence;
    }

    public function getEnfants()
    {
        return $this->_enfants;
    }

    public function setEnfants(array $enfants)
    {
        $this->_enfants = $enfants;
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

  /******* Autres methodes *******/
  public function calculeAnciennete()
  {
   
    // $dateEmbauche = strtotime($this->getDateEmbauche()); // On stocke la date d'embauche
    
    // $Anciennete = date('d/m/Y', '-'.date('Y', $dateEmbauche).' year', strtotime($date)); // On calcul le nombre d'année d'ancienneté
     
     $aujd = new DateTime("now");

 $Anciennete=date_diff($this->getDateEmboche(),$aujd);
var_dump(date_diff($this->getDateEmboche(),$aujd)); 
   return $Anciennete->Format('%Y'); // On retourne le nombre d'année

   // return (date_diff($this->getDateEmboche(), new DateTime("now")))->format('%Y');    
  }

public function PrimeAnnuel(){

   return $prime = $this->getSalaire() * 0.05; 
 
}

public function PrimeAnciennete(){

   return $primeAnciennet = $this->getSalaire() * 0.02 * $this->calculeAnciennete(); 

}


public function PrimeGeneral(){

 return $primeGeneral = round($this->PrimeAnnuel()+$this->PrimeAnciennete(),2); 
 /* arrondir 2 chiffre apres la virgule */ 

}

public function OrdreDeTransfert() {

//  $dateVersement = new DateTime('%Y,11,30'); 
 $aujd = new DateTime("now");
 

if( $aujd->format('m-d') == '01-04'){

echo "Ordre de transfert de ".$this->PrimeGeneral()."pour la salarié ".$this->getNom().".";
}
}

public function toString(){

    $aff = "\n\n*** Les Salariés ***\n";
        $aff .= "Nom :" . $this->getNom() . "\nPrenom :" . $this->getPrenom() . "\nDateEmbauche :" . $this->getDateEmboche()->format('Y-m-d') . "\nPosteEntreprise :" . $this->getFonction() . "\nSalaire annuel :" . $this->getSalaire() . "K€\nService :" . $this->getService() .
         "*** Agences : ***". $this->getAgence()->toString()."*** Enfants : ***".foreach($e as $key => $value){

            echo $value->toString(); 
            echo 'prime : '.$value->primeGeneral(); 
        } $this->getEnfants()->toString()."\n";
        return $aff;
}


public static function comparaisonNomPrenom($objA, $objB){

   if($objA ->getNom() < $objB->getNom()){
    return -1 ; 
}
    else if ($objA ->getNom() > $objB->getNom()){
        return 1; 
    }
    else if ($objA ->getPrenom() < $objB->getPrenom()){
        return -1; 
    }
    else if ($objA ->getPrenom() > $objB->getPrenom()){
        return 1; 
    }
    return 0; 
    
}


public static function comparaisonService($objA, $objB){

    if($objA ->getService() < $objB->getService()){
   return -1 ; 
 }
 else if ($objA ->getService() > $objB->getService()){
    return 1; 
}
    else if($objA ->getNom() < $objB->getNom()){
     return -1 ; 
 }
     else if ($objA ->getNom() > $objB->getNom()){
         return 1; 
     }
     else if ($objA ->getPrenom() < $objB->getPrenom()){
         return -1; 
     }
     else if ($objA ->getPrenom() > $objB->getPrenom()){
         return 1; 
     }
     return 0; 
     
 }
 
 public function salaireEmploye()
 {

 return $this->getSalaire() * 1000 + $this->primeGeneral() ;;
 }

 public function ChequeVacances()
    {

        return ($this->calculeAnciennete() >= 1); 
    }


    public function DroitAuxChequeNoel()
    {
        /* initialisation du tableau des cheque a 0 cheque */ 
        $chequeNoel = ["0" => 0, "20" => 0, "30" => 0, "50" => 0];
        /* on selectionne chaque enfant */ 
        foreach ($this->getEnfants() as $enfant)
        { /* des quils a le droit a un cheque on fait +1 */ 
            $chequeNoel[$enfant->montantChequeNoel()] += 1; 
        }
        /* si un enfant en a pas le droit on met un 0 */ 
        $chequeNoel["0"] = 0;    
        /* on retourne le nombre de cheque noel */   
                return $chequeNoel;
    }



}
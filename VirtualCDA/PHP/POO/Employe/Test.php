<?php

include "employe.Class.php";




$e[] = new employe(["nom"=>"lopez","prenom"=>"Jennifer","DateEmboche"=>new DateTime("1980-10-30"),"Fonction"=>"chanteuse","Salaire"=>15000,"Service"=>"playback"]);
$e[] = new employe(["nom"=>"polnareff","prenom"=>"michelle","DateEmboche"=>new DateTime("1989-02-12"),"Fonction"=>"chanteur","Salaire"=>20000,"Service"=>"pianiste"]);
$e[] = new employe(["nom"=>"Degaulle","prenom"=>"charles","DateEmboche"=>new DateTime("1996-02-03"),"Fonction"=>"general","Salaire"=>30000,"Service"=>"tankiste"]);
$e[] = new employe(["nom"=>"Bonaparte","prenom"=>"napoleon","DateEmboche"=>new DateTime("2006-03-01"),"Fonction"=>"empereur","Salaire"=>40000,"Service"=>"campagnard"]);
$e[] = new employe(["nom"=>"Mathieu","prenom"=>"mirelle","DateEmboche"=>new DateTime("2015-10-15"),"Fonction"=>"chanteuse","Salaire"=>480,"Service"=>"russie"]);

echo 'Il y a '.count($e).' employés dans l\'entreprise <div><br></div>'; 

echo 'Avant le tri <div><br></div>'; 
foreach($e as $key => $value){

    echo '<div>'.$value->toString(); 
    echo 'prime : '.$value->primeGeneral().'</div>'; 
}

usort ($e, array("employe", "comparaisonNomPrenom")); 

echo 'Apres le tri'; 
foreach($e as $key => $value){

    echo $value->toString(); 
    echo 'prime : '.$value->primeGeneral(); 
}

 function salaireEmploye($objA , $objB)
 { $masseSalarial = 0; 

    for ($i=0; $i < e[].length(); $i++) { 
       $masseSalarial = $e[$objA]->SalaireEmploye() + $e[$objB]->SalaireEmploye();  
$masseSalarialTotal = $masseSalarialTotal + $masseSalarial; 
      } 
    }  
}




// echo $e[0]->calculeAnciennete();

// echo $e[0]->PrimeAnnuel();

// echo $e[0]->PrimeAnciennete();

// echo $e[0]->OrdreDeTransfert(); 
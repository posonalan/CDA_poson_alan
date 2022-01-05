<?php

include "employe.Class.php";
include "Agences.Class.php";
include "Enfants.Class.php"; 

$a1 = new Agence(["Nom" => "gmail", "adresse" => "12 rue misi","restauration" => "restaurant d'entreprise" ,"codePostal" => "85959" , "ville" => "Maubeuge"]);
$a2 = new Agence(["Nom" => "hotmail", "adresse" => "154 rue cipi","restauration" =>"ticket restaurant" ,"codePostal" => "62636", "ville" => "Lievin"]);
$a3 = new Agence(["Nom" => "yahoo", "adresse" => "132 rue calcuta","restauration" =>"restaurant d'entreprise" ,"codePostal" => "87878", "ville" => "Sarcelle"]);

$enfant[] = new Enfant(["Nom" => "kilem", "Prenom" => "robert", "Age" => 12]);
$enfant[] = new Enfant(["Nom" => "wort", "Prenom" => "josephe", "Age" => 8]);
$enfant[] = new Enfant(["Nom" => "yuit", "Prenom" => "mini", "Age" => 6]);
$enfant[] = new Enfant(["Nom" => "juki", "Prenom" => "diantre", "Age" => 5]);
$enfant[] = new Enfant(["Nom" => "niji", "Prenom" => "kiwi", "Age" => 19]);

/* on ajoute les agences et les enfants exemple agence -> $a1( numero 1), enfant -> enfant[1] position 1 donc robert */ 
$e[] = new employe(["nom"=>"lopez","prenom"=>"Jennifer","DateEmboche"=>new DateTime("1980-10-30"),"Fonction"=>"chanteuse","Salaire"=>15000,"Service"=>"playback","agence"=>$a1 ,"enfants"=>[$enfant[1]]]);
$e[] = new employe(["nom"=>"polnareff","prenom"=>"michelle","DateEmboche"=>new DateTime("1989-02-12"),"Fonction"=>"chanteur","Salaire"=>20000,"Service"=>"pianiste","agence"=>$a1,"enfants"=>[$enfant[2]]]);
$e[] = new employe(["nom"=>"Degaulle","prenom"=>"charles","DateEmboche"=>new DateTime("1996-02-03"),"Fonction"=>"general","Salaire"=>30000,"Service"=>"tankiste","agence"=>$a1,"enfants"=>[$enfant[3]]]);
$e[] = new employe(["nom"=>"Bonaparte","prenom"=>"napoleon","DateEmboche"=>new DateTime("2006-03-01"),"Fonction"=>"empereur","Salaire"=>40000,"Service"=>"campagnard","agence"=>$a2,"enfants"=>[$enfant[4]]]);
$e[] = new employe(["nom"=>"Mathieu","prenom"=>"mirelle","DateEmboche"=>new DateTime("2015-10-15"),"Fonction"=>"chanteuse","Salaire"=>480,"Service"=>"russie","agence"=>$a2,"enfants"=>[$enfant[5]]]);

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

 function salaireEmploye($e)
 { $masseSalarialeTotale = 0; 
    foreach ($e as $elt){
    $masseSalarialeTotale += $elt->masseSalariale();
      } 
      echo "La masse salariale totale est de " . $masseSalarialeTotale . "\n";
    }  
// echo $e[1]->Tostring(); 
// echo salaireEmploye(); 




// echo $e[0]->calculeAnciennete();

// echo $e[0]->PrimeAnnuel();

// echo $e[0]->PrimeAnciennete();

// echo $e[0]->OrdreDeTransfert(); 
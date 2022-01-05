<?php
/* affichage de se quil y a dans les inputs */ 
var_dump($_POST);
/* on crée un nouveau produit avec le contenu des inputs */ 
$p = new Produits($_POST);
var_dump($p);
/* on recupere le mode dans l'http suivant sur quoi tu a taper */ 
switch ($_GET['mode']) {
    case "Ajouter": {
            ProduitsManager::add($p);
            break;
        }
    case "Modifier": {

            ProduitsManager::update($p);
            break;
        }
    case "Supprimer": {

            ProduitsManager::delete($p);
            break;
        }
}

header("location:index.php?page=listeProduit");

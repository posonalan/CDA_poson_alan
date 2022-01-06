<?php
/* affichage de se quil y a dans les inputs */ 
var_dump($_POST);
/* on crée un nouveau produit avec le contenu des inputs */ 
$p = new Animaux($_POST);
var_dump($p);
/* on recupere le mode dans l'http suivant sur quoi tu a taper */ 
switch ($_GET['mode']) {
    case "Ajouter": {
            AnimauxManager::add($p);
           
            break; 
        }
    case "Modifier": {

            AnimauxManager::update($p);
            break;
        }
    case "Supprimer": {

            AnimauxManager::delete($p);
            break;
        }
}

header("location:index.php?page=listeAnimaux");

<?php
$pasDErreur = true;
//var_dump($_POST);
$p = new Animaux($_POST);
//var_dump($p);
switch ($_GET['mode']) {
    case "Ajouter": {
            $pasDErreur = AnimauxManager::add($p);
            break;
        }
    case "Modifier": {

            $pasDErreur = AnimauxManager::update($p);
            break;
        }
    case "Supprimer": {

            $pasDErreur = AnimauxManager::delete($p);
            break;
        }
}

if ($pasDErreur) { // si pas d'erreur
    header("location:index.php?page=listeAnimaux");
} else {
    header("location:index.php?page=erreur&cible=listeAnimaux&codeErreur=erreur" . $_GET['mode']);
}


<?php

 var_dump($_POST);
/* le mot de passe est egal au mot de passe de confirmation */ 
if ($_POST['motDePasse'] == $_POST['confirmation']) {
    // recherche si le pseudo existe
    $uti = UtilisateursManager::findByAdresseMail($_POST['adresseMail']);
    /* si le pseudo n'existe pas */ 
    if ($uti == false) {
        /* on crée un nouvelle utilisateur */ 
        $u = new Utilisateurs($_POST);
        //encodage du mot de passe
        $u->setMotDePasse(crypte($u->getMotDePasse()));
        /* la fonction ajouté de l'utilisateur */ 
        UtilisateursManager::add($u);
        
        // header("location:index.php?page=inscription");
    } else {
        echo '<div class="erreur">le pseudo existe deja</div>';
    }
} else {

    echo '<div class="erreur">la confirmation ne correspond pas au mot de passe</div>';
}var_dump($uti); 
// header("refresh:3;url=index.php?page=inscription");

<?php
if ($_POST['motDePasse'] == $_POST['confirmPassword']) {
    $adresseUsed = UtilisateursManager::getList(['adresseMail'],['adresseMail' => $_POST['adresseMail']]);
     if($adresseUsed == null){
        $u = new Utilisateurs($_POST);
        /* des que l'on crée un utilisateur on lui met un role 1 */ 
        $u -> setRole(1);
        /* on crypte son mdp */ 
        $u->setMotDePasse(crypte($u->getMotDePasse()));
        UtilisateursManager::add($u);
        /* on le connecte */ 
        $_SESSION['utilisateur'] = $u;
        header("location:index.php?page=Catalogue");
     }
     else {
        header("location:index.php?page=Default");
    }
} else {
    header("location:index.php?page=Default");
}
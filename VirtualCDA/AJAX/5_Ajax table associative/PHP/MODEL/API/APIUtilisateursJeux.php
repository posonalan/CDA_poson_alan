<?php
$id = $_POST['idUtilisateur'];

// // La vue permet de récupérer les oeuvres d'un auteur
// echo json_encode( AuteursOeuvresManager::getListByAuteur($id,true));
// // var_dump($listeDepartement);

// sans vue on aurait du faire

// //on recupere la liste des creations 
// $listeProfiles = ProfilesManager::getListByUtilisateurs($id, false);
$listeProfiles = ProfilesManager::getList(null,["idUtilisateur" => $id]);
// var_dump($listeProfiles);
//on transforme les objets en une liste d'idOeuvre
$listeIdJeu = "(";
foreach ($listeProfiles as $value) {
    $listeIdJeu .= $value->getIdJeu().",";
}
//on enleve la derniere , et on ajoute )
$listeIdJeu = substr($listeIdJeu,0,strlen($listeIdJeu)-1);
$listeIdJeu .=")";
//on recupere les oeuvre pour envoyer à l'API
$listeJeux = JeuxManager::getListbyId($listeIdJeu,true);
echo json_encode($listeJeux);
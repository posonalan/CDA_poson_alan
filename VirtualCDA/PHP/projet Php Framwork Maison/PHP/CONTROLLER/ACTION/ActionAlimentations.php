<?php


/* action realiser sur la table categorie */ 
/* initialisation de la variable erreur a faux */ 
$erreur = false;
 //var_dump($_POST);
 /* on crée un nouvelle objet categorie qu'on met dans une variable p , la methode post permet de faire une demande a la base de données */ 
$p = new Alimentations($_POST); 
 // var_dump($p);
 /* la methode get permet de recevoir de la base de données */ 
switch ($_GET['mode']) { /* suivant le mode reçu */ 
    case "Ajouter": {
            AlimentationsManager::add($p);
            break;
        }
    case "Modifier": {
            AlimentationsManager::update($p);
            break;
        }
    case "Supprimer": {
        /* on va chercher l'id de la categorie a supprimer dans la liste des Animaux */ 
            $listeAnimaux = AnimauxManager::getListByAlimentation($p->getIdAliment());
            /**** Technique informative */
            //    if (count($listeProduit)>0)
            //    {
            //        echo 'Il reste des Animaux';
            //        $erreur=true;

            //    }
            //    else{
            //     AlimentationsManager::delete($p);
            //    }

            /**** Technique de suppression en cascade */
            /* on recherche dans la liste des Animaux un Animaux et on le supprime */ 
            foreach ($listeAnimaux as $unAnimal) {
                AnimauxManager::delete($unAnimal);
            }
            AlimentationsManager::delete($p);
            break;
        }
}

if (!$erreur) {  // si pas d'erreur
    header("location:index.php?page=listeAlimentations");   //redirection directe
} else {
    header("refresh:3;url=index.php?page=listeAlimentations");    // on attend 3 secondes avant la redirection
}

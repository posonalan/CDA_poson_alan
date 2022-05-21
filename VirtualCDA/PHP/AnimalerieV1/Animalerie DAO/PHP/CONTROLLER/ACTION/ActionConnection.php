<?php
/* on va demander les pseudo */ 
$uti = UtilisateursManager::findByPseudo($_POST['pseudo']);
/* si le pseudo est bon ( donc different de faux )*/ 
if ($uti != false) {
/* si le mot de passe crypter est egal a cryptage de la bdd alors cest bon */ 
    echo "motBDD " . $uti->getMotDePasse() . "  saisi" . $_POST['motDePasse'] . "crypte   " . crypte($_POST['motDePasse']) . "<br>";
    if (crypte($_POST['motDePasse']) == $uti->getMotDePasse()) {
        /* la connexion est reussie */ 
        echo 'connection reussie';
        /* la session appartient a cette utilisateur */ 
        $_SESSION['utilisateur'] = $uti;
        /* redirection a l'acceuil */ 
        header("location:index.php?page=accueil");
    } else {
        echo '<div class="erreur">le mot de passe est incorrect</div>';
        header("refresh:3;url=index.php?page=connection");
    }
} else {
    echo '<div class="erreur">le pseudo n\'existe pas</div>';
    header("refresh:3;url=index.php?page=connection");
}

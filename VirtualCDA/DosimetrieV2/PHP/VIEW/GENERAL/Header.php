<body class="colonne">

    <header>

        <div class="flex05"></div>

       <div><img src="./IMG/logoEngie.png" alt="LogoAppli"></div>
       <div class="flex05"></div>
        <!-- <div class="titre"><?php echo texte($titre); ?></div> -->
        <div class="colonne headInfo">
            <?php

            if (isset($_SESSION['utilisateur'])) {
                echo '  <div class="colonne">
                        <div class="flex02"></div>
                        <div class="center Nom flex05">'. $_SESSION['utilisateur']->getNom() ." ". $_SESSION['utilisateur']->getPrenom().'</div>
                        <div  class="flex01"></div>
                        ';
                  echo '<div class="">
                        <div ></div>
                        <div class="colonne">
                            <div></div>
                            <a href="index.php?page=FormReinitMdp&id='.$_SESSION['utilisateur']->getIdUtilisateur().' " class="center boutonAdd">'. texte("Changer Mdp") .'</a>
                            <div></div>
                            <div></div>
                            <a href="index.php?page=ActionDeconnexion" class="center boutonAdd">'. texte("Deconnexion") .'</a>
                            <div></div>
                        </div>
                        <div></div>
                    </div>';
            } else {
                // echo '<a href="index.php?page=Default" class="center">'. texte("Connexion") .'</a>';
                // echo '<a href="index.php?page=Inscription" class="center">'. texte("Inscription") .'</a>';
                // echo '<div></div>';
             }
            ?>

        </div>
        <div class="flex01"></div>
        <?php
            //Si utilisateur est connecté affichage du menu.
            if (isset($_SESSION['utilisateur'])) {
                echo '';
            }
        ?>
        </div>
    </header>
    
    <main class=" backgroundAcc">
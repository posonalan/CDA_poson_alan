<body class="colonne">
    <header>
        <div class="demi"></div>
        <div><img src="IMG/logo.jpg" alt="logoSac"></div>
        <div class="demi"></div>
        <div class="demi"></div>
        <div class="titre colorTitre"><?php echo $titre; ?></div>
        <div class="colonne">
            <?php

            if (isset($_SESSION['utilisateur'])) {
                echo '<div class="colorTitre center">'. texte('Bonjour') ." ". $_SESSION['utilisateur']->getNom() . '</div>';
                echo '<div><a href="index.php?page=ActionDeconnexion" class="center">'. texte("Deconnexion") .'</a></div>';
            } else {
                echo '<a href="index.php?page=Default" class="center">'. texte("Connexion") .'</a>';
            }
            ?>

        </div>
        <div class="demi"></div>
        
    </header>
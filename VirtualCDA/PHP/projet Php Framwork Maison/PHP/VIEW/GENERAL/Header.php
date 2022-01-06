<body class="colonne">
    
    <header>

<div class="colonne">

<div class="espaceH"></div>






        <div class="demi"></div>
        <div></div>
        <div class ="logoAnimalerie">
            <img src="./IMG/titreAnimalerie.png" alt="">
        </div>
        <div class="titre font-family"><?php echo $titre; ?></div>
 
        
        <div class="colonne">
            <?php

            if (isset($_SESSION['utilisateur'])) {
                echo '<div class="texteColore">Pseudo : ' . $_SESSION['utilisateur']->getNom() . '</div>';
                echo '<div class="font-family"><a href="index.php?page=deconnection">Déconnecter</a></div>';
            } else {
                echo '<a href="index.php?page=connection">Connecter</a>';
            }
            ?>

        </div>
        <div class="demi"></div>
        
        <div class="espaceH"></div>
</div>

    </header>
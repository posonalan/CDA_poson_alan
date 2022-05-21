<?php
global $regex;
?>

<main class="colonne ">
    <div class="bigEspace"></div>
    <div class="bigEspace"></div>
    <div class="bigEspace"></div>
    <div class="espace"></div>
    <div>
        <div class="demi"></div>
        <section class="center colonne border borderRadius relative">
            <div id="iconCo" class="border center colonne">
                <div id="teteIconCo"></div>
                <div id="corpsIconCo"></div>
            </div>
            <div class="bigEspace"></div>
            <div class="bigEspace"></div>
            
            <form class="formCo" action="index.php?page=ActionConnexion" method="POST">
                <div class="colSpan2 center">
                    <h1 class="LettreCo"><?php echo texte('Connexion') ?></h1>
                </div>
                <label for="adresseMail" class="LettreCo"><?php echo texte('AdresseEmail') ?> : </label>
                <div class="espace"></div>
                <input type="text" name="adresseMail" required>
                <div class="espace"></div>
                <label for="motDePasse" class="LettreCo"><?php echo texte('Mdp') ?> : </label>
                <div class="espace"></div>
                <div class="relative">
                    <input type="Password" name="motDePasse" required>
                    <i class="oeil fas fa-eye"></i>
                </div>
                <div></div>
                <div></div>
                <div></div>
                <div class="espace"></div>
                <div class=" ">
                    <input class="boutonAdd titreObjet" type="submit" value="<?php echo texte('Connexion') ?>">
                </div>   
            </form>

        </section>
        <div class="demi"></div>
    </div>
    <div class="espace"></div>
    <div class="bigEspace"></div>
    <div class="bigEspace"></div>
    <div class="bigEspace"></div>
    <div class="bigEspace"></div>
    <div class="bigEspace"></div>
</main>
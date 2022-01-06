<html>

<div class="espaceh"></div>

</html>
<?php

if (isset($_SESSION['utilisateur'])) {
    if ($_SESSION['utilisateur']->getRole() == 1) {

        $classeCouleur = "blue"; // l'admin voir les boutons bleu
        echo '<nav>
        <button class="crudBtn crudBtnRetour ' . $classeCouleur . '"><a href="index.php?page=listeAnimaux">Animaux</a></button>
       </nav>';
    } else {
        $classeCouleur = "green"; //les utilisateurs Vert
        echo '<nav>
        <button class="crudBtn crudBtnRetour ' . $classeCouleur . '"><a href="index.php?page=listeAnimaux">Animaux</a></button>
        <button class="crudBtn crudBtnRetour ' . $classeCouleur . '"><a href="index.php?page=listeAlimentations">Alimentations</a></button>
        <button class="crudBtn crudBtnRetour ' . $classeCouleur . '"><a href="index.php?page=listeMilieuVie">Milieu Vie</a></button>
        </nav>';
    }

  
}

<header>
    <div class ="headerP1">
    <div class="haut">
        <div class="hautPartie0">
        <div class="espace"></div>
     
     <a href="http://planeteanimal.com"><img src="./IMG/France.png" alt=""/></a>
            <div class="espace"></div>
            <div class="espace"></div>
            <a href="https://support.wwf.org.uk/adopt-an-animal"><img src="./IMG/anglais.jpg" alt=""/></a>   
    
        </div>
        
        <div class="hautPartie1">
        <div class="espace"></div>
        
        
       
            <img src="./IMG/chat.png" alt="" /></div>
           
        <div class="hautPartie2 textemulticolore">Animal'N'Co</div>
        <div class="hautPartie1"><img src="./IMG/chien.png" alt="" /></div>
         <div class="hautPartie0">
        <div class="espace"></div>
<!--      
     <a href="http://planeteanimal.com"><img src="./IMG/France.png" alt=""/></a>
            <div class="espace"></div>
            <div class="espace"></div>
            <a href="https://support.wwf.org.uk/adopt-an-animal"><img src="./IMG/anglais.jpg" alt=""/></a>    -->
    
        </div>
        
        <!-- <div class="hautPartie4">
            <div class="logo"><img src="./IMG/tel.png" alt="" /><a href="http://www.exempledesiteweb.com/exemple.html#blablabla"></div>
   <div ><img src="./IMG/facebook.png" alt="" /><a href="http://www.exempledesiteweb.com/exemple.html#blablabla"></div>
            <div class="logo"><img src="./IMG/twitter.png" alt="" /><a href="http://www.exempledesiteweb.com/exemple.html#blablabla"></div>
     
        </div> -->

            <?php

            if (isset($_SESSION['utilisateur'])) {
                echo ' <div class = "iconCo"><img src="./IMG/iconCo.png"></div>';
                echo '<div class="texteColore centrer">Bonjour' . " " . $_SESSION['utilisateur']->getNom() . '</div>';
                echo '  <div class="espaceG"></div>';
                echo '<div><a href="index.php?page=deconnection" class="deco centrer">Deconnecter</a></div>';
            } else {
                echo '<a href="index.php?page=connection" class="texteColore centrer">Connexion</a>';
            }

            ?>

            <div></div>
        </div>
        <div class="test center">
            <div class="espaceMenu"></div>

            <!-- Icone de présence de menu -->
            <div>
                <i class="fas fa-bars fa-3x"></i>
            </div>
            <div class="espaceMenu"></div>
            <img src="./IMG/camion.png" alt="" />
            <div class="espacePetit"></div>
            <div class="textMenu">Livraison offerte dès 49 €</div>

            <div class="espaceMenu"></div>
            <img src="./IMG/carton.png" alt="" />
            <div class="espacePetit"></div>
            <div class="textMenu">Retour gratuit sous 30 jours</div>

            <div class="espaceMenu"></div>
            <img src="./IMG/sac.png" alt="" />
            <div class="espacePetit"></div>
            <div class="textMenu">Plus de 8.000 articles</div>
        </div>
    </div>

    </div>
</header>
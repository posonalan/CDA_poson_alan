<div class="colonne ">
    <div class="bigEspace"></div>
    <div class="bigEspace"></div>
    <div>
        <div class="demi"></div>

        <a href="?page=ListeProtections2">
            <div class="categAccueil">
                <div class="espace"></div>
                <img src="./IMG/securite.jpg">
                <div class="espace"></div>
                <div class="">Protection dosimetrique</div>
                <div class="espace"></div>
            </div>
        </a>

        <div class="demi"></div>

        <a href="?page=Localisation">
            <div class="categAccueil">
                <div class="espace"></div>
                <img src="./IMG/localisation.png">
                <div class="espace"></div>
                <div class="">Localisation</div>
                <div class="espace"></div>
            </div>
        </a>

        <div class="demi"></div>

        <a href="?page=ListeOperations2">
            <div class="categAccueil">
                <div class="espace"></div>
                <img src="./IMG/technicien.jpg">
                <div class="espace"></div>
                <div class="">Operation</div>
                <div class="espace"></div>
            </div>
        </a>

        <div class="demi"></div>

    </div>
    <div class="bigEspace"></div>

    <div>
        <div class="demi"></div>
        <div class="demi"></div>

        <a href="?page=ListeDosimetriesUtilisateurs">
            <div class="categAccueil">
                <div class="espace"></div>
                <img src="./IMG/atome.jpg">
                <div class="espace"></div>
                <div class="">Dosimetrie </div>
                <div class="espace"></div>
            </div>
        </a>

        <?php
        if($_SESSION["utilisateur"]->getIdRole()>1){
            echo'
        <div class="demi"></div>

        <a href="?page=ListeUtilisateurs">
            <div class="categAccueil">
                <div class="espace"></div>
                <img src="./IMG/salarie.jpg">
                <div class="espace"></div>
                <div class=""> Personnel</div>
                <div class="espace"></div>
            </div>
        </a>
        ';
        }
        ?>
        
        <div class="demi"></div>
        <div class="demi"></div>
    </div>
    
    <div class="bigEspace"></div>
    <div class="bigEspace"></div>
   
    </div>
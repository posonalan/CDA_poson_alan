 
 <!-- mdp = Test@999 -->
 
 <div class="coinhaut hauteur"></div>

    <section class="center bgc1 hauteur ">
        <form action="index.php?page=actionConnection" method="POST">
            <div class="titre colSpan2 center">Connexion</div>
            <div class=" colSpan2 "></div>
            <div class=" colSpan2 "></div>
            <label>Adresse mail *</label>
            <input type="text" id="mail" name="adresseMail" title="Renseigner l'adresse mail utilisée lors de l'inscription"
                pattern="^[a-zA-Z]([\.\-_]?[a-zA-Z0-9])+@[a-zA-Z]([\.\-_]?[a-zA-Z0-9])+\.[a-zA-Z]{2,4}$" required>
            <label>Mot de passe *</label>
            <input type="password" id="pwd" name="motDePasse" required
                title="Renseigner le mot de passe envoyé dans le mail de confirmation">
               <div class=" colSpan2 "></div> 
            
          
            <div></div>
            <input type="submit" value="Connecter" disabled>
            <div class=" colSpan2 "></div> 
              <div class=" colSpan2 "></div>
        </form>
    </section>
    <section class="center bgc2 hauteur">
    <form action="index.php?page=actionInscription" method="POST">
            <div class="titre colSpan2 center">Inscription</div>
        
            <label>Nom *</label>
            <input type="text" id="nom" name="nom" pattern="^[a-zA-ZÀ-ÖØ-öø-ÿ'\-]*$" required
                title="Renseigner votre nom d'usage">
            <label>Prenom *</label>
            <input type="text" id="prenom" name="prenom" pattern="^[a-zA-ZÀ-ÖØ-öø-ÿ'\-]*$" required
                title="Renseigner votre prénom">
            <label>Adresse mail *</label>
            <input type="text" id="adresseMail" name="adresseMail"
                pattern="^[a-zA-Z]([\.\-_]?[a-zA-Z0-9])+@[a-zA-Z]([\.\-_]?[a-zA-Z0-9])+\.[a-zA-Z]{2,4}$" required
                title="Renseigner une adresse mail valide. Elle sera utilisée pour la connexion">
            <label>Téléphone </label>
            <input type="tel" id="telephone" name="telephone" pattern="^(0|\+33)[\d]{9}$" required>
            <label>Mot de passe </label>
            <div class="relative">
                <input type="password" id="motDePasse" name="motDePasse" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\W).{8,}$"
                    required>  
                     <i class="oeil fas fa-eye"></i>
           

                <fieldset id="infoMDP" class="noDisplay ">
                    <legend>Caractères du mot de passe</legend>
                    <div class="colonne">
                        <div >
                            <i class="fas fa-times-circle fa-red"></i>
                            <label for="">1 majuscule</label>
                        </div>
                        <div>
                            <i class="fas fa-times-circle fa-red"></i>
                            <label for="">1 minuscule</label>
                        </div>
                        <div>
                            <i class="fas fa-times-circle fa-red"></i>
                            <label for="">1 chiffre</label>
                        </div>
                        <div>
                            <i class="fas fa-times-circle fa-red"></i>
                            <label for="">1 caractère spécial</label>
                        </div>
                        <div>
                            <i class="fas fa-times-circle fa-red"></i>
                            <label for="">8 caractères</label>
                        </div>
                    </div>
                </fieldset>
            </div>
            <label>Confirmation </label>
<!-- <label> -->
            <div>
                <input type="password" id="confirmation" name="confirmation" required> 
                <i class="oeil fas fa-eye"></i>
               
            </div>
<!-- </label> -->
            <label>pseudo </label>
            <input type="text" id="pseudo" name="pseudo"  required
                title="pseudo">
                <label>role </label>
                <input type="number" id="role" name="role"  required
                title="role"> 
            
           
                <div class=" colSpan2 "></div>
                <div class=" colSpan2 "></div>
            
            <input type="reset" value="Reset">
            <input type="submit" value="Ajouter" disabled>
        </form>
    </section>
    <div class="coinbas hauteur"></div>
    <div class=" colSpan2 "></div>
    <script src="./JS/verifForm.js"></script>
    
    


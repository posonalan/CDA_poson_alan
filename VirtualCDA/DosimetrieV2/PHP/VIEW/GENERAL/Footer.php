</main>
<footer>
<div class="flex15"></div>
 <p class="flex1">© 2022 Réalisé par Alan Poson</p>
 <div class="flex01"></div>
<a class="linkedin flex01" href="https://www.linkedin.com/in/alan-poson-1163351b8/"><img src="./IMG/linkedin.png"   alt="lien linkedin vers Alan Poson" /></a>
<div class="flex15"></div>
</footer>
<?php
if($page[1]=="FormProtections" 
 || $page[1]=="FormChantiers"
 || $page[1]=="FormTranches"
 || $page[1]=="FormBatiments"
 || $page[1]=="FormActivites"
 || $page[1]=="FormOperations2"
 || $page[1]=="FormDosimetriesUtilisateurs"
 || $page[1]=="FormUtilisateurs"
 ){
 echo ' <script src="./JS/FormScript.js"></script>';
}


/* si la route est form on active verif form */
 if (substr($page[1],0,4)=="Form" || $page[0]=="Default"){

    echo'<script src="./JS/VerifForm.js"></script>
    ';

   echo '
    <script src="./JS/Activite.js"></script>

    <script src="./JS/ActiviteProtection.js"></script>';
 }else if ( $page[1]=="ListeDosimetriesUtilisateurs") {
echo'<script src="./JS/DosimetrieUtilisateur.js"></script>';
 } 
  if ( $page[1]=="FormOperations2") {
   echo'<script src="./JS/Deroulant.js"></script>';
    }
 echo ' <script src="./JS/script.js"></script>

 ';
//  <script src="./JS/Deroulant.js"></script>
echo '

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 </body>
</html>';
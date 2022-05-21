<?php
/* fermeture de la session donc la deconnexion */ 
session_destroy();

header("location:index.php?page=connection");

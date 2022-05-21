<?php
//fichier pour appel AJAX
include "../AnimauxManager.Class.php";
include "../../Controller/Parametre.Class.php";
include "../DbConnect.class.php";
Parametre::init();
DbConnect::init();
echo json_encode(AnimauxManager::count());
//echo PersonneManager::count();
<?php
//fichier pour appel AJAX
//var_dump($_POST);
$id=$_POST["idAnimal"];
echo json_encode(AnimauxManager::getById($id,true));

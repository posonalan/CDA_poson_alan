<?php

$id = $_POST['idBillet'];
echo json_encode( StagiaireManager::getListByBillet($id,true));


?>


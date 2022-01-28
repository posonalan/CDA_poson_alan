<?php

$id = $_POST['idMilieuVie'];
echo json_encode( AnimauxManager::getListByMilieuVie($id,true));


?>


<?php
// echo json_encode(JeuxManager::getList(false));

$id = $_POST['idUtilisateur'];
echo json_encode( ProfilesManager::getListByUtilisateurs($id,true));

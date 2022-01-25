<?php
 /* fichier pour appel AJAX on va chercher la liste */ 
echo json_encode(AnimauxManager::getList(true));

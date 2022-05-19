<?php

/**
 * Undocumented function
 *
 * @param string $table
 * @param [type] $nomId
 * @param [type] $colonne ça peut etre plusieurs colonne à concatener separé par une virgule
 * @param [type] $filtres sous forme de tableau
 * @param [type] $api  recoit true ou false
 * @param bool $limit reçoit un booléen true pour activer la limite
 * @param integer $debutLimit reçoit un int pour connaitre l'index ou va commencer la requête si $limit = true
 * @param integer $finLimit reçoit un int pour connaitre le nombre d'enregistrements à récupérer
 * @return 
 */
function creerRequete($table, $nomId, $colonne, $filtres, $api, $limit = false , $debutLimit = 0,$finLimit = 0)
{
    $table=strtolower($table);
    $db = DbConnect::getDb();
    $flag = false;
    $liste = [];
    $requete = 'SELECT DISTINCT ' . $nomId . ',' . $colonne . ' FROM ' . $table;
    foreach ($filtres as $filtre => $elt) {
        if ($elt != "" && $elt != "null")
        //Le flag sert à ne pas mettre le "And" la première fois et à mettre WHERE la première fois
        {
            if ($flag) {
                $requete .= " AND ";
            } else {
                $requete .= " WHERE ";
            }
            $flag = true;
            if (is_array($elt)) {
                $requete .= $filtre . ' IN("' . (implode('","', $elt)) . '")';
            } else {
                $requete .= $filtre . " = " . '"' . $elt . '"';
            }
        }
    }
    $requete .= " ORDER BY " . $colonne;

    if ($limit == true)
    {
        $requete .= " LIMIT ".$debutLimit.",".$finLimit;
    }
    // var_dump($requete);
    $q = $db->query($requete);
    while ($donnees = $q->fetch(PDO::FETCH_ASSOC)) {
        if ($donnees != false) {
            if ($api) {
                $liste[] = $donnees;
            } else {
                $liste[] = new $table($donnees);
            }
        }
    }
    // var_dump($liste);
    return $liste;
}


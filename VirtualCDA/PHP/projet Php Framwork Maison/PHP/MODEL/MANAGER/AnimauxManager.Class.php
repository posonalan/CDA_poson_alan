<?php
class AnimauxManager
{
    public static function add(Animaux $obj)
    {
        $db = DbConnect::getDb();
        $q = $db->prepare("INSERT INTO Animaux (libelleAnimal,prix,dateDeNaissance,idAliment, idMilieuVie) VALUES (:libelleAnimal,:prix,:dateDeNaissance,:idAliment, :idMilieuVie)");
        $q->bindValue(":libelleAnimal", $obj->getLibelleAnimal());
        $q->bindValue(":prix", $obj->getPrix());
        $q->bindValue(":dateDeNaissance", $obj->getDateDeNaissance());
        $q->bindValue(":idAliment", $obj->getIdAliment());
        $q->bindValue(":idMilieuVie", $obj->getIdMilieuVie());
        $q->execute();
    }

    public static function update(Animaux $obj)
    {
        $db = DbConnect::getDb();
        $q = $db->prepare("UPDATE Animaux SET libelleAnimal=:libelleAnimal, prix=:prix, dateDeNaissance=:dateDeNaissance, idAliment=:idAliment , idMilieuVie=:idMilieuVie WHERE idAnimal=:idAnimal");
        $q->bindValue(":libelleAnimal", $obj->getLibelleAnimal());
        $q->bindValue(":prix", $obj->getPrix());
        $q->bindValue(":dateDeNaissance", $obj->getDateDeNaissance());
        $q->bindValue(":idAliment", $obj->getIdAliment());
        $q->bindValue(":idAnimal", $obj->getIdAnimal());
         $q->bindValue(":idMilieuVie", $obj->getIdMilieuVie());
        $q->execute();
    }

    public static function delete(Animaux $obj)
    {
        $db = DbConnect::getDb();
        $db->exec("DELETE FROM Animaux WHERE idAnimal=" . $obj->getIdAnimal());
    }

    public static function findById($id)
    {
        $db = DbConnect::getDb();
        $id = (int) $id;  // on verifie que id est numerique, evite l'injection SQL
        $q = $db->query("SELECT * FROM Animaux WHERE idAnimal=" . $id);
        $results = $q->fetch(PDO::FETCH_ASSOC);
        if ($results != false)
        {
            return new Animaux($results);
        }
        else
        {
            return false;
        }
    }

    public static function getList()
    {
        $db = DbConnect::getDb();
        $liste = [];
        $q = $db->query("SELECT * FROM Animaux");
        while ($donnees = $q->fetch(PDO::FETCH_ASSOC))
        {
            if ($donnees != false)
            {
                $liste[] = new Animaux($donnees);
            }
        }
        return $liste;  // tableau contenant les objets Animaux
    }

    public static function getListByAlimentation($idAliment)
    {
        $idAliment=(int) $idAliment;
        $db = DbConnect::getDb();
        $liste = [];
        $q = $db->query("SELECT * FROM Animaux where idAliment=$idAliment");
        while ($donnees = $q->fetch(PDO::FETCH_ASSOC))
        {
            if ($donnees != false)
            {
                $liste[] = new Animaux($donnees);
            }
        }
        return $liste;  // tableau contenant les objets Animaux
    }

    public static function getListByMilieuVie($idMilieuVie)
    {
        $idMilieuVie=(int) $idMilieuVie;
        $db = DbConnect::getDb();
        $liste = [];
        $q = $db->query("SELECT * FROM Animaux where idMilieuVie=$idMilieuVie");
        while ($donnees = $q->fetch(PDO::FETCH_ASSOC))
        {
            if ($donnees != false)
            {
                $liste[] = new Animaux($donnees);
            }
        }
        return $liste;  // tableau contenant les objets Animaux
    }






}

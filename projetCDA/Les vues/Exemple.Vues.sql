Les vues : 

Creation de vue : 

CREATE VIEW nom_de_la_vue
AS
SELECT * FROM nom_table
WHERE...

exemple : 

create view produitFournisseur 
as 
select * from produit 
inner join fournis 

/*****/ 

Utilisation d''une vue : 

SELECT * FROM nom_de_la_vue

SELECT nomfou , libart 
FROM `produitfournisseur`
ORDER by nomfou asc

/*****/ 

Afficher la définition d''une vue : 

SHOW CREATE VIEW v_nomvue

SHOW CREATE VIEW produitfournisseur

/*****/ 

Modifier une vue : 

ALTER VIEW v_nomvue 
AS 
[NOUVELLE REQUETE]

alter view produitfournisseur 
as 
SELECT nomfou , libart, qtecde, obscom ,datcom 
 from fournis
  inner join produit 
  INNER join ligcom 
  inner join entcom 

ou 

CREATE OR REPLACE VIEW v_nomvue
AS
[NOUVELLE REQUETE]      


CREATE OR REPLACE VIEW test
AS
SELECT nomfou , libart, qtecde, obscom ,datcom 
 from fournis
  inner join produit 
  INNER join ligcom 
  inner join entcom 
/*****/ 

Supprimer une vue : 

DROP VIEW IF EXISTS v_nomvue 

DROP VIEW IF EXISTS produitfournisseur

/*****/ 

Definir des priviléges sur une vue : 

GRANT 
CREATE VIEW, 
SHOW VIEW 
ON `nom_base`.* TO 'utilisateur'@'adresse_ip'

GRANT 
CREATE VIEW, 
SHOW VIEW 
ON `papyrus`.* TO 'utilisateur'@'adresse_ip'

/*****/

Lister les vues existantes : 

SELECT * FROM information_schema.views 



procedure stocker : 


le delimiteur : 

$: DELIMITER _ 

parametre : 

 IN Entrée
 OUT Sortie
 INOUT Entrée et Sortie

 exemple : 

divise le stock :

 DELIMITER _ 
  CREATE PROCEDURE modifStk (in alan INT ) 
    BEGIN
            UPDATE produit SET stkphy = stkphy/ alan;
        END
        _

multiplie le stock :

 DELIMITER _ 
  CREATE PROCEDURE modifStkMulti (in alan INT ) 
    BEGIN
            UPDATE produit SET stkphy = stkphy* alan;
        END
        _



lance la procedure : 

 DELIMITER ;
 CALL modifStkMulti()
 ;

utilisation d''un parametre de retour

on utilise INTO pour voir le changement rechercher 

 DELIMITER |
 CREATE PROCEDURE  voirModif (OUT alan INT) 
    BEGIN
        SELECT COUNT(stkphy) INTO alan FROM produit;
    END
    |
 
recuperer le resultat 

 SET @n=0;
 CALL voirModif(@n);
 SELECT @n as cheveux;

supprimer une procedure 

 DROP PROCEDURE voirModif;

afficher une procedure : 

SHOW CREATE PROCEDURE modifStockMulti;

voir toute les procedures créée : 

SHOW PROCEDURE STATUS LIKE '%%'

declaration de variables : 

DECLARE alan CHAR(4);
 DECLARE i, j INT DEFAULT 0;

affecter direct de variables :

on utilise set 

DECLARE x INT;
DECLARE nomfou VARCHAR(50);
SET x=10;
SET nomfou='alan';

retour d''enregistrement : 

 procédure execute une requête SELECT, les enregistrements résultant sont retournés.

DELIMITER |
 CREATE PROCEDURE message()
SELECT * FROM fournis;
          |

Les Fonctions : 

On utilise la commande CREATE FUNCTION name (params) RETURNS returnType

 DELIMITER |
 CREATE FUNCTION chercheAlan (param_id INT) RETURNS CHAR(50)
BEGIN
    DECLARE alan CHAR(50);
    SELECT nomfou INTO alan FROM fournis WHERE nomfou="alan";
    RETURN alan;
END;
|

en cas d''erreur :

 set global log_bin_trust_routine_creators=1;

utilisation des fonction stocker : 

 SELECT chercheAlan(numfou) FROM fournis WHERE numfou=120 

fonction de routine : ( a repeter souvent ): 

DELIMITER |
CREATE FUNCTION arrondi50(v DECIMAL(8,2)) RETURNS DECIMAL(8,2)
RETURN ROUND((v * 2) + 0.49999)/2;
|
DELIMITER ;

Les vues : 

Creation de vue : 

CREATE VIEW nom_de_la_vue
AS
SELECT * FROM nom_table
WHERE...

/*****/ 

Utilisation d''une vue : 

SELECT * FROM nom_de_la_vue

/*****/ 

Afficher la définition d''une vue : 

SHOW CREATE VIEW v_nomvue

/*****/ 

Modifier une vue : 

ALTER VIEW v_nomvue 
AS 
[NOUVELLE REQUETE]

ou 

CREATE OR REPLACE VIEW v_nomvue
AS
[NOUVELLE REQUETE]      

/*****/ 

Supprimer une vue : 

DROP VIEW IF EXISTS v_nomvue 

/*****/ 

Definir des priviléges sur une vue : 

GRANT 
CREATE VIEW, 
SHOW VIEW 
ON `nom_base`.* TO 'utilisateur'@'adresse_ip'

/*****/

Lister les vues existantes : 

SELECT * FROM information_schema.views 
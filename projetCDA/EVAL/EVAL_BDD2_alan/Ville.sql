Requete SQL EVAL : 

1.	Obtenir la liste des villes qui ont un nom d''au moins 40 lettres

select ville_nom from villes_france where length(ville_nom)>=40; 


2.	Obtenir la liste des départements d’outre-mer, c’est-à-dire ceux dont le numéro de département commence par “97”

select departement_nom from departements where departement_code like '97%'

3.	Obtenir la liste des départements des Hauts-de-France trier par ordre alphabétique des noms de département (sans jointure)

select departement_nom from departements where departement_regionId = (select region_id from regions where region_nom='Hauts-de-france') order by departement_nom /* asc pas obligatoire */ 

4.	Obtenir le nom de toutes les villes, ainsi que le nom du département associé. Les plus peuplées en 2012 apparaitront en premier

select V.ville_nom, D.departement_code, D.departement_nom from villes_france as V inner join departements as D on V.ville_departement=D.departement_code order by V.ville_population_2012 DESC

5.	Obtenir la liste du nom de chaque département, associé à son code et du nombre de commune au sein de ces départements, en triant afin d’obtenir en priorité les départements qui possèdent le plus de communes

select D.departement_nom, D.departement_code, count(V.ville_nom) as nbCommune 
from villes_france as V inner join departements as D on V.ville_departement=D.departement_code 
group by V.ville_nom order by nbCommune DESC

/*** a revoir  je n'arrive pas a faire mon calcule de nombre de ville par departement  ***/

6.	Obtenir la liste des départements, classés en fonction de leur superficie (plus grand en premier)

select D.departement_nom from departements as D inner join villes_france as V on V.ville_departement=D.departement_code order by sum(V.ville_surface) desc

select D.departement_nom, totalTailleDep 
 from departements as D 
inner join villes_france as V 
on V.ville_departement=D.departement_code
where ( 
SELECT sum(ville_surface) as totalTailleDep from villes_france group by V.ville_departement 
)

/*** a revoir sans la formule qui me permettera de calculer des groupes distinct sa sera compliqué pour moi ... pourtant je la connais ...  ***/ 

7.	Compter le nombre de villes dont le nom commence par “Saint”

select count(ville_nom) from villes_france where ville_nom like 'Saint%'

8.	Obtenir la liste des villes qui ont un nom existants plusieurs fois, et trier afin d’obtenir en premier celles dont le nom est le plus souvent utilisé par plusieurs communes

select count(ville_nom) as nombreDeDoublon, ville_nom FROM villes_france group by ville_nom DESC having count(ville_nom)>1 

/*** a revoir la il faudrait que je fais la somme des villes que j'ai trouver avec le meme nom ***/ 

9.	Obtenir en une seule requête SQL la liste des villes dont la superficie est supérieure à la superficie moyenne

select ville_nom from villes_france where ville_surface > ( select avg(ville_surface) from villes_france ) 

10.	Obtenir la liste des départements qui possèdent plus de 1.5 millions d’habitants en 2012


SELECT departement_nom, popDep from departements where 1500000 > (select sum(ville_population_2012) as popDep  from villes_france )

/*** a revoir pareille le calcule d'une partie de la colonne ... le group by / having ...  ***/ 

11.	Remplacez les tirets par un espace vide, pour toutes les villes commençant par “SAINT-” (dans la colonne qui contient les noms en majuscule)

UPDATE villes_france SET ville_nom = REPLACE( ville_nom,"-", " ") where ville_nom='Saint';

12.	Supplémentaire. Obtenir la liste des 50 villes ayant la plus faible superficie

 select ville_nom
  from villes_france 
  group by ville_nom 
  having ville_surface
   order by ville_surface 

/*** a revoir sortir un groupe d'une colonne cest pas mon fort aujourdhui , pourtant encore hier dimanche c'etait pas mal ... pas tres utile mes revisions ... ***/ 

13.	Ajouter une colonne region_nbDepartement dans la table regions (mettre le code dans le script de réponse)

alter table regions add region_nbDepartement INT 

14.	Ecrire une procédure stockée (nommée MajRegion), qui vient mettre à jour cette colonne

  DELIMITER _
  CREATE PROCEDURE MajRegion (in valeur INT ) 
    BEGIN
            UPDATE regions SET region_nbDepartement = region_nbDepartement + valeur;
        END
        _

/* je compte ajouter une valeur definit par l'utilisateur qui serait additionner avec la valeur presente */ 

15.	Créer une vue qui regroupe les 3 tables

create view region_dep_ville as 
  select region_nom, ville_nom, departement_nom 
  from villes_france
  inner join departements 
 inner join regions

/* partie bonus */ 

le group by me permet de grouper en une seul ligne a condition d''avoir les attributs identique 

et le having remplace mon where et permet de realiser des fonctions ( avg , min , max, sum , count ... )

exemple ville : dunkerque , malo , rosendael , dunkerque -> numero 591, 592, 593, 591 
avec le group dunkerque:591, malo:592, rosendael:593 et le having dunkerque=591 . 

/* fin de la partie meditation */ 



Question requete sql

/*****/
test inner join 

select E.datcom, F.nomfou from entcom as E inner join fournis as F on E.numfou=F.numfou






/*****/

1. Afficher toutes les informations concernant les employés.

select * from employe 

2. Afficher toutes les informations concernant les départements. 

select * from dept 

3. Afficher le nom, la date d"'"embauche, le numéro du supérieur, le 
numéro de département et le salaire de tous les employés.


select nom, dateemb, nosup, nodep, salaire from employe

4. Afficher le titre de tous les employés.

select  titre from employe

5. Afficher les différentes valeurs des titres des employés

select distinct titre from employe

6. Afficher le nom, le numéro d"'"employé et le numéro du 
département des employés dont le titre est « Secrétaire ». 

select nom, noemp, nodep from employe where titre="Secrétaire"

7. Afficher le nom et le numéro de département dont le numéro de 
département est supérieur à 40. 

select nom, nodep from dept where nodep>40 

8. Afficher le nom et le prénom des employés dont le nom est 
alphabétiquement antérieur au prénom.

select nom, prenom from employe where  prenom>nom 


9. Afficher le nom, le salaire et le numéro du département des employés 
dont le titre est « Représentant », le numéro de département est 35 et 
le salaire est supérieur à 20000.

select nom, salaire, nodep from employe where titre="Représentant" and nodep=35 and salaire>2000

10.Afficher le nom, le titre et le salaire des employés dont le titre est 
« Représentant » ou dont le titre est « Président ». 

select nom, titre, salaire from employe where titre='Président' or titre="Représentant" 

11.Afficher le nom, le titre, le numéro de département, le salaire des 
employés du département 34, dont le titre est « Représentant » ou 
« Secrétaire ».

select nom, titre, nodep, salaire from employe where nodep=34 and  (titre="Représentant" or titre="secrétaire")

12.Afficher le nom, le titre, le numéro de département, le salaire des 
employés dont le titre est Représentant, ou dont le titre est Secrétaire 
dans le département numéro 34. 

select nom, titre, nodep, salaire from employe where( nodep=34 and titre="Secrétaire" ) or titre="Représentant"  

13.Afficher le nom, et le salaire des employés dont le salaire est compris 
entre 20000 et 30000.

select nom, salaire from employe where salaire>20000 and salaire<30000

15.Afficher le nom des employés commençant par la lettre « H ». 

select nom from employe where nom like "H%"

16.Afficher le nom des employés se terminant par la lettre « n ».

select nom from employe where nom like "%n"

17.Afficher le nom des employés contenant la lettre « u » en 3ème
position. 

select nom from employe where substring(nom,3,1)= "u"

18.Afficher le salaire et le nom des employés du service 41 classés par 
salaire croissant.

select salaire, nom from employe where nodep=41 ORDER BY salaire 

19.Afficher le salaire et le nom des employés du service 41 classés par 
salaire décroissant.

select salaire, nom from employe where nodep=41 ORDER BY salaire DESC 

20.Afficher le titre, le salaire et le nom des employés classés par titre 
croissant et par salaire décroissant. 

select titre, salaire, nom from employe ORDER BY titre ASC, salaire DESC

21.Afficher le taux de commission, le salaire et le nom des employés 
classés par taux de commission croissante. 

select tauxcom, salaire, nom from employe ORDER BY tauxcom 

22.Afficher le nom, le salaire, le taux de commission et le titre des 
employés dont le taux de commission n"'"est pas renseigné.

select nom, salaire, tauxcom, titre from employe where tauxcom is Null

23.Afficher le nom, le salaire, le taux de commission et le titre des 
employés dont le taux de commission est renseigné.

select nom, salaire, tauxcom, titre from employe where tauxcom is NOT NULL

24.Afficher le nom, le salaire, le taux de commission, le titre des 
employés dont le taux de commission est inférieur à 15. 

select nom, salaire, tauxcom, titre from employe where tauxcom<15 

25. Afficher le nom, le salaire, le taux de commission, le titre des 
employés dont le taux de commission est supérieur à 15. 

select nom, salaire, tauxcom, titre from employe where tauxcom>15 

26.Afficher le nom, le salaire, le taux de commission et la commission des 
employés dont le taux de commission n"'"est pas nul. (la commission 
est calculée en multipliant le salaire par le taux de commission)

SELECT nom, salaire, tauxcom , (salaire*tauxcom) as comEmp 
from employe where tauxcom is NOT NULL 

27. Afficher le nom, le salaire, le taux de commission, la commission des 
employés dont le taux de commission n"'"est pas nul, classé par taux de 
commission croissant.

select nom, salaire , tauxcom, (tauxcom*salaire) as comEmp from employe 
where tauxcom IS NOT NULL ORDER BY tauxcom ASC

28. Afficher le nom et le prénom (concaténés) des employés. Renommer 
les colonnes

select CONCAT(nom, prenom) as concatenation from employe

29. Afficher les 5 premières lettres du nom des employés. 

select SUBSTR(nom,1,5) from employe

30. Afficher le nom et le rang de la lettre « r » dans le nom des 
employés.

select nom,Locate( "r",nom,1) from employe

31. Afficher le nom, le nom en majuscule et le nom en minuscule de 
l"'"employé dont le nom est Vrante.

select nom, upper(nom), lower(nom) from employe where nom="Vrante"

32. Afficher le nom et le nombre de caractères du nom des employés.

select nom, LENGTH(nom) from employe 


partie 2 : 
/******************************************************************/
Rechercher le prénom des employés et le numéro de la région de leur 
département. 

select E.prenom, E.nodep, D.noregion from employe as E, dept as D
select E.prenom, E.nodep, D.noregion from employe as E inner JOIN dept as D

/******************************************************************/
Rechercher le numéro du département, le nom du département, le 
nom des employés classés par numéro de département (renommer les 
tables utilisées).

select E.nodep, D.nom, E.nom from employe as E inner JOIN dept as D ORDER BY E.nodep 
select E.nodep, D.nom, E.nom from employe as E, dept as D ORDER BY E.nodep 

/******************************************************************/
Rechercher le nom des employés du département Distribution.

select E.nom from employe as E, dept as D where D.nom="Distribution"

/******************************************************************/
Rechercher le nom et le salaire des employés qui gagnent plus que 
leur patron, et le nom et le salaire de leur patron. 

4.Rechercher le nom et le salaire des employés qui gagnent plus que leur patron, et le nom et le salaire de leur patron

select nom,
       salaire,
      (select nom from employe where noemp=e.nosup) as "nom supérieur",
      (select salaire from employe where noemp=e.nosup) as "salaire superieur"
from employe as e 
where salaire>(select salaire from employe where noemp=e.nosup);
"

Rechercher le nom et le titre des employés qui ont le même titre que 
Amartakaldire.

select E.nom, E.titre from employe as E where E.titre=
(Select E.titre from employe as E where E.nom="Amartakaldire")

Rechercher le nom, le salaire et le numéro de département des 
employés qui gagnent plus qu"'"un seul employé du département 31, 
classés par numéro de département et salaire.

select E.nom, E.salaire, E.nodep from employe as E where E.salaire>
(select min(E.salaire) from employe as E where E.nodep=31 ) order by E.nodep, E.salaire 

7/Rechercher le nom, le salaire et le numéro de département des employés qui gagnent plus que tous les employés du département 31, classés par numéro de département et salaire. 

SELECT nom, salaire, nodep FROM employe
WHERE salaire > (SELECT MAX(salaire) FROM employe WHERE nodep = 31) 
ORDER BY nodep, salaire

8 Rechercher le nom et le titre des employés du service 31 qui ont un titre que l on trouve dans le département 32. 

SELECT nom, titre  FROM employe WHERE titre IN 
(SELECT titre FROM employe WHERE nodep = 32) AND nodep = 31

9 Rechercher le nom et le titre des employés du service 31 qui ont un titre l on ne trouve pas dans le département 32. 

SELECT nom, titre  FROM employe WHERE titre NOT IN 
(SELECT titre FROM employe WHERE nodep = 32) AND nodep = 31

 10 Rechercher le nom, le titre et le salaire des employés qui ont le même titre et le même salaire que Fairant. 

SELECT nom, titre, salaireFROM employeWHERE NOT nom = 'Fairent'AND 
(titre,salaire) = (SELECT titre,salaire FROM  employe WHERE  nom = 'Fairent')

11 Rechercher le numéro de département, le nom du département, le 
nom des employés, en affichant aussi les départements dans lesquels 
il n''y a personne, classés par numéro de département. 

SELECT e.nodep, d.nom AS 'nom departement', e.nom As 'nom employe'FROM employe AS e RIGHT JOIN
 dept AS d ON e.nodep = d.nodept ORDER BY e.nodep
 '


1 calculer le nombre d''employés de chaque titre.

select E.titre, sum(E.noemp) FROM employe as E group by E.titre

2. Calculer la moyenne des salaires et leur somme, par région.

SELECT D.noregion, SUM(E.salaire) as SalaireSomme, AVG(E.salaire) as SalaireMoy 
FROM employe as E INNER JOIN dept as D GROUP BY D.noregion 

3. Afficher les numéros des départements ayant au moins 3 employés.
SELECT nodep
FROM employe
GROUP BY nodep
HAVING COUNT(nodep) >= 3

4. Calculer le nombre d"'"employés de chaque titre.

SELECT substring(nom,1,1) AS 'initial' FROM employe
GROUP BY initial HAVING count(initial) > 2

 5. Rechercher le salaire maximum et le salaire minimum parmi tous les salariés et l''écart entre les deux. 
SELECT MIN(salaire) as 'salaire min' , MAX(salaire) as 'salaire max' 
, MAX(salaire)-MIN(salaire) as 'difference' FROM employe

6. Rechercher le nombre de titres diffé'rents
Select count(distinct titre) from employe

7. Pour chaque titre, compter le nombre d''employés possédant ce titre. 
SELECT titre,COUNT(*) FROM employe GROUP BY titre

 8. Pour chaque nom de département, afficher le nom du département et  le nombre d''employés.
    SELECT d.nom, count(e.noemp) as "Nb employes" 
    FROM employe as e INNER JOIN dept as d ON d.nodept=e.nodep GROUP BY d.nom;
    

 9. Rechercher les titres et la moyenne des salaires par titre dont la moyenne est supérieure à la moyenne des salaires des Représentants. 

SELECT titre, ROUND(AVG(salaire)) as "MoySalaire" FROM employe
GROUP BY titre
HAVING MoySalaire > (SELECT AVG(salaire) FROM employe WHERE titre="représentant")

 10.Rechercher le nombre de salaires renseignés et le nombre de taux de commission renseignés.
SELECT COUNT (salaire) , COUNT (tauxcom) FROM Employe

"
/**********************************************/ 
Papyrus : 

1.  Quelles sont les commandes du fournisseur 09120 ?

select numcom from entcom where numfou=09120 

2. Afficher le code des fournisseurs pour lesquels des commandes ont été passées

select numfou from entcom where obscom IS NOT NULL 

3. Afficher le nombre de commandes fournisseurs passées, et le nombre de 
fournisseur concernés.

select DISTINCT count(numcom) as NbCom,  count( DISTINCT numfou) as NbFou from entcom 

4. Editer les produits ayant un stock inférieur ou égal au stock d''alerte et dont la 
quantité annuelle est inférieur est inférieure à 1000
(informations à fournir : n° produit, libellé produit, stock, stock actuel d''alerte, 
quantité annuelle)

select P.codart, P.libart, P.stkphy, P.stkale, P.qteann from produit as P where P.stkphy<=p.stkale and P.qteann<1000 

5. Quels sont les fournisseurs situés dans les départements 75 78 92 77 ?
L’affichage (département, nom fournisseur) sera effectué par département 
décroissant, puis par ordre alphabétique

select F.posfou, F.nomfou from fournis as F where substring(F.posfou,1,2)in(75,78,92,77) ORDER BY substring(F.posfou,1,2) DESC

6. Quelles sont les commandes passées au mois de mars et avril ?

select E.numcom from entcom as E where MONTH(E.datcom)=03 or 04 

7. Quelles sont les commandes du jour qui ont des observations particulières ?
(Affichage numéro de commande, date de commande) 

select E.numcom, E.datcom, E.obscom from entcom as E where E.obscom <> ''

8. Lister le total de chaque commande par total décroissant 
(Affichage numéro de commande et total)

select L.numcom, SUM(L.numcom) as totalCommande from ligcom as L group by L.numcom order by L.numcom DESC

9. Lister les commandes dont le total est supérieur à 10 000€ ; on exclura dans le 
calcul du total les articles commandés en quantité supérieure ou égale à 1000.
(Affichage numéro de commande et total)

select L.numcom, SUM(L.numcom) as totalCommande from ligcom as L where L.numcom>1000 GROUP BY L.numcom HAVING totalCommande > 10000

10.Lister les commandes par nom fournisseur 
(Afficher le nom du fournisseur, le numéro de commande et la date)

select Distinct F.nomfou , E.numcom, E.datcom from fournis as F INNER JOIN entcom as E 

11.Sortir les produits des commandes ayant le mot ""urgent'' en observation?
(Afficher le numéro de commande, le nom du fournisseur, le libellé du produit et 
le sous total = quantité commandée * Prix unitaire)

/* a revoir */ 
select L.numcom, F.nomfou, P.libart,SUM(L.qtecom*L.priuni)
 from ligcom as L 
 inner join produit as P on L.codart = p.codart 
 inner join fournis as F on F.numfou
 
select L.numcom,SUM(L.qtecde*L.priuni)
 from ligcom as L 
 inner join entcom as E on E.numcom=L.numcom

 select L.numcom, F.nomfou, P.libart,SUM(L.qtecde*L.priuni)
 from ligcom as L 
 inner join produit as P on L.codart=P.codart 
 inner join fournis as F on F.numfou=E.numfou
 inner join entcom as E 

select F.nomfou
 from fournis as F
 inner join entcom as E on F.numfou=E.numfou
 



12.Coder de 2 manières différentes la requête suivante :
Lister le nom des fournisseurs susceptibles de livrer au moins un article

select distinct F.nomfou from fournis as F
 inner join entcom as E on F.numfou=E.numfou
 inner join ligcom as L on E.numcom=L.numcom
  where L.qteliv>0 

  select distinct F.nomfou from fournis as F, entcom as E,ligcom as L WHERE E.numcom=L.numcom F.numfou=E.numfou
 and L.qteliv>0 

13.Coder de 2 manières différentes la requête suivante
Lister les commandes (Numéro et date) dont le fournisseur est celui de la 
commande 70210 :

select E.numcom, E.datcom from entcom as E 
inner join fournis as F on E.numfou=F.numfou where F.numfou=(
      select F.nomfou from fournis as F
       inner JOIN entcom as E on E.numfou=F.numfou where E.numcom=70210 )

14.Dans les articles susceptibles d’être vendus, lister les articles moins chers (basés 
sur Prix1) que le moins cher des rubans (article dont le premier caractère 
commence par R). On affichera le libellé de l’article et prix1

select 
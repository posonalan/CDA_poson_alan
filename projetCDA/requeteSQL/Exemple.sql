
Question requete sql



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

select D.nodept, D.nom, E.nom from employe as E, dept as D group by D.nodept
select D.nodept, D.nom, E.nom 
from employe as E
Left join dept as D
 on D.nodept=E.nodept group by D.nodept


1 calculer le nombre d''employés de chaque titre.

select E.titre, sum(E.noemp) FROM employe as E group by E.titre

2. Calculer la moyenne des salaires et leur somme, par région.

select D.noregion, sum(E.salaire), AVG(E.salaire) FROM employe as E, dept as D group by D.noregion

3. Afficher les numéros des départements ayant au moins 3 employés.

Select E.nodep from dept as D group by 




1. Calculer le nombre d"'"employés de chaque titre.

select nom, titre ,SUM(nom) from employe GROUP BY titre 
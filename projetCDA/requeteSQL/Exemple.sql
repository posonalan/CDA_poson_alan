
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

select nom, nodep from employe where nodep>40 

8. Afficher le nom et le prénom des employés dont le nom est 
alphabétiquement antérieur au prénom.

select nom, prenom from employe where order by prenom>nom 
????? 

9. Afficher le nom, le salaire et le numéro du département des employés 
dont le titre est « Représentant », le numéro de département est 35 et 
le salaire est supérieur à 20000.

select nom, salaire, nodep from employe where titre="Représentant" and nodep=35 and salaire>2000

10.Afficher le nom, le titre et le salaire des employés dont le titre est 
« Représentant » ou dont le titre est « Président ». 

select nom, salaire from employe where


1. Afficher toutes les informations concernant les employés.

1. Afficher toutes les informations concernant les employés.

select * from employe
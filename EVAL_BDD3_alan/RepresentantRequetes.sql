
EVAL BDD 

1.	 Question 1
Tous les détails de tous les clients.

select * from clients; 

2.	Question 2
Les numéros et les noms des produits de couleur rouge et de poids supérieur à 2000.

select idProduit, NomProduit from produits where CouleurProduit = "Rouge" and PoidsProduit > 2000;

3.	Question 3
Les noms des représentants ayant vendu au moins un produit trié par ordre alphabétique.

select distinct R.NomRepres from representants as R inner join ventes as V on R.IdRepres = V.IdRepres where V.Quantite>=1 order by R.NomRepres 


4.	Question 4
Les noms des clients de Paris ayant acheté un produit pour une quantité supérieure à 180.

select C.NomClient from Clients as C inner join ventes as V on C.IdClient=V.IdClient where V.Quantite>180 and C.VilleClient = "Paris" group by C.NomClient

5.	Question 5
Les noms des représentants et les clients à qui ces représentants ont vendu un produit de couleur rouge pour une quantité supérieure à 100.	

select R.NomRepres, C.NomClient 
from Representants as R 
inner join ventes as V on R.IdRepres = V.IdRepres 
inner join clients as C on C.IdClient = V.IdClient 
inner join produits as P on P.IdProduit = V.IdProduit
where V.Quantite>100 and P.CouleurProduit="Rouge" group by C.NomClient

6.	Question 6
Les produits et le nombre vendus 

select P.NomProduit, sum(V.Quantite)  as totalVendu from produits as P inner join ventes as V on P.IdProduit = V.IdProduit group by P.NomProduit 

7.	Question 7
Les clients ayant achetés plus que la moyenne.

select C.NomClient, AVG(V.Quantite) as "Moyenne" 
from Clients as C 
inner join ventes as V on C.IdClient= V.IdClient
inner join produits as P on P.IdProduit = V.IdProduit 
group by C.NomClient 

/*******************************************/ 

having AVG(V.Quantite)< /* leurs achats */  

8.	Question 8 
Créer une vue pleine entre clients et ventes

CREATE VIEW Clients_Ventes as 

select C.IdClient, C.NomClient, C.VilleClient, V.IDVente, V.IdRepres, V.IdProduit, V.Quantite 
from Clients as C inner join ventes as V on C.IdClient = V.IdClient 
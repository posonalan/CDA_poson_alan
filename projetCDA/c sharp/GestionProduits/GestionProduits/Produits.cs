using System;

namespace GestionProduits

public class Produits
{
    /***** Proprieté *****/
    public Produits()
    {
    public int IdProduit { get; set; }
    public string LibelleProduit { get; set; }
    public int Quantite { get; set; }
    
    /***** Constructeur *****/
    public Produits(int idProduit, string libelleProduit, int quantite)
    {
    this.IdProduit = idProduit;
    this.LibelleProduit = libelleProduit;
    this.Quantite = quantite;
    }
}

}

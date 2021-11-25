using System;

namespace GestionProduits
{
    public class Produits
    {
        /***** Proprieté *****/

        public int IdProduit { get; set; }
        public string LibelleProduit { get; set; }
        public int Quantite { get; set; }
        public string Categorie { get; set; }
        public string Rayon { get; set; }

        /***** Constructeur *****/
        public Produits(int idProduit, string libelleProduit, int quantite, string categorie,string rayon )
        {
            this.IdProduit = idProduit;
            this.LibelleProduit = libelleProduit;
            this.Quantite = quantite;
            this.Categorie = categorie;
            this.Rayon = rayon; 
        }
    }

}

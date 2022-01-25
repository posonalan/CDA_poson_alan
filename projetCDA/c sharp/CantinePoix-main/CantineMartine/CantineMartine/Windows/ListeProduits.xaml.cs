using CantineMartine.Controllers;
using CantineMartine.Data;
using CantineMartine.Data.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;


namespace CantineMartine.Windows
{
    /// <summary>
    /// Logique d'interaction pour ListeProduits.xaml
    /// </summary>
    public partial class ListeProduits : Window
    {
        MyDbContext _context;
        ProduitController _controller; 
        public ListeProduits()
        {
            InitializeComponent();
            _context = new MyDbContext();
            _controller = new ProduitController(_context);
            ActualiserListe();
        }

        private void btnActions_Click(object sender,RoutedEventArgs e)
        {
            ProduitDTOAvecLibelleCategorieProduit produit = (ProduitDTOAvecLibelleCategorieProduit)ListeProduit.SelectedItem;
            string nom = (string)((Button)sender).Content;
            if (produit == null && (nom == "Modifier" || nom == "Supprimer"))
            {
                MessageBox.Show("Veuillez Selectionner un Produit");
            }
            else
            {
                FormProduit action = new FormProduit(nom,this,produit,_context);
                this.Opacity = 0.7;
                action.ShowDialog();
                this.Opacity = 1;
            }
        }
        public void ActionProduit(ProduitDTOIn produit, string action,int id)
        {
            switch(action)
            {
                case "Ajouter":
                    _controller.CreateProduit(produit);
                    break;
                case "Modifier":
                    _controller.UpdateProduit(id, produit);
                    break;
                case "Supprimer":
                    _controller.DeleteProduit(id);
                    break;
                default:
                    break;
            }
            ActualiserListe();
        }
        private void ActualiserListe()
        {
            ListeProduit.ItemsSource = _controller.GetAllProduit();
        }
        private void RetourLP_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}

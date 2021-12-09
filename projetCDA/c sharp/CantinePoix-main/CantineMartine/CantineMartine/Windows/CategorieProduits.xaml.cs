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
    /// Logique d'interaction pour CategorieProduits.xaml
    /// </summary>
    public partial class CategorieProduits : Window
    {
        MyDbContext _context;
        CategoriesproduitController _controller;
        public CategorieProduits()
        {
            InitializeComponent();
            _context = new MyDbContext();
            _controller = new CategoriesproduitController(_context);
            ActualiserListe();
        }

        private void btnAction_Click(object sender, RoutedEventArgs e)
        {
            CategoriesproduitDTOIn categorieproduit = (CategoriesproduitDTOIn)ListeCategoriesProduit.SelectedItem;
            string nom = (string)((Button)sender).Content;
            if (categorieproduit==null&&(nom=="Modifier"||nom=="Supprimer"))
            {
                MessageBox.Show("Veuillez Sélectionner une Catégorie !!");
            }
            else
            {
                FormCatgorieProduit actions = new FormCatgorieProduit(sender, this, categorieproduit, _context);
                this.Opacity = 0.7;
                actions.ShowDialog();
                this.Opacity = 1;
            }
        }

        public void ActionCategorieProduit(CategoriesproduitDTOIn categ, string action, int id)
        {
            switch(action)
            {
                case "Ajouter":
                    _controller.CreateCategorieProduit(categ);
                    break;
                case "Modifier":
                    _controller.UpdateCategorieProduit(id,categ);
                    break;
                case "Supprimer":
                    _controller.DeleteCategorieProduit(id);
                    break;
            }
            ActualiserListe();
        }
        private void ActualiserListe()
        {
            ListeCategoriesProduit.ItemsSource = _controller.GetAllGategoriesProduit();
        }
        private void RetourLP_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}

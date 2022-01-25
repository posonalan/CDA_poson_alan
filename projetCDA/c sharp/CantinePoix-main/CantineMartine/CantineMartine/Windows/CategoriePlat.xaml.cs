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
    /// Logique d'interaction pour CategoriePlat.xaml
    /// </summary>
    public partial class CategoriePlat : Window
    {
        MyDbContext _context;
        CategoriesPlatsController _controller;
        public CategoriePlat()
        {
            InitializeComponent();
            _context = new MyDbContext();
            _controller = new CategoriesPlatsController(_context);
            ActualiserListe();
        }

        private void BtnAction_Click(object sender, RoutedEventArgs e)
        {
            CategoriesPlatsDTOIn categorieplat = (CategoriesPlatsDTOIn)ListeCategoriesPlat.SelectedItem;
            string nom = (string)((Button)sender).Content;
            if (categorieplat==null&&(nom=="Modifier"||nom=="Supprimer"))
            {
                MessageBox.Show("Veuillez Selectionner une catégorie !!!");
            }
            else
            {
                FormCategoriePlat formulaire = new FormCategoriePlat(nom, this, categorieplat,_context);
                this.Opacity = 0.7;
                formulaire.ShowDialog();
                this.Opacity = 1;
            }
           
        }

        public void ActionCategoriePlat(CategoriesPlatsDTOIn categorie, string action, int id)
        {
            switch(action)
            {
                case "Ajouter":
                    _controller.CreateCategoriesplat(categorie);
                break;
                case "Modifier":
                    _controller.UpdateCategoriesplat(id, categorie);
                    break;
                case "Supprimer":
                    _controller.DeleteCategoriesplat(id);
                    break;
                default:
                    break;

            }
            ActualiserListe();
        }
        private void ActualiserListe()
        {
            ListeCategoriesPlat.ItemsSource = _controller.GetAllCategoriesPlats();
        }

        private void RetourLP_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
    
}

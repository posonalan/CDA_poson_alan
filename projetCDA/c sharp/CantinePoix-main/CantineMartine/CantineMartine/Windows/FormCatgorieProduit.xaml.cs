using CantineMartine.Controllers;
using CantineMartine.Data;
using CantineMartine.Data.Dtos;
using CantineMartine.Windows;
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
    /// Logique d'interaction pour FormCatgorieProduit.xaml
    /// </summary>
    public partial class FormCatgorieProduit : Window
    {
        CategorieProduits fenetre;
        CategoriesproduitDTOIn categorieproduit;
        CategoriesproduitController _controller;
        string Action;
        int Id;
        public FormCatgorieProduit(object sender,CategorieProduits win, CategoriesproduitDTOIn categorieproduit,MyDbContext _context)
        {
            InitializeComponent();
            this.categorieproduit = categorieproduit;
            this.fenetre = win;
            this.Action = (string)((Button)sender).Content;
            this.Id=(categorieproduit == null) ? 0 : categorieproduit.IdCategorieProduit;
            _controller = new CategoriesproduitController(_context);
            InitPage(sender);
        }

        private void InitPage(object sender)
        {
            LabTitreForm.Content = this.Action + " une Catégorie de Produit";
            btn_Valider.Click += (s, e) => ActionCategorieProduit();
            btn_Valider.Content = this.Action;
            switch (this.Action)
            {
                case "Ajouter":
                    break;
                case "Modifier":
                    txtLibCateg.Text = categorieproduit.LibelleCategorieProduit;
                    break;
                case "Supprimer":
                    txtLibCateg.Text = categorieproduit.LibelleCategorieProduit;
                    txtLibCateg.IsEnabled = false;
                    break;
                default:
                    break;
            }
        }

        public void ActionCategorieProduit()
        {
            CategoriesproduitDTOIn categ = new CategoriesproduitDTOIn
            {
                IdCategorieProduit = this.Id,
                LibelleCategorieProduit = txtLibCateg.Text
            };
           this.fenetre.ActionCategorieProduit(categ,this.Action, this.Id);
           Retour();

        }

        private void btn_Annuler_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        public void Retour()
        {
            this.Close();
        }
    }
}

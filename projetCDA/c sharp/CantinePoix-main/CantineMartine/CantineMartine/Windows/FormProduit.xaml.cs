using CantineMartine.Controllers;
using CantineMartine.Data;
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
using  CantineMartine.Data.Dtos;

namespace CantineMartine.Windows
{
    /// <summary>
    /// Logique d'interaction pour FormProduit.xaml
    /// </summary>
    public partial class FormProduit : Window
    {
        ListeProduits window;
        ProduitController produitController;
        CategoriesproduitController categorieController;
        ProduitDTOAvecLibelleCategorieProduit Produit;
        string Action;
        int Id;
        public FormProduit(string action,ListeProduits win, ProduitDTOAvecLibelleCategorieProduit produit,MyDbContext context)
        {
            InitializeComponent();
            this.window = win;
            this.Produit = produit;
            this.Action = action;
            this.produitController = new ProduitController(context);
            this.categorieController = new CategoriesproduitController(context);
            this.Id = (produit == null) ? 0 : produit.IdProduit;
            InitForm();
        }

        private void InitForm()
        {
            LabTitreForm.Content = this.Action + " un produit";
            cbCategorieProduit.ItemsSource = categorieController.GetAllGategoriesProduit();
            cbCategorieProduit.DisplayMemberPath = "LibelleCategorieProduit";
            cbCategorieProduit.SelectedValuePath = "IdCategorieProduit";
            btn_Valider.Content = this.Action;
            btn_Valider.Click += (s, e) => ActionArticle();

            switch (Action)
            {
                case "Ajouter":
                    break;
                case "Modifier":
                    txtLibelleProduit.Text = this.Produit.LibelleProduit;
                    cbCategorieProduit.SelectedValue = this.Produit.IdCategorieProduit;
                    txtQuantiteProduit.Text = Convert.ToString(this.Produit.QuantiteProduit);
                    break;
                case "Supprimer":
                    txtLibelleProduit.Text = this.Produit.LibelleProduit;
                    txtLibelleProduit.IsEnabled = false;
                    cbCategorieProduit.SelectedValue = this.Produit.IdCategorieProduit;
                    cbCategorieProduit.IsEnabled = false;
                    txtQuantiteProduit.Text = Convert.ToString(this.Produit.IdProduit);
                    txtQuantiteProduit.IsEnabled = false;
                    break;
                default:
                    break;
            }
        }

        public void ActionArticle()
        {
            ProduitDTOIn prod = new ProduitDTOIn
            {
                IdProduit=this.Id,
                LibelleProduit = txtLibelleProduit.Text,
                IdCategorieProduit = (int)cbCategorieProduit.SelectedValue,
                QuantiteProduit=int.Parse(txtQuantiteProduit.Text)
            };
            this.window.ActionProduit(prod, this.Action,this.Id);
            Retour();
        }
        public void btn_Annuler_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
        public void Retour()
        {
            this.Close();
        }
    }
}

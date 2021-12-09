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
    /// Logique d'interaction pour FormCategoriePlat.xaml
    /// </summary>
    public partial class FormCategoriePlat : Window
    {
        CategoriePlat fenetre;
        CategoriesPlatsDTOIn categorieplat;
        CategoriesPlatsController _controller;
        string Action;
        int Id;
        public FormCategoriePlat(string action,CategoriePlat window, CategoriesPlatsDTOIn categorie, MyDbContext context)
        {
            InitializeComponent();
            this.categorieplat=categorie;
            this.fenetre = window;
            this._controller = new CategoriesPlatsController(context);
            this.Action = action;
            this.Id = (categorie == null) ? 0 : categorie.IdCategoriePlat;
            InitFormulaire();
        }

        private void InitFormulaire()
        {
            LabTitreForm.Content = this.Action + " une catégorie de plat";
            switch(this.Action)
            {
                case "Ajouter":
                    break;
                case "Modifier":
                    txtLibCateg.Text = this.categorieplat.LibelleCategoriePlat;
                    break;
                case "Supprimer":
                    txtLibCateg.Text = this.categorieplat.LibelleCategoriePlat;
                    txtLibCateg.IsEnabled = false;
                    break;
                default:
                    break;
            }
            btn_Valider.Content = this.Action;
            btn_Valider.Click += (s, e) => ActionCategoriePlat();
        }

        private void ActionCategoriePlat()
        {
            CategoriesPlatsDTOIn categplat = new CategoriesPlatsDTOIn { 
                IdCategoriePlat=this.Id,
                LibelleCategoriePlat=txtLibCateg.Text
            };
            this.fenetre.ActionCategoriePlat(categplat, this.Action, this.Id);
            Retour();
        }

        public void Retour()
        {
            this.Close();
        }

        private void btn_Annuler_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}

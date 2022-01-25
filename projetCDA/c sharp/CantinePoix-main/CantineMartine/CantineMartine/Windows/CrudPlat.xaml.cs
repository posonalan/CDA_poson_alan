using CantineMartine.Controllers;
using CantineMartine.Data;
using CantineMartine.Data.Dtos;
using CantineMartine.Data.Models;
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
    /// Logique d'interaction pour CrudPlat.xaml
    /// </summary>
    public partial class CrudPlat : Window
    {
        ListePlats _previousWindow;
        PlatsDTOOut _plat;
        String _action;
        CategoriesPlatsController _controllerCategsPlats;
        ContenuPlatsController _controllerContenuPlats;
        List<ProduitDTOAvecLibelleCategorieProduit> _listProduit;
        List<ProduitDTOAvecLibelleCategorieProduit> _listProduitAddPlat;
        PlatsController _controllerPlats;
        ProduitController _controllerProduits;

        public CrudPlat(MyDbContext context, string action, PlatsDTOOut platSelectionner, ListePlats previousWindow)
        {
            InitializeComponent();
            _plat = platSelectionner;
            _previousWindow = previousWindow;
            _action = action;
            _controllerCategsPlats = new CategoriesPlatsController(context);
            _controllerPlats = new PlatsController(context);
            _controllerProduits = new ProduitController(context);
            _controllerContenuPlats = new ContenuPlatsController(context);
            _listProduit = (List<ProduitDTOAvecLibelleCategorieProduit>) _controllerProduits.GetAllProduit();
            _listProduitAddPlat = new List<ProduitDTOAvecLibelleCategorieProduit>();

            InitPage();
        }

        public void InitPage()
        {
            LabelAction.Content = _action + " un plat";
            BtnAction.Content = _action;
            //Rempli la combobox catégorie produit.
            RemplirComboBoxCategPlat();

            if (_action != "Ajouter")
            {
                //Si l'action est Supprimer alors mettre tous en Disabled.
                if (_action == "Supprimer")
                {
                    TbLibPlat.IsEnabled = false;
                    CbCategPlat.IsEnabled = false;
                    DgProduit.IsEnabled = false;
                    DgProduitAddPlat.IsEnabled = false;
                }

                //Remplir le libelle plat avec le libelle du plat sélectionner.
                TbLibPlat.Text = _plat.LibellePlat;

                //Selectionner la categorie du plat sélectionner.
                CbCategPlat.SelectedValue = _plat.IdCategoriePlat;

                //Remplie la Datagrid des produits qui compose le plat.

                var listeDesProduitsDuPlat = _controllerContenuPlats.GetAllContenuPlatsByIdPlat(_plat.IdPlat);
                foreach (var item in listeDesProduitsDuPlat)
                {
                    int id = (int)item.IdProduit;
                    ProduitDTOAvecLibelleCategorieProduit produit = _controllerProduits.GetProduitByIdAvecLibelleCategorieProduit(id);
                    //Récupère l'objet a retirer et l'ajoute dans la variable itemToRemove puis le retire de la liste.
                    var itemToRemove = _listProduit.Single(r => r.IdProduit == produit.IdProduit);
                    _listProduit.Remove(itemToRemove);

                    produit.QuantiteProduit = item.Quantite;
                    _listProduitAddPlat.Add(produit);
                }

            }
            RefreshDatagrid();
        }

        private void ActionArticle(object sender, RoutedEventArgs e)
        {
            //Gère le cas de l'ajout pour le plat.
            int id;
            if (_plat == null)
            {
                id = 0;
            }
            else
            {
                id = _plat.IdPlat;
            }

            //Action sur le plat.
            PlatsDTOIn plat = new PlatsDTOIn
            {
                LibellePlat = TbLibPlat.Text,
                IdCategoriePlat = (int)CbCategPlat.SelectedValue
            };
            _previousWindow.ActionPlat(plat, _action, id);

            //Action sur le contenuMenu.
            foreach (var produitAddPlat in _listProduitAddPlat)
            {
                //Gère l'id des contenuMenu
                var contenu = _controllerContenuPlats.GetContenuPlatByIdProduitAndIdPlat(_plat.IdPlat, produitAddPlat.IdProduit);
                if (contenu == null)
                {
                    id = 0;
                }
                else
                {
                    id = contenu.IdContenuPlat;
                }

                ContenuplatsDTOIn contenuplat = new ContenuplatsDTOIn
                {
                    IdPlat = _plat.IdPlat,
                    IdProduit = produitAddPlat.IdProduit,
                    Quantite = produitAddPlat.QuantiteProduit
                };
                _previousWindow.ActionContenuPlat(contenuplat, _action, id);
            }
            CloseWindow(sender, e);
        }

        public void RemplirComboBoxCategPlat()
        {
            CbCategPlat.ItemsSource = _controllerCategsPlats.GetAllCategoriesPlats();
            CbCategPlat.DisplayMemberPath = "LibelleCategoriePlat"; //Valeur a afficher dans la combobox
            CbCategPlat.SelectedValuePath = "IdCategoriePlat"; // Valeur de la combobox
        }

        private void AddProduitAuPlat(object sender, RoutedEventArgs e)
        {
            ProduitDTOAvecLibelleCategorieProduit produit = (ProduitDTOAvecLibelleCategorieProduit)DgProduit.SelectedItem;
           
            if (produit == null)
            {
                MessageBox.Show("Pas de sélection");
            }
            else
            {
                _listProduit.Remove(produit);

                produit.QuantiteProduit = 1;
                _listProduitAddPlat.Add(produit);

                RefreshDatagrid();
            }
        }

        private void RemoveProduitDuPlat(object sender, RoutedEventArgs e)
        {
            ProduitDTOAvecLibelleCategorieProduit produit = (ProduitDTOAvecLibelleCategorieProduit)DgProduitAddPlat.SelectedItem;

            if (produit == null)
            {
                MessageBox.Show("Pas de sélection");
            }
            else
            {
                _listProduitAddPlat.Remove(produit);

                _listProduit.Add(_controllerProduits.GetProduitByIdAvecLibelleCategorieProduit(produit.IdProduit));

                RefreshDatagrid();
            }
        }

        private void AjouterQuantitéProduit(object sender, RoutedEventArgs e)
        {
            ProduitDTOAvecLibelleCategorieProduit produit = (ProduitDTOAvecLibelleCategorieProduit)DgProduitAddPlat.SelectedItem;

            if (produit == null)
            {
                MessageBox.Show("Pas de sélection");
            }
            else
            {
                _listProduitAddPlat[_listProduitAddPlat.IndexOf(produit)].QuantiteProduit++;
            }

            RefreshDatagrid();

            DgProduitAddPlat.SelectedItem = produit;
        }

        private void RetirerQuantitéProduit(object sender, RoutedEventArgs e)
        {
            ProduitDTOAvecLibelleCategorieProduit produit = (ProduitDTOAvecLibelleCategorieProduit)DgProduitAddPlat.SelectedItem;

            if (produit == null)
            {
                MessageBox.Show("Pas de sélection");
            }
            else
            {
                if (_listProduitAddPlat[_listProduitAddPlat.IndexOf(produit)].QuantiteProduit == 1)
                {
                    RemoveProduitDuPlat(sender, e);
                }
                else
                {
                    _listProduitAddPlat[_listProduitAddPlat.IndexOf(produit)].QuantiteProduit--;
                }
            }

            RefreshDatagrid();

            DgProduitAddPlat.SelectedItem = produit;
        }

        public void RefreshDatagrid()
        {
            _listProduit.Sort(ProduitDTOAvecLibelleCategorieProduit.CompareToLibelleProduit);
            DgProduit.ItemsSource = null;
            DgProduit.ItemsSource = _listProduit;
            DgProduitAddPlat.ItemsSource = null;
            DgProduitAddPlat.ItemsSource = _listProduitAddPlat;
        }

        private void CloseWindow(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}

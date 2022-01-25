using CantineMartine.Controllers;
using CantineMartine.Data;
using CantineMartine.Data.Controllers;
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
    /// Logique d'interaction pour GestionMenu.xaml
    /// </summary>
    public partial class GestionMenu : Window
    {

        public MenuController _controllerMenu;
        public PlatsController _controllerPlat;
        // public CategoriesPlatsController _controllerCategoriePlat;
        public GestionMenu(MyDbContext context, object sender)
        {
            InitializeComponent();
            _controllerMenu = new MenuController(context);
            _controllerPlat = new PlatsController(context);
            // _controllerCategoriePlat = new CategoriesPlatsController(context);
            var ListePlats = _controllerPlat.GetAllPlats();
            var ListeSemaine = _controllerMenu.GetAllSemaine();

            //var ListeCategoriePlat = _controllerCategoriePlat.GetAllCategoriesPlats();


            /* Liste des numero de semaines */
            foreach (var item in ListeSemaine)
            {
                Semaine.Items.Add(item.NumeroSemaine);
            }

            foreach (var item in ListePlats)
            {

                if (item.LibelleCategoriePlat == "Entree")
                {
                    Entree1.Items.Add(item.LibellePlat);
                    Entree2.Items.Add(item.LibellePlat);
                    Entree3.Items.Add(item.LibellePlat);
                    Entree4.Items.Add(item.LibellePlat);
                    Entree5.Items.Add(item.LibellePlat);
                }
                else if (item.LibelleCategoriePlat == "Plat")
                {
                    Plat1.Items.Add(item.LibellePlat);
                    Plat2.Items.Add(item.LibellePlat);
                    Plat3.Items.Add(item.LibellePlat);
                    Plat4.Items.Add(item.LibellePlat);
                    Plat5.Items.Add(item.LibellePlat);
                }
                else if (item.LibelleCategoriePlat == "Dessert")
                {
                    Dessert1.Items.Add(item.LibellePlat);
                    Dessert2.Items.Add(item.LibellePlat);
                    Dessert3.Items.Add(item.LibellePlat);
                    Dessert4.Items.Add(item.LibellePlat);
                    Dessert5.Items.Add(item.LibellePlat);
                }
            }
        }
        private void Entree_SelectionChanged(object sender, RoutedEventArgs e)
        {
        }

        private void ActiveDesactive(object sender, EventArgs e)
        {
            if (Dessert1.Text != "" && Plat1.Text != "" && Entree1.Text != "" )
            {
                Lundi.IsEnabled = true;
            }
            else
            {
                Lundi.IsEnabled = false;
            }
        }

        private void BoutonValider_Click(object sender, RoutedEventArgs e)
        {
          

        }

        private void BoutonRetour_Click(object sender, RoutedEventArgs e)
        {

          this.Close();
        }


        public void Jour_Check(object sender, RoutedEventArgs e)
        {
            /* Lundi */
            if (Jour1.IsChecked == false) { Lundi.IsEnabled = true; } else { Lundi.IsEnabled = false; }
            /* Mardi */
            if (Jour2.IsChecked == false) { Mardi.IsEnabled = true; } else { Mardi.IsEnabled = false; }
            /* Mercredi */
            if (Jour3.IsChecked == false) { Mercredi.IsEnabled = true; } else { Mercredi.IsEnabled = false; }
            /* Jeudi */
            if (Jour4.IsChecked == false) { Jeudi.IsEnabled = true; } else { Jeudi.IsEnabled = false; }
            /* Vendredi */
            if (Jour5.IsChecked == false) { Vendredi.IsEnabled = true; } else { Vendredi.IsEnabled = false; }
        }
    }
}


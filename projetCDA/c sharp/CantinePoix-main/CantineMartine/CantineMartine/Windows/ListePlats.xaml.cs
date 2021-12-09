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
    /// Logique d'interaction pour ListePlats.xaml
    /// </summary>
    public partial class ListePlats : Window
    {
        public MyDbContext _context;
        public PlatsController _controllerPlats;
        public ContenuPlatsController _controllerContenuPlats;
        public ListePlats(object sender, MyDbContext context)
        {
            InitializeComponent();
            _context = context;
            _controllerPlats = new PlatsController(context);
            _controllerContenuPlats = new ContenuPlatsController(context);
            DgListPlat.ItemsSource = _controllerPlats.GetAllPlats();
        }



        private void CloseWindow(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void GetCrudPlat(object sender, RoutedEventArgs e)
        {
            PlatsDTOOut plat = (PlatsDTOOut)DgListPlat.SelectedItem;
            string action = (string)((Button)sender).Content;

            if (plat == null && (action == "Modifier" || action == "Supprimer"))
            {
                MessageBox.Show("Pas de sélection");
                return;
            }

            CrudPlat subWindow = new CrudPlat(_context, action, plat, this);
            subWindow.Left = this.Left;
            subWindow.Top = this.Top;
            this.Opacity = 0.7;
            subWindow.ShowDialog();
            this.Opacity = 1;
            this.Left = subWindow.Left;
            this.Top = subWindow.Top;
        }

        public void ActionPlat(PlatsDTOIn plat, string action, int id)
        {
            switch (action)
            {
                case "Ajouter":
                    _controllerPlats.CreatePlat(plat);
                    break;
                case "Modifier":
                    _controllerPlats.UpdatePlat(id, plat);
                    break;
                case "Supprimer":
                    _controllerPlats.DeletePlat(id);
                    break;
            }

            ActualiserTableau();
        }

        public void ActionContenuPlat(ContenuplatsDTOIn ContenuPlat, string action, int id)
        {
            switch (action)
            {
                case "Ajouter":
                    _controllerContenuPlats.CreateContenuPlat(ContenuPlat);
                    break;
                case "Modifier":
                    _controllerContenuPlats.UpdateContenuPlat(id, ContenuPlat);
                    break;
                case "Supprimer":
                    _controllerContenuPlats.DeleteContenuPlat(id);
                    break;
            }
            ActualiserTableau();
        }

        private void ActualiserTableau()
        {
            DgListPlat.ItemsSource = _controllerPlats.GetAllPlats();
        }
    }
}

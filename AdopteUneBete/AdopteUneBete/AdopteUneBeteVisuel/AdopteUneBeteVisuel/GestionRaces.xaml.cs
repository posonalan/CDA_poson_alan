using AdopteUneBeteVisuel.Controllers;
using AdopteUneBeteVisuel.Data;
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

namespace AdopteUneBeteVisuel
{
    /// <summary>
    /// Interaction logic for GestionRaces.xaml
    /// </summary>
    public partial class GestionRaces : Window
    {
        public RacesController _controllerRaces;
        public GestionRaces(object sender, MyDbContext context)
        {
            InitializeComponent();
            _controllerRaces = new RacesController(context);
            DGGestionRace.ItemsSource = _controllerRaces.GetAllRaces();
        }

        private void BtnAction_Click(object sender, RoutedEventArgs e)
        {
            CRUDRaces subWindow = new CRUDRaces(sender);
            this.Opacity = 0.8;
            subWindow.ShowDialog();
            this.Opacity = 1;
        }

        private void RetourLP_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}

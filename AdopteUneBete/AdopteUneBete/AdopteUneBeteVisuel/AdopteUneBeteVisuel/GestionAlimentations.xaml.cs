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
    /// Interaction logic for GestionAlimentations.xaml
    /// </summary>
    public partial class GestionAlimentations : Window
    {
        public AlimentationsController _controllerAlimentations;
        public GestionAlimentations(object sender, MyDbContext context)
        {
            InitializeComponent();
            _controllerAlimentations = new AlimentationsController(context);
            DGGestionAlimentation.ItemsSource = _controllerAlimentations.GetAllAlimentations();
        }

        private void BtnAction_Click(object sender, RoutedEventArgs e)
        {
            CRUDAlimentations subWindow = new CRUDAlimentations(sender);
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

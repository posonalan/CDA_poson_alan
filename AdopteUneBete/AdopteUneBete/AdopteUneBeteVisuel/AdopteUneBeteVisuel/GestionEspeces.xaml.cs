using AdopteUneBete.Controllers;
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
    /// Interaction logic for GestionEspeces.xaml
    /// </summary>
    public partial class GestionEspeces : Window
    {
        public EspecesController _controllerEspeces;
        public GestionEspeces(object sender, MyDbContext context)
        {
            InitializeComponent();
            _controllerEspeces = new EspecesController(context);
            DGGestionEspece.ItemsSource = _controllerEspeces.GetAllEspeces();
        }

        private void BtnAction_Click(object sender, RoutedEventArgs e)
        {
            CRUDEspeces subWindow = new CRUDEspeces(sender);
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

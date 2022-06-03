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
    /// Interaction logic for GestionAnimaux.xaml
    /// </summary>
    public partial class GestionAnimaux : Window
    {
        public AnimauxController _controllerAnimaux;
        public GestionAnimaux(object sender, MyDbContext context)
        {
            InitializeComponent();
            _controllerAnimaux = new AnimauxController(context);
            DGGestionAnimaux.ItemsSource = _controllerAnimaux.GetAllAnimaux();
        }

        private void BtnAction_Click(object sender, RoutedEventArgs e)
        {
            CRUDAnimaux subWindow = new CRUDAnimaux(sender);
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

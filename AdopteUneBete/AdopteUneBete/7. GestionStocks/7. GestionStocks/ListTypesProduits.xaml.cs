using _7._GestionStocks.Controllers;
using _7._GestionStocks.Data;
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

namespace _7._GestionStocks
{
    /// <summary>
    /// Logique d'interaction pour ListTypesProduits.xaml
    /// </summary>
    public partial class ListTypesProduits : Window
    {
        public TypesProduitsController _controllerTypesProduits;
        public ListTypesProduits(object sender, GestionStocksContext context)
        {
            InitializeComponent();
            _controllerTypesProduits = new TypesProduitsController(context);
            Datagrid.ItemsSource = _controllerTypesProduits.GetAllTypesProduits();
        }
        private void GetCrudTypesProduits(object sender, RoutedEventArgs e)
        {
            CRUDTypesProduits subWindow = new CRUDTypesProduits(sender);
            //subWindow.Left = this.Left;
            //subWindow.Top = this.Top;
            //this.Visibility = Visibility.Hidden;
            this.Opacity = 0.8;
            subWindow.ShowDialog();
            this.Opacity = 1;
            //this.Visibility = Visibility.Visible;
            //this.Left = subWindow.Left;
            //this.Top = subWindow.Top;
        }

        private void CloseWindow(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}

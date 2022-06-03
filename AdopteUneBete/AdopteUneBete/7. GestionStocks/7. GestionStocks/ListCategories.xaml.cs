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
    /// Logique d'interaction pour ListCategories.xaml
    /// </summary>
    public partial class ListCategories : Window
    {
        public CategoriesController _controllerCategories;

        public ListCategories(object sender, GestionStocksContext context)
        {
            InitializeComponent();
            _controllerCategories = new CategoriesController(context);
            Datagrid.ItemsSource = _controllerCategories.GetAllCategories();
        }
        private void GetCrudCategories(object sender, RoutedEventArgs e)
        {
            CRUDArticles subWindow = new CRUDArticles(sender);
            //subWindow.Left = this.Left;
            //subWindow.Top = this.Top;
            this.Opacity = 0.8;
            subWindow.ShowDialog();
            this.Opacity = 1;
            //this.Left = subWindow.Left;
            //this.Top = subWindow.Top;
        }

        private void CloseWindow(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}

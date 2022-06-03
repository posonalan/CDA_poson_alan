using _7._GestionStocks.Data.Models;
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
    /// Logique d'interaction pour CRUDTypesProduits.xaml
    /// </summary>
    public partial class CRUDTypesProduits : Window
    {
        public CRUDTypesProduits(object sender)
        {
            InitializeComponent();
            LabelleCrud.Content = ((Button)sender).Content;
            btnEnvoyer.Content = ((Button)sender).Content;
        }
        private void CloseWindow(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}

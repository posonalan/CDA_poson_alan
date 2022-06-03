using _7._GestionStocks.Controllers;
using _7._GestionStocks.Data;
using _7._GestionStocks.Data.Models;
using _7._GestionStocks.Data.Profiles;
using _7._GestionStocks.Data.Services;
using AutoMapper;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace _7._GestionStocks
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public GestionStocksContext _context;

        public MainWindow()
        {
            InitializeComponent();
            _context = new GestionStocksContext();
        }

        private void GetListArticles(object sender, RoutedEventArgs e)
        {
            ListArticles subWindow = new ListArticles(sender, _context);
            subWindow.Left = this.Left;
            subWindow.Top = this.Top;
            this.Visibility = Visibility.Hidden;
            subWindow.ShowDialog();
            this.Visibility = Visibility.Visible;
            this.Left = subWindow.Left;
            this.Top = subWindow.Top;
        }

        private void GetListCategories(object sender, RoutedEventArgs e)
        {
            ListCategories subWindow = new ListCategories(sender, _context);
            subWindow.Left = this.Left;
            subWindow.Top = this.Top;
            this.Visibility = Visibility.Hidden;
            subWindow.ShowDialog();
            this.Visibility = Visibility.Visible;
            this.Left = subWindow.Left;
            this.Top = subWindow.Top;
        }

        private void GetListTypesProduits(object sender, RoutedEventArgs e)
        {
            ListTypesProduits subWindow = new ListTypesProduits(sender, _context);
            subWindow.Left = this.Left;
            subWindow.Top = this.Top;
            this.Visibility = Visibility.Hidden;
            subWindow.ShowDialog();
            this.Visibility = Visibility.Visible;
            this.Left = subWindow.Left;
            this.Top = subWindow.Top;
        }
    }
}

using CantineMartine.Data;
using CantineMartine.Windows;
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

namespace CantineMartine
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MyDbContext _context;
        public MainWindow()
        {
            InitializeComponent();
            _context = new MyDbContext();
            //var _service = new MenuService(_context);
            //alan.ItemsSource = _service.GetAllMenu();
        }

        private void AffGestionDesMenus(object sender, RoutedEventArgs e)
        {
            GestionMenu fenetre = new GestionMenu(_context, sender);
            this.Opacity = 0.7;
            this.Visibility = Visibility.Hidden;
            fenetre.ShowDialog();

            this.Visibility = Visibility.Visible;
            this.Opacity = 1; 
        }

        private void AffGestionDesPlats(object sender, RoutedEventArgs e)
        {
            ListePlats subWindow = new ListePlats(sender, _context);
            subWindow.Left = this.Left;
            subWindow.Top = this.Top;
            this.Visibility = Visibility.Hidden;
            subWindow.ShowDialog();
            this.Visibility = Visibility.Visible;
            this.Left = subWindow.Left;
            this.Top = subWindow.Top;
        }

        private void GestionDesProduits_Click(object sender, RoutedEventArgs e)
        {
            ListeProduits win = new ListeProduits();
            this.Visibility = Visibility.Hidden;
            win.ShowDialog();
            this.Visibility = Visibility.Visible;
        }

        private void GestionDesCategoriesDeProduit_Click(object sender, RoutedEventArgs e)
        {
            CategorieProduits win = new CategorieProduits();
            this.Visibility = Visibility.Hidden;
            win.ShowDialog();
            this.Visibility = Visibility.Visible;
        }

        private void GestionDesCategoriesDePlat_Click(object sender, RoutedEventArgs e)
        {
            CategoriePlat win = new CategoriePlat();
            this.Visibility = Visibility.Hidden;
            win.ShowDialog();
            this.Visibility = Visibility.Visible;
        }
    }
}

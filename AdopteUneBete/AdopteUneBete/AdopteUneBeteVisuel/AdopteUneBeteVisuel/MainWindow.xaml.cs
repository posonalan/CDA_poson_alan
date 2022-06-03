using AdopteUneBeteVisuel.Data;
using System.Windows;


namespace AdopteUneBeteVisuel
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
        }

        private void GetGestionRace(object sender, RoutedEventArgs e)
        {
            GestionRaces subWindow = new GestionRaces(sender, _context);
            subWindow.Left = this.Left;
            subWindow.Top = this.Top;
            this.Visibility = Visibility.Hidden;
            subWindow.ShowDialog();
            this.Visibility = Visibility.Visible;
            this.Left = subWindow.Left;
            this.Top = subWindow.Top;
        }
        private void GetGestionAnimaux(object sender, RoutedEventArgs e)
        {
            GestionAnimaux subWindow = new GestionAnimaux(sender, _context);
            subWindow.Left = this.Left;
            subWindow.Top = this.Top;
            this.Visibility = Visibility.Hidden;
            subWindow.ShowDialog();
            this.Visibility = Visibility.Visible;
            this.Left = subWindow.Left;
            this.Top = subWindow.Top;
        }
        private void GetGestionEspece(object sender, RoutedEventArgs e)
        {
            GestionEspeces subWindow = new GestionEspeces(sender, _context);
            subWindow.Left = this.Left;
            subWindow.Top = this.Top;
            this.Visibility = Visibility.Hidden;
            subWindow.ShowDialog();
            this.Visibility = Visibility.Visible;
            this.Left = subWindow.Left;
            this.Top = subWindow.Top;
        }
        private void GetGestionAlimentation(object sender, RoutedEventArgs e)
        {
            GestionAlimentations subWindow = new GestionAlimentations(sender, _context);
            subWindow.Left = this.Left;
            subWindow.Top = this.Top;
            this.Visibility = Visibility.Hidden;
            subWindow.ShowDialog();
            this.Visibility = Visibility.Visible;
            this.Left = subWindow.Left;
            this.Top = subWindow.Top;
        }
        private void GetGestionUser(object sender, RoutedEventArgs e)
        {
            GestionUsers subWindow = new GestionUsers(sender, _context);
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

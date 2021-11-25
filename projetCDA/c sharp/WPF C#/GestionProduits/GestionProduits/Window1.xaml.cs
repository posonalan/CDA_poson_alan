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

namespace GestionProduits
{
    /// <summary>
    /// Logique d'interaction pour Window1.xaml
    /// </summary>
    public partial class Window1 : Window
    {
        MainWindow fenetreMere;

        public Window1(string mot, MainWindow w)
        {
            InitializeComponent();
            /* contenu du label mot */ 
            labelMot.Content = mot;
            fenetreMere = w;
        }

        private void boutonRetour_Click(object sender, RoutedEventArgs e)
        {
            fenetreMere.MAJRetour("test");
            this.Close();
        }

    }
}

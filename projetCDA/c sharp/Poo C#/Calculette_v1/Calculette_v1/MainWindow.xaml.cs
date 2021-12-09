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

namespace Calculette_v1
{
    /// <summary>
    /// Logique d'interaction pour MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void BoutonNumerique_Click(object sender, RoutedEventArgs e)
        {
            // sender est l'element qui genere l'action 
            tbxResultat.Text += ((Button)sender).Content;
        }

        private void BoutonInit_Click(object sender, RoutedEventArgs e)
        {
            tbxResultat.Text = "";
        }

        //private void CalculeFacile(object sender, RoutedEventArgs e, int valeur1, char operateur, int valeur2)
        //{

          
            
            //     resultat = 0;
            //    switch (operateur)
            //    {
            //        case '+':
            //            resultat = valeur1 + valeur2;
            //            break;
            //        case '-':
            //            resultat = valeur1 - valeur2;
            //            break;
            //        case '*':
            //            resultat = valeur1 * valeur2;
            //            break;
            //        case '/':
            //            resultat = valeur1 / valeur2;
            //            break;
            //        case '$':
            //            resultat = Math.Pow(valeur1, valeur2);
            //            break;
            //        default:
            //            break;
            //    }
            //}


        //private void Window_SizeChanged(object sender, SizeChangedEventArgs e)
        //{
        //    double w = Application.Current.MainWindow.Width;
        //    double h = Application.Current.MainWindow.Height;
        //    tbxResultat.Text = "w " + w + ", h " + h;
        //    bouton1.FontSize = h / 20;
        //}


    }
}

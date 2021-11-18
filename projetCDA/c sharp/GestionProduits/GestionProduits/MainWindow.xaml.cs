using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
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

namespace GestionProduits
{
    /// <summary>
    /// Logique d'interaction pour MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        /* initialisation de la liste produit */
            List<Produits> liste; 
        /* route pour trouver le fichier */ 
        string path = @"../../../Produits.json";
        

        public MainWindow()
        {
            InitializeComponent();
            /* creation de la liste */ 
            liste = CreeListe();
            /* remplir la grille avec le contenu */ 
            RemplirGrid(); 
            /* creation du fichier */ 
            CreeFichier(); 
        }

        public void RemplirGrid()
        {/* on remplie la grille avec la liste */ 
            listeProduits.ItemsSource = liste; 
        }

        /* fonction cree liste avec la liste de produits */ 
        private List<Produits> CreeListe()
        {/* on cree la liste */ 
            List<Produits> liste = new List<Produits>()

                for ( int i = 1; i<15; i++)
            {
                Produits p = new Produits
            }
        }

        
    }
}

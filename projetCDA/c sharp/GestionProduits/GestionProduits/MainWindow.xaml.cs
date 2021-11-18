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
        {       /* on cree la liste */ 
            List<Produits> liste = new List<Produits>();

                for ( int i = 1; i<15; i++)
            {   /* on crée les produits */ 
                Produits p = new Produits(1," Produit "+i,i * 2 ); 
                liste.Add(p);
            }

        }  /* fonction creation du fichier */ 
            private void CreerFichier()
            { /* fichier / ecrit tout le text / la route et le format choisi / ainsi que le contenu grace a liste */ 
                File.WriteAllText(path,JsonConvert.SerializeObject(liste, Formatting.Indented)); 
            }

            private string LireFichier()
                /* renvoi un tableau avec le contenu present dans le fichier */ 
            {
                string chaine; 
                /* essai */ 
                try
                {
                    /* lecture et stockage dans la chaine */ 
                    chaine = File.ReadAllText(path); 
                }
                /* sinon */ 
                catch ( Exception e)
                { /* on dit qu'une exeption s'est produite et on affiche le message d'erreur */ 
                    Console.WriteLine("Une exception s'est produite : " + e.message); 
                    Console.WriteLine("Indiquer le path/route :"); 
                    /* on analyse la nouvelle route entrer */ 
                    path = Console.ReadLine(); 
                    /* on met le resultat de la lecture du fichier dans la chaine */ 
                    chaine = LireFichier(); 
                    }
                return chaine; 
                }
            /* fonction qui transforme le fichier en json */ 
            private List<Produits> TransformeJson()
                {
                /* une fois modifier on met le contenue dans la chaine a la place de l'ancien contenu */ 
                string chaine = LireFichier(); 
                /* on met au format json notre liste */
                List<Produits> liste = JsonConvert.DeserializeObject<List<Produits>>(chaine);
                return liste; 
                }
            
        }
   }

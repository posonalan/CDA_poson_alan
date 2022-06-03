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

namespace AdopteUneBeteVisuel
{
    /// <summary>
    /// Interaction logic for CRUDUsers.xaml
    /// </summary>
    public partial class CRUDUsers : Window
    {
        public CRUDUsers(object sender)
        {
            InitializeComponent();
        }

        private void RetourLP_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}

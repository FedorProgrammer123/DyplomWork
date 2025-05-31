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
using DyplomWork.Datas;

namespace DyplomWork.Pages
{
    /// <summary>
    /// Логика взаимодействия для EditReport.xaml
    /// </summary>
    public partial class EditReport : Page
    {
        public static TestReport contextTests = new TestReport();
        public EditReport(string contextTests2)
        {
           
            InitializeComponent();
            if (contextTests2 == null)
            {
                
            }
        }

        private void GoBackButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.ViewReport());
        }
    }
}

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

namespace DyplomWork.Pages
{
    /// <summary>
    /// Логика взаимодействия для ShowReportStudentVersion.xaml
    /// </summary>
    public partial class ShowReportStudentVersion : Page
    {
        public ShowReportStudentVersion()
        {
            InitializeComponent();
            ShowReport.ItemsSource = Datas.DyplomWorkEntities1.GetContext().TestReport.ToList();
        }

        private void GoStudentCabinetBack_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.StudentCabinet(Classes.CurrentUser.UserEmail,Classes.CurrentUser.UserPassword));
        }
    }
}

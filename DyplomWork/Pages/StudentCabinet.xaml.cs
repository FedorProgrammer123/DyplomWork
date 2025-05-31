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
    /// Логика взаимодействия для StudentCabinet.xaml
    /// </summary>
    public partial class StudentCabinet : Page
    {
        public StudentCabinet(string username,string lastname)
        {
            InitializeComponent();
            ShowName.Text = "Имя: " + username;
            ShowLastName.Text = "Фамилия: " + lastname;
            ShowTest.ItemsSource = Classes.Context.GetContext().test.ToList();
        }

        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Autorization());
        }

        private void GoToAddReport_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new AddTestReport());
        }
    }
}

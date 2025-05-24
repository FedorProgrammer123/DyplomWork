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
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace DyplomWork.Pages
{
    /// <summary>
    /// Логика взаимодействия для TeacherCabinet.xaml
    /// </summary>
    public partial class TeacherCabinet : Page
    {
        public TeacherCabinet(string userfemale, string username)
        {
            InitializeComponent();
            ShowFemale.Text = userfemale;
            ShowName.Text = username;
        }

        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.Autorization());
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.AddTest());
        }

        private void AddUser_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.AddStudent());
        }
    }
}

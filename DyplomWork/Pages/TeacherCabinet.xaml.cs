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
            TestView.ItemsSource = DyplomWorkEntities1.GetContext().Test.ToList();
        }

        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.Autorization());
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.AddTest(null));
        }

        private void AddUser_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.AddStudent());
        }

        private void ShowReport_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.ViewReport());
        }

        private void ShowUserList_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.ShowStudents());
        }

        private void EditTest_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.AddTest((sender as Button).DataContext as Test));
        }

        private void DeleteTestButton_Click(object sender, RoutedEventArgs e)
        {
            var DeleteTest = TestView.SelectedItems.Cast<Test>().ToList();
            try
            {
                DyplomWorkEntities1.GetContext().Test.RemoveRange(DeleteTest);
                MessageBox.Show("Успешное удаление","Success",MessageBoxButton.OK,MessageBoxImage.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка удаления","Error",MessageBoxButton.OK,MessageBoxImage.Error);
            }
        }
    }
}

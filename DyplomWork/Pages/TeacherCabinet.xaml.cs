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

        private void DeleteUserButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var idStudent = int.Parse(DeleteUser.Text);
                var userRemove = Classes.Context.GetContext().Users.FirstOrDefault(u => u.studentId == idStudent);
                if (string.IsNullOrEmpty(idStudent.ToString()))
                {
                    MessageBox.Show("Введите id","Error",MessageBoxButton.OK,MessageBoxImage.Error);
                }
                else if (userRemove != null)
                {
                    Classes.Context.GetContext().Users.Remove(userRemove);
                    MessageBox.Show("Студент удалён", "Sucess", MessageBoxButton.OK, MessageBoxImage.Information);
                    Classes.Context.GetContext().SaveChanges();
                }
                else
                {
                    MessageBox.Show("Пользователь с таким id не найден", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка в базе", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void ShowReport_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.ViewReport());
        }

        private void ShowUserList_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.ShowStudents());
        }
    }
}

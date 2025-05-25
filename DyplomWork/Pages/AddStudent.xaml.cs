using System;
using System.Collections.Generic;
using System.Data.Entity;
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
    /// Логика взаимодействия для AddStudent.xaml
    /// </summary>
    public partial class AddStudent : Page
    {
        public AddStudent()
        {
            InitializeComponent();
            
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.AdminCabinet(Classes.CurrentUser.UserEmail,Classes.CurrentUser.UserPassword));
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
           
        }

        private void Add_Click_1(object sender, RoutedEventArgs e)
        {
            try
            {
                var Name = EnterNameBox.Text;
                var Female = EnterFemaleBox.Text;
                var Email = EnterEmailBox.Text;
                var password = EnterPasswordBox.Password;
                var group = int.Parse(EnterGroupNumberBox.Text);
                var CourseYear = int.Parse(EnterCourseBox.Text);
                var Users = new Users()
                {
                    firstName = Name,
                    lastName = Female,
                    email = Email,
                    password = password,
                    groupNumber = group,
                    courseYear = CourseYear,
                    Role = 3
                };
                Classes.Context.GetContext().Users.Add(Users);
                Classes.Context.GetContext().SaveChanges();
                MessageBox.Show("Успешное добавление","Success",MessageBoxButton.OK,MessageBoxImage.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка добавления","Error",MessageBoxButton.OK,MessageBoxImage.Error);
            }
        }
    }
}

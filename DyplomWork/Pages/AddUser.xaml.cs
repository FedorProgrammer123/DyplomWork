using DyplomWork.Classes;
using DyplomWork.Datas;
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
    /// Логика взаимодействия для AddUser.xaml
    /// </summary>
    public partial class AddUser : Page
    {
        private Users users = new Users();
        public AddUser(Users usersnew)
        {
            InitializeComponent();
            
            if (usersnew != null)
            {
                users = usersnew;
            }
            DataContext = users;
            SelectRoleBox.ItemsSource = DyplomWorkEntities1.GetContext().Roles.Where(r => r != null).ToList();
            EnterCourseBox.ItemsSource = DyplomWorkEntities1.GetContext().Users.Where(r => r != null).ToList();
            EnterGroupNumberBox.ItemsSource = DyplomWorkEntities1.GetContext().Users.Where(r => r != null).ToList();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AdminCabinet(Classes.CurrentUser.UserEmail, Classes.CurrentUser.UserPassword));      
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            string firstName = EnterNameBox.Text;
            string lastName = EnterFemaleBox.Text;
            string email = EnterEmailBox.Text;
            string password = EnterPasswordBox.Password;
            // Безопасное парсинг значений
            if (!int.TryParse(EnterGroupNumberBox.Text, out int EnterGroup))
            {
                MessageBox.Show("Некорректное значение группы. Пожалуйста, введите целое число.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            else if (!int.TryParse(EnterCourseBox.Text, out int EnterCourse))
            {
                MessageBox.Show("Некорректное значение курса. Пожалуйста, введите целое число.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            else if (!int.TryParse(SelectRoleBox.SelectedValue?.ToString(), out int SelectRole))
            {
                MessageBox.Show("Некорректное значение роли. Пожалуйста, введите целое число.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }
            else
            {
                var user = new Users()
                {
                    firstName = firstName,
                    lastName = lastName,
                    email = email,
                    password = password,
                    groupNumber = EnterGroup,
                    courseYear = EnterCourse,
                    Role = SelectRole
                };
                if (users.studentId == 0)
                {
                    DyplomWorkEntities1.GetContext().Users.Add(users);
                }
                try
                {
                    
                    DyplomWorkEntities1.GetContext().SaveChanges();
                    MessageBox.Show("Пользователь успешно добавлен");

                }
                catch (Exception ex)
                {
                    // Обрабатываем возможные ошибки
                    MessageBox.Show($"Ошибка при добавлении пользователя: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                
            }
            
        }
    }
}

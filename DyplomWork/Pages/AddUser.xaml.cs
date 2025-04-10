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
        public AddUser()
        {
            InitializeComponent();
            SelectRoleBox.ItemsSource = Classes.Context.GetContext().roles.Where(r => r != null).ToList();
            EnterCourseBox.ItemsSource = Classes.Context.GetContext().Users.Where(r => r != null).ToList();
            EnterGroupNumberBox.ItemsSource = Classes.Context.GetContext().Users.Where(r => r != null).ToList();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AdminCabinet(Classes.CurrentUser.UserEmail, Classes.CurrentUser.UserPassword));      
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                // Получаем данные из UI
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

                if (!int.TryParse(EnterCourseBox.Text, out int EnterCourse))
                {
                    MessageBox.Show("Некорректное значение курса. Пожалуйста, введите целое число.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                if (!int.TryParse(SelectRoleBox.SelectedValue?.ToString(), out int SelectRole))
                {
                    MessageBox.Show("Некорректное значение роли. Пожалуйста, введите целое число.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                using (var model = new Classes.Context())
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
                    Classes.Context.GetContext().Users.Add(user);
                    Classes.Context.GetContext().SaveChanges();
                    MessageBox.Show("Пользователь успешно добавлен");
                }
            }
            catch (Exception ex)
            {
                // Обрабатываем возможные ошибки
                MessageBox.Show($"Ошибка при добавлении пользователя: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}

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
    /// Логика взаимодействия для Autorization.xaml
    /// </summary>
    public partial class Autorization : Page
    {
        public Autorization()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            string login = EnterLoginBox.Text;
            string password = EnterPasswordBox.Password;
            using(var model = new Classes.Context())
            {
                var ExixstsUser = model.Users.FirstOrDefault(u => u.email == login && u.password == password);
                if(ExixstsUser == null)
                {
                    string title = "Error";
                    string header = "Ошибка! Неверный логин или пароль";
                    MessageBoxButton button = MessageBoxButton.OK;
                    MessageBoxImage image = MessageBoxImage.Error;
                    MessageBoxResult result = MessageBox.Show(title,header,button,image);
                }
                else
                {
                    var ExistsRole = Classes.Context.GetContext().Users.Where(u => u.email == login && u.password == password).FirstOrDefault();
                    Manager.users = ExistsRole;
                    switch (ExistsRole.Role)
                    {
                        case 1:
                            MessageBox.Show("Добро пожаловать, администратор");
                            Manager.MainFrame.Navigate(new Pages.AdminCabinet());
                            break;
                        case 2:
                            MessageBox.Show("Добро пожаловать, преподаватель");
                            Manager.MainFrame.Navigate(new Pages.TeacherCabinet());
                            break;
                        case 3:
                            MessageBox.Show("Добро пожаловать, студент");
                            Manager.MainFrame.Navigate(new Pages.StudentCabinet());
                            break;
                    }
                    MessageBox.Show("Добро пожаловать");
                }
            }
        }
    }
}

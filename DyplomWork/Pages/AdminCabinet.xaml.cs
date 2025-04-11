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
    /// Логика взаимодействия для AdminCabinet.xaml
    /// </summary>
    public partial class AdminCabinet : Page
    {
        public AdminCabinet(string userfemale,string username)
        {
            InitializeComponent();
            ShowFemale.Text = userfemale;
            ShowName.Text = username;
        }

        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new Pages.Autorization());
        }

        private void AddUser_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new Pages.AddUser());
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new Pages.ShowUsers());
        }

        private void DeleteUserButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                // Получаем ID из текстового поля
                int id = int.Parse(DeleteUser.Text);

                // Удаляем пользователя с указанным ID
                var userToRemove = Classes.Context.GetContext().Users.FirstOrDefault(u => u.studentId == id);
                if (userToRemove != null)
                {
                    Classes.Context.GetContext().Users.Remove(userToRemove);
                    MessageBox.Show($"Пользователь с ID {id} удалён.");
                    Classes.Context.GetContext().SaveChanges();
                }
                else
                {
                    MessageBox.Show($"Пользователь с ID {id} не найден.");
                }
            }
            catch (FormatException)
            {
                MessageBox.Show("Необходимо ввести корректный ID.");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при удалении пользователя: {ex.Message}");
            }
        }
    }
    }

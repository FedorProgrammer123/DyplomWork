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
            ShowUsers.ItemsSource = DyplomWorkEntities1.GetContext().Users.ToList();
        }

        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new Pages.Autorization());
        }

        private void AddUser_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new Pages.AddUser(null));
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new Pages.ShowUsers());
        }

        private void DeleteUserButton_Click(object sender, RoutedEventArgs e)
        {
           
            
        }

        private void EditUser_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new AddUser((sender as Button).DataContext as Users));
        }
    }
    }

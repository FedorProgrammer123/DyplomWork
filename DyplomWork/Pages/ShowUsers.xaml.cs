using DyplomWork.Classes;
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
    /// Логика взаимодействия для ShowUsers.xaml
    /// </summary>
    public partial class ShowUsers : Page
    {
        public ShowUsers()
        {
            InitializeComponent();
            ShowUsersList.ItemsSource = Classes.Context.GetContext().Users.ToList();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (!string.IsNullOrEmpty(Classes.CurrentUser.UserEmail) && !string.IsNullOrEmpty(Classes.CurrentUser.UserPassword))
            {
                Classes.Manager.MainFrame.Navigate(new AdminCabinet(CurrentUser.UserEmail, CurrentUser.UserPassword));
            }
            else
            {
                MessageBox.Show("Данные пользователя не были установлены.");
            }
        }
    }
}

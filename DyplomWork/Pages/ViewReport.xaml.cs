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
using DyplomWork.Classes;
using DyplomWork.Datas;

namespace DyplomWork.Pages
{
    /// <summary>
    /// Логика взаимодействия для ViewReport.xaml
    /// </summary>
    public partial class ViewReport : Page
    {
        public ViewReport()
        {
            InitializeComponent();
            ShowReport.ItemsSource = Datas.DyplomWorkEntities1.GetContext().TestReport.ToList();
        }

        private void EditReport_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new EditReport((sender as Button).DataContext as TestReport));
        }


        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.TeacherCabinet(Classes.CurrentUser.UserEmail, Classes.CurrentUser.UserPassword));
        }

        private void GoAddButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.EditReport(null));
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            var hotelsForRemove = ShowReport.SelectedItems.Cast<TestReport>().ToList();
           if(  MessageBox.Show("Вы действительно хотите удалить отсчёт?","Delete",MessageBoxButton.YesNo,MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    DyplomWorkEntities1.GetContext().TestReport.RemoveRange(hotelsForRemove);
                    DyplomWorkEntities1.GetContext().SaveChanges();
                    MessageBox.Show("Успешное удаление","Success",MessageBoxButton.OK,MessageBoxImage.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Ошибка удаления","Error",MessageBoxButton.OK,MessageBoxImage.Information);
                }
            }
            
            
        }
    }
}

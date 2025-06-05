using System;
using System.Collections.Generic;
using System.IO;
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
using System.IO;
using Microsoft.Win32;
using System.Data.Entity.Migrations;
namespace DyplomWork.Pages
{
    /// <summary>
    /// Логика взаимодействия для EditReport.xaml
    /// </summary>
    public partial class EditReport : Page
    {
        private byte[] _selectedImageBytes;
        public static TestReport ContextTests = new TestReport();

        // Переменная для хранения исходного отчёта, передаваемого в редактор

        public EditReport(TestReport _test)
        {
            InitializeComponent();
            if (_test != null)
            {
                ContextTests = _test;
            }

            // Заполняем список тестов
            SelectTestBox.ItemsSource = DyplomWorkEntities1.GetContext().TitleTest.ToList();

            // Привязываем данные формы к оригинальному отчёту
            DataContext = ContextTests;
        }

        // Метод загрузки существующих данных в UI


        private void GoBackButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.ViewReport());
        }

        private void AddImage_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog
            {
                Filter = "Image Files (*.jpg;*.jpeg;*.png)|*.jpg;*.jpeg;*.png",
                Multiselect = false,
                CheckFileExists = true
            };

            bool? result = openFileDialog.ShowDialog();

            if (result == true)
            {
                string filePath = openFileDialog.FileName;
                FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read);
                BinaryReader br = new BinaryReader(fs);
                _selectedImageBytes = br.ReadBytes((int)fs.Length); // Получение массива байтов изображения
                br.Close();
                fs.Close();
                MessageBox.Show("Файл успешно выбран");
            }
        }

        private void AddReport_Click(object sender, RoutedEventArgs e)
        {
            // Проверка заполнения полей
            if (string.IsNullOrEmpty(EnterNameBox.Text) ||
                string.IsNullOrEmpty(EnterFemaleBox.Text) ||
                string.IsNullOrEmpty(SelectTestBox.Text))
            {
                MessageBox.Show("Данные пустые", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
                // Проверяем, существует ли тест с указанным названием
                var selectedTest = DyplomWorkEntities1.GetContext().TitleTest.FirstOrDefault(t => t.title == SelectTestBox.Text);
                // Готовим обновлённую версию отчёта

                if (ContextTests.ID == 0)
                {
                    ContextTests.Name = EnterNameBox.Text;
                    ContextTests.Female = EnterFemaleBox.Text;
                    ContextTests.TitleTestID = selectedTest.IDTitle;
                    ContextTests.TestScreen = _selectedImageBytes;
                    ContextTests.Mark = int.Parse(EnterMarkBox.Text);
                    
                }
                try
                {
                    DyplomWorkEntities1.GetContext().TestReport.AddOrUpdate(ContextTests);
                    DyplomWorkEntities1.GetContext().SaveChanges(); // Сохраняем изменения
                    MessageBox.Show("Отчёт успешно обновлён", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                    // Применяем изменения

                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Ошибка обновления отчёта:\n{ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            
        }
    }
}

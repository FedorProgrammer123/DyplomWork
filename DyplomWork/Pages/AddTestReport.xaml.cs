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
using Microsoft.Win32;
namespace DyplomWork.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddTestReport.xaml
    /// </summary>
    public partial class AddTestReport : Page
    {
        private byte[] _selectedImageBytes;
        public AddTestReport()
        {
            InitializeComponent();
            SelectTestBox.ItemsSource = Classes.Context.GetContext().titleTest.ToList();
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

            using (var context = DyplomWorkEntities1.GetContext())
            {
                // Проверяем, существует ли тест с таким названием
                var existingTest = context.TitleTest.FirstOrDefault(t => t.title == SelectTestBox.Text);

                if (existingTest == null)
                {
                    // Если теста ещё нет — добавляем новый
                    var newTest = new TitleTest { title = SelectTestBox.Text };
                    context.TitleTest.Add(newTest);
                    context.SaveChanges(); // Сохранение изменений

                    // Получаем ID нового теста
                    int testId = newTest.IDTitle;
                    existingTest = newTest;
                }
                else
                {
                    // Используем существующий идентификатор теста
                    int testId = existingTest.IDTitle;
                }

                // Создаем отчет
                var report = new Datas.TestReport
                {
                    Name = EnterNameBox.Text,
                    Female = EnterFemaleBox.Text,
                    TitleTestID = existingTest.IDTitle,
                    TestScreen = _selectedImageBytes
                };

                try
                {
                    context.TestReport.Add(report); // Добавляем отчёт
                    context.SaveChanges();          // Сохраняем изменения

                    MessageBox.Show("Отчет успешно добавлен", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Ошибка добавления отчета:\n{ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }

            }
        }

        private void GoBackButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.StudentCabinet(Classes.CurrentUser.UserEmail,Classes.CurrentUser.UserPassword));
        }
    }
}

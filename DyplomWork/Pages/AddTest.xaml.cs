using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
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
    /// Логика взаимодействия для AddTest.xaml
    /// </summary>
    public partial class AddTest : Page
    {
        private Test adding = new Test();
        public AddTest(Test AddingTest)
        {
            if (AddingTest != null)
            {
                adding = AddingTest;
            }
            InitializeComponent();
            DataContext = adding;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.TeacherCabinet(Classes.CurrentUser.UserEmail,Classes.CurrentUser.UserPassword));
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            try
            {
                var Title = SelectTitle.Text;
                var Description = EnterDesctiption.Text;
                var maxScore = int.Parse(EnterMaxScore.Text);
                var timeLimit = TimeSpan.Parse(EnterTimeLimit.Text);
                var course = int.Parse(EnterCourse.Text);
                var href = EnterHref.Text;
                var TitleTest = new TitleTest()
                {
                    title = Title
                };
                var Test = new Test()
                {
                    testId = TitleTest.IDTitle,
                    description = Description,
                    maxScore = maxScore,
                    time_limit = timeLimit,
                    courseId = course,
                    Href = href

                };
                if (Classes.Context.GetContext().titleTest.Any(u => u.title == Title))
                {
                    MessageBox.Show("Ошибка тест уже есть в базе", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                else
                {
                    Classes.Context.GetContext().titleTest.AddOrUpdate(TitleTest);
                    Classes.Context.GetContext().test.AddOrUpdate(Test);
                    Classes.Context.GetContext().SaveChanges();
                    MessageBox.Show("Тест успешно добавлен", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка добавления","Error",MessageBoxButton.OK,MessageBoxImage.Error);
            }
        }
    }
}

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

                try
                {
                    // Определяем режим операции: добавление или редактирование
                    if (Test.testId > 0) // Проверяем, задан ли id теста
                    {
                        // Редактируем существующий тест
                        Test.testId = TitleTest.IDTitle;
                        Test.description = Description;
                        Test.maxScore = maxScore;
                        Test.time_limit = timeLimit;
                        Test.courseId = course;
                        Test.Href = href;

                        // Обновляем свойства теста в БД
                        DyplomWorkEntities1.GetContext().Test.Attach(Test);
                        DyplomWorkEntities1.GetContext().Entry(Test).State = System.Data.Entity.EntityState.Modified;
                    }
                    else
                    {
                        // Создаем новый тест
                        DyplomWorkEntities1.GetContext().TitleTest.AddOrUpdate(TitleTest);
                        DyplomWorkEntities1.GetContext().Test.AddOrUpdate(Test);
                    }

                    // Сохраняем изменения в базе данных
                    DyplomWorkEntities1.GetContext().SaveChanges();
                    MessageBox.Show("Тест успешно Отредактирован", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString(), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
            
    }

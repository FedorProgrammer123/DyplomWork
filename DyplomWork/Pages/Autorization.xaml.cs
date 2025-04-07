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
using System.Windows.Markup;
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
        private int failedAttempts = 0;
        public Autorization()
        {
            InitializeComponent();
        }

        private async void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                StringBuilder errors = new StringBuilder();
                if (string.IsNullOrEmpty(EnterLoginBox.Text))
                {
                    errors.AppendLine("Заполните логин");
                }
                if (string.IsNullOrEmpty(EnterPasswordBox.Password))
                {
                    errors.AppendLine("Заполните пароль");
                }

                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                if (Classes.Context.GetContext().Users
                    .Any(d => d.email == EnterLoginBox.Text &&
                    d.password == EnterPasswordBox.Password))
                {
                    var user = Classes.Context.GetContext().Users.Where(d => d.email ==
                    EnterLoginBox.Text &&
                    d.password == EnterPasswordBox.Password).FirstOrDefault();
                    Classes.Manager.users = user;
                    switch (user.Role)
                    {
                        case 1:
                            Classes.Manager.MainFrame.Navigate(new Pages.AdminCabinet(CurrentUser.UserEmail,CurrentUser.UserPassword));
                            break;
                        case 2:
                            Classes.Manager.MainFrame.Navigate(new Pages.TeacherCabinet());
                            break;
                        case 3:
                            Classes.Manager.MainFrame.Navigate(new Pages.StudentCabinet(CurrentUser.UserEmail, CurrentUser.UserPassword));
                            break;
                    }
                    MessageBox.Show("Успех", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                    LabelCaptcha.Visibility = Visibility.Collapsed;
                    CaptchaBox.Visibility = Visibility.Collapsed;
                    CaptchaWriteBox.Visibility = Visibility.Collapsed;
                    CaptchaWriteBox.Text = "";
                    failedAttempts = 0;
                }
                else
                {
                    MessageBox.Show("Учетная запись не найдена", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    failedAttempts++;
                    LoadCaptcha();
                    ShowCaptchaFields();
                    if (failedAttempts > 1)
                    {
                        LoginButton.IsEnabled = false;
                        await Task.Delay(10000);
                        LoginButton.IsEnabled = true;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        private void LoadCaptcha()
        {
            string allowChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
            string captcha = "";
            Random random = new Random();

            for (int i = 0; i < 4; i++)
            {
                captcha += allowChars[random.Next(allowChars.Length)];
            }

            CaptchaBox.Text = captcha;
        }
        private void ShowCaptchaFields()
        {
            LabelCaptcha.Visibility = Visibility.Visible;
            CaptchaBox.Visibility = Visibility.Visible;
            CaptchaWriteBox.Visibility = Visibility.Visible;
        }

        private async void GuestButton_Click(object sender, RoutedEventArgs e)
        {
            // Проверка каптчи
            if (string.IsNullOrEmpty(CaptchaWriteBox.Text))
            {
                MessageBox.Show("Введите капчу", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                LoadCaptcha(); // Загружаем новую каптчу
                return;
            }

            if (!CaptchaWriteBox.Text.Equals(CaptchaBox.Text, StringComparison.Ordinal))
            {
                MessageBox.Show("Неверная капча!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                CaptchaWriteBox.Text = ""; // Очищаем поле ввода каптчи
                failedAttempts++;
                LoadCaptcha();
                ShowCaptchaFields();
                if (failedAttempts > 1)
                {
                    LoginButton.IsEnabled = false;
                    await Task.Delay(10000);
                    LoginButton.IsEnabled = true;
                }
                LoadCaptcha(); // Загружаем новую каптчу
                return;
            }

            // Каптча введена правильно
            MessageBox.Show("Каптча введена верно!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
            CaptchaWriteBox.Text = ""; // Очищаем поле ввода каптчи
            LoadCaptcha(); // Загружаем новую каптчу
        }
    }
}

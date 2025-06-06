﻿using DyplomWork.Classes;
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
            try
            {
                var ExixstsUser = DyplomWorkEntities1.GetContext().Users.FirstOrDefault(u => u.email == login && u.password == password);
                if (ExixstsUser == null)
                {
                    string title = "Error";
                    string header = "Ошибка! Неверный логин или пароль";
                    MessageBoxButton button = MessageBoxButton.OK;
                    MessageBoxImage image = MessageBoxImage.Error;
                    MessageBoxResult result = MessageBox.Show(title, header, button, image);
                }
                else
                {
                    var ExistsRole = Classes.Context.GetContext().Users.Where(u => u.email == login && u.password == password).FirstOrDefault();
                    Manager.users = ExistsRole;
                    switch (ExistsRole.Role)
                    {
                        case 1:
                            CurrentUser.UserEmail = login;
                            CurrentUser.UserPassword = password;
                            MessageBox.Show("Добро пожаловать, администратор", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                            Manager.MainFrame.Navigate(new Pages.AdminCabinet(ExixstsUser.firstName, ExixstsUser.lastName));
                            break;
                        case 2:
                            CurrentUser.UserEmail = login;
                            CurrentUser.UserPassword = password;
                            MessageBox.Show("Добро пожаловать, преподаватель", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                            Manager.MainFrame.Navigate(new Pages.TeacherCabinet(ExixstsUser.firstName, ExixstsUser.lastName));
                            break;
                        case 3:
                            CurrentUser.UserEmail = login;
                            CurrentUser.UserPassword = password;
                            MessageBox.Show("Добро пожаловать, студент", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                            Manager.MainFrame.Navigate(new Pages.StudentCabinet(ExixstsUser.firstName, ExixstsUser.lastName));
                            break;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка в базе","Error",MessageBoxButton.OK,MessageBoxImage.Error);
            }
                
            }
        }
    }
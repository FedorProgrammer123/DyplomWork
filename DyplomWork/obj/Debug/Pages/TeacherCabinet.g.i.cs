﻿#pragma checksum "..\..\..\Pages\TeacherCabinet.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "9535E4DAE486AC5385DBDF0B4DEF83C3D7EE0B3F414EE931E9E12F6BB72B20D5"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using DyplomWork.Pages;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace DyplomWork.Pages {
    
    
    /// <summary>
    /// TeacherCabinet
    /// </summary>
    public partial class TeacherCabinet : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector, System.Windows.Markup.IStyleConnector {
        
        
        #line 23 "..\..\..\Pages\TeacherCabinet.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock ShowFemale;
        
        #line default
        #line hidden
        
        
        #line 24 "..\..\..\Pages\TeacherCabinet.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock ShowName;
        
        #line default
        #line hidden
        
        
        #line 29 "..\..\..\Pages\TeacherCabinet.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ListView TestView;
        
        #line default
        #line hidden
        
        
        #line 68 "..\..\..\Pages\TeacherCabinet.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button AddUser;
        
        #line default
        #line hidden
        
        
        #line 69 "..\..\..\Pages\TeacherCabinet.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button ShowUserList;
        
        #line default
        #line hidden
        
        
        #line 76 "..\..\..\Pages\TeacherCabinet.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button DeleteTestButton;
        
        #line default
        #line hidden
        
        
        #line 77 "..\..\..\Pages\TeacherCabinet.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button ShowReport;
        
        #line default
        #line hidden
        
        
        #line 78 "..\..\..\Pages\TeacherCabinet.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button ExitButton;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/DyplomWork;component/pages/teachercabinet.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Pages\TeacherCabinet.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.ShowFemale = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 2:
            this.ShowName = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 3:
            this.TestView = ((System.Windows.Controls.ListView)(target));
            return;
            case 5:
            this.AddUser = ((System.Windows.Controls.Button)(target));
            
            #line 68 "..\..\..\Pages\TeacherCabinet.xaml"
            this.AddUser.Click += new System.Windows.RoutedEventHandler(this.AddUser_Click);
            
            #line default
            #line hidden
            return;
            case 6:
            this.ShowUserList = ((System.Windows.Controls.Button)(target));
            
            #line 69 "..\..\..\Pages\TeacherCabinet.xaml"
            this.ShowUserList.Click += new System.Windows.RoutedEventHandler(this.ShowUserList_Click);
            
            #line default
            #line hidden
            return;
            case 7:
            
            #line 70 "..\..\..\Pages\TeacherCabinet.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.Button_Click);
            
            #line default
            #line hidden
            return;
            case 8:
            this.DeleteTestButton = ((System.Windows.Controls.Button)(target));
            
            #line 76 "..\..\..\Pages\TeacherCabinet.xaml"
            this.DeleteTestButton.Click += new System.Windows.RoutedEventHandler(this.DeleteTestButton_Click);
            
            #line default
            #line hidden
            return;
            case 9:
            this.ShowReport = ((System.Windows.Controls.Button)(target));
            
            #line 77 "..\..\..\Pages\TeacherCabinet.xaml"
            this.ShowReport.Click += new System.Windows.RoutedEventHandler(this.ShowReport_Click);
            
            #line default
            #line hidden
            return;
            case 10:
            this.ExitButton = ((System.Windows.Controls.Button)(target));
            
            #line 78 "..\..\..\Pages\TeacherCabinet.xaml"
            this.ExitButton.Click += new System.Windows.RoutedEventHandler(this.ExitButton_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        void System.Windows.Markup.IStyleConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 4:
            
            #line 52 "..\..\..\Pages\TeacherCabinet.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.EditTest_Click);
            
            #line default
            #line hidden
            break;
            }
        }
    }
}


﻿#pragma checksum "..\..\..\Pages\AddTestReport.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "4A1BD9BDD9AFFCBF636BEEF4F31D12A6A4CBFE8EFEBD34660B6B4C3EF3CE4B88"
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
    /// AddTestReport
    /// </summary>
    public partial class AddTestReport : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 24 "..\..\..\Pages\AddTestReport.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox EnterNameBox;
        
        #line default
        #line hidden
        
        
        #line 26 "..\..\..\Pages\AddTestReport.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox EnterFemaleBox;
        
        #line default
        #line hidden
        
        
        #line 28 "..\..\..\Pages\AddTestReport.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox SelectTestBox;
        
        #line default
        #line hidden
        
        
        #line 30 "..\..\..\Pages\AddTestReport.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button AddImage;
        
        #line default
        #line hidden
        
        
        #line 31 "..\..\..\Pages\AddTestReport.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button AddReport;
        
        #line default
        #line hidden
        
        
        #line 32 "..\..\..\Pages\AddTestReport.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button GoBackButton;
        
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
            System.Uri resourceLocater = new System.Uri("/DyplomWork;component/pages/addtestreport.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Pages\AddTestReport.xaml"
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
            this.EnterNameBox = ((System.Windows.Controls.TextBox)(target));
            return;
            case 2:
            this.EnterFemaleBox = ((System.Windows.Controls.TextBox)(target));
            return;
            case 3:
            this.SelectTestBox = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 4:
            this.AddImage = ((System.Windows.Controls.Button)(target));
            
            #line 30 "..\..\..\Pages\AddTestReport.xaml"
            this.AddImage.Click += new System.Windows.RoutedEventHandler(this.AddImage_Click);
            
            #line default
            #line hidden
            return;
            case 5:
            this.AddReport = ((System.Windows.Controls.Button)(target));
            
            #line 31 "..\..\..\Pages\AddTestReport.xaml"
            this.AddReport.Click += new System.Windows.RoutedEventHandler(this.AddReport_Click);
            
            #line default
            #line hidden
            return;
            case 6:
            this.GoBackButton = ((System.Windows.Controls.Button)(target));
            
            #line 32 "..\..\..\Pages\AddTestReport.xaml"
            this.GoBackButton.Click += new System.Windows.RoutedEventHandler(this.GoBackButton_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}


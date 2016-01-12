---
layout: page
title: Basic setup
---

To setup the required resources you first have to add the following code to your ```App.xaml```:

```
<Application.Resources>
    <!--Attach Default Fluent Control's Theme-->
    <ResourceDictionary Source="pack://application:,,,/Fluent;Component/Themes/Generic.xaml" />
</Application.Resources>
```

After you have added the required resources you can start creating your first window containing a ribbon by creating a new window and then change the xaml code of that windo to the following.
You can fully reuse the provided code if you name your window "MyFirstWindow" and your project "MyFirstRibbonProject".
If you happen to choose different names you have to adjust the names "MyFirstRibbonProject" and "MyFirstWindow" to your desired names.

```
<Fluent:RibbonWindow x:Class="MyFirstRibbonProject.MyFirstWindow"
                     xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
                     xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
                     xmlns:Fluent="urn:fluent-ribbon"
                     Title="My first RibbonWindow" 
                     Width="800" 
                     Height="600" >
    <Grid>
    </Grid>
</Fluent:RibbonWindow>
```

Code behind for the window:

```
namespace MyFirstRibbonProject
{
    /// <summary>
    /// Represents the main window of the application
    /// </summary>
    public partial class MyFirstWindow
    {
        /// <summary>
        /// Default constructor
        /// </summary>
        public Window()
        {
            this.InitializeComponent();
        }
    }
}
```

Now that you have setup the window you can start adding the ribbon itself:

```
<Fluent:Ribbon>
    <!--Backstage-->
    <Fluent:Ribbon.Menu>
        <Fluent:Backstage>
        </Fluent:Backstage>
    </Fluent:Ribbon.Menu>
    
    <!--Tabs-->
    <Fluent:RibbonTabItem Header="Home">
        <Fluent:RibbonGroupBox Header="Group">
            <Fluent:Button Header="Green"
                           Icon="Images\Green.png"
                           LargeIcon="Images\GreenLarge.png" />
            <Fluent:Button Header="Grey" 
                           Icon="Images\Gray.png"
                           LargeIcon="Images\GrayLarge.png" />
        </Fluent:RibbonGroupBox>
    </Fluent:RibbonTabItem>
</Fluent:Ribbon>
```
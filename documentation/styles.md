---
layout: page
title: Styles
---

### Table of Contents
- [Overview](#overview)
- [How to change the current theme... via App.xaml](#app)
- [How to change the current theme... via ThemeManager](#thememanager)
- [How to change the current theme... On a Window different to your Application's MainPage](#window)
- [Creating Custom Accents and Themes](#custom)
- [Aligning `AppTheme` with the current "app mode" setting from windows](#appmode)
- [Credits](#credits)

### Overview {#overview}

> This feature is available starting with Version 6.0.

This guide will introduce you to the many accents and themes that `Fluent.Ribbon` has and how to create your own.

All of `Fluent.Ribbon`'s accents and themes are contained within separate resource dictionaries **(Make sure that all file names are spelled correct. They are Case Sensitive!).**

## How to change the current theme {#app}

You can choose between these available accents:

> "Red", "Green", "Blue", "Purple", "Orange", "Lime", "Emerald", "Teal", "Cyan", "Cobalt", "Indigo", "Violet", "Pink", "Magenta", "Crimson", "Amber", "Yellow", "Brown", "Olive", "Steel", "Mauve", "Taupe", "Sienna"

and these themes:
> "BaseLight", "BaseDark"


#### via App.xaml
The fastest way is to specify the accent and theme resource in App.xaml.

```xml
<Application x:Class="FluentRibbonThemesSample.App"
         xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
         xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
         StartupUri="MainWindow.xaml">
    <Application.Resources>
        <ResourceDictionary>
            <ResourceDictionary.MergedDictionaries>
                <ResourceDictionary Source="pack://application:,,,/Fluent;component/Themes/Generic.xaml" />

                <!-- accent resource -->
                <!-- change "Cobalt" to the accent color you want -->

                <ResourceDictionary Source="pack://application:,,,/Fluent;component/Themes/Accents/Cobalt.xaml" />

                <!-- theme resource -->
                <!-- change "BaseLight" to the theme you want -->
                <ResourceDictionary Source="pack://application:,,,/Fluent;component/Themes/Accents/BaseLight.xaml" />
            </ResourceDictionary.MergedDictionaries>
        </ResourceDictionary>
    </Application.Resources>
</Application>
```

#### via ThemeManager {#thememanager}

`Fluent.Ribbon` has a `ThemeManager` method that lets you change the accent and theme using the code-behind file. It can be done in 2 lines, like so:

```csharp
public partial class App : Application
{
    protected override void OnStartup(StartupEventArgs e)
    {
        // get the current app style (theme and accent) from the application
        // you can then use the current theme and custom accent instead set a new theme
        Tuple<AppTheme, Accent> appStyle = ThemeManager.DetectAppStyle(Application.Current);

        // now set the Green accent and dark theme
        ThemeManager.ChangeAppStyle(Application.Current,
                                    ThemeManager.GetAccent("Green"),
                                    ThemeManager.GetAppTheme("BaseDark")); // or appStyle.Item1

        base.OnStartup(e);
    }
}
```

### On a Window different to your Application's MainPage {#window}

With `Fluent.Ribbon` you can have a different accent and theme for a `RibbonWindow`. The main window or any other `RibbonWindow` will keep the specified accent and theme in the App.xaml.

```xml
<Controls:RibbonWindow.Resources>
    <ResourceDictionary>
       <ResourceDictionary.MergedDictionaries>
            <!-- this window should be blue -->
            <ResourceDictionary Source="pack://application:,,,/Fluent;component/Themes/Accents/Blue.xaml" />
            <!-- and should use the light theme -->
            <ResourceDictionary Source="pack://application:,,,/Fluent;component/Themes/Accents/BaseLight.xaml" />
        </ResourceDictionary.MergedDictionaries>
    </ResourceDictionary>
</Controls:RibbonWindow.Resources>
```

You can also do this with the ThemeManager, like so:

```csharp
public partial class AccentStyleWindow : RibbonWindow
{
    public void ChangeAppStyle()
    {
        // set the Red accent and dark theme only to the current window
        ThemeManager.ChangeAppStyle(this,
                                    ThemeManager.GetAccent("Red"),
                                    ThemeManager.GetAppTheme("BaseDark"));
    }
}
```

## Creating Custom Accents and Themes {#custom}

Another nice feature of `Fluent.Ribbon` `ThemeManager` is to use custom created accents and themes or use a dynamically created accent and theme.

```xml
<ResourceDictionary xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
                    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
                    xmlns:Fluent="clr-namespace:Fluent"
                    xmlns:options="http://schemas.microsoft.com/winfx/2006/xaml/presentation/options"
                    xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
                    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
                    mc:Ignorable="options d">
    <!-- COLORS -->
    
    <!-- Accent colors -->   
    <Color x:Key="Fluent.Ribbon.Colors.AccentBaseColor">#FF2B579A</Color>
    <!--80%-->
    <Color x:Key="Fluent.Ribbon.Colors.AccentColor80">#CC2B579A</Color>
    <!--60%-->
    <Color x:Key="Fluent.Ribbon.Colors.AccentColor60">#992B579A</Color>
    <!--40%-->
    <Color x:Key="Fluent.Ribbon.Colors.AccentColor40">#662B579A</Color>
    <!--20%-->
    <Color x:Key="Fluent.Ribbon.Colors.AccentColor20">#332B579A</Color>

    <Color x:Key="Fluent.Ribbon.Colors.HighlightColor">#FF086F9E</Color>

    <!-- Foreground -->
    <Color x:Key="Fluent.Ribbon.Colors.IdealForegroundColor">White</Color>
    <Color x:Key="Fluent.Ribbon.Colors.DarkIdealForegroundDisabledColor">#ADADAD</Color>

    <!-- Misc colors -->
    <Color x:Key="Fluent.Ribbon.Colors.ExtremeHighlightColor">#FFFFD232</Color>
    <Color x:Key="Fluent.Ribbon.Colors.DarkExtremeHighlightColor">#FFF29536</Color>
    
    <!-- END COLORS -->
       
    <!-- BRUSHES -->   
    
    <!-- Accent brushes -->
    <SolidColorBrush x:Key="Fluent.Ribbon.Brushes.AccentBaseColorBrush" Color="{StaticResource Fluent.Ribbon.Colors.AccentBaseColor}" options:Freeze="True" />
    <SolidColorBrush x:Key="Fluent.Ribbon.Brushes.AccentColorBrush80" Color="{StaticResource Fluent.Ribbon.Colors.AccentColor80}" options:Freeze="True" />
    <SolidColorBrush x:Key="Fluent.Ribbon.Brushes.AccentColorBrush60" Color="{StaticResource Fluent.Ribbon.Colors.AccentColor60}" options:Freeze="True" />
    <SolidColorBrush x:Key="Fluent.Ribbon.Brushes.AccentColorBrush40" Color="{StaticResource Fluent.Ribbon.Colors.AccentColor40}" options:Freeze="True" />
    <SolidColorBrush x:Key="Fluent.Ribbon.Brushes.AccentColorBrush20" Color="{StaticResource Fluent.Ribbon.Colors.AccentColor20}" options:Freeze="True" />
    
    <SolidColorBrush x:Key="Fluent.Ribbon.Brushes.HighlightBrush" Color="{StaticResource Fluent.Ribbon.Colors.HighlightColor}" options:Freeze="True" />

    <!-- Misc brushes -->
    <SolidColorBrush x:Key="Fluent.Ribbon.Brushes.ExtremeHighlightBrush" Color="{StaticResource Fluent.Ribbon.Colors.ExtremeHighlightColor}" options:Freeze="True" />
    <SolidColorBrush x:Key="Fluent.Ribbon.Brushes.DarkExtremeHighlightBrush" Color="{StaticResource Fluent.Ribbon.Colors.DarkExtremeHighlightColor}" options:Freeze="True" />

    <!-- Foreground -->
    <SolidColorBrush x:Key="Fluent.Ribbon.Brushes.IdealForegroundColorBrush" Color="{StaticResource Fluent.Ribbon.Colors.IdealForegroundColor}" options:Freeze="True" />
    <SolidColorBrush x:Key="Fluent.Ribbon.Brushes.IdealForegroundDisabledBrush" Color="{StaticResource Fluent.Ribbon.Colors.IdealForegroundColor}" Opacity="0.4" options:Freeze="True" />
    <SolidColorBrush x:Key="Fluent.Ribbon.Brushes.DarkIdealForegroundDisabledBrush" Color="{StaticResource Fluent.Ribbon.Colors.DarkIdealForegroundDisabledColor}" options:Freeze="True" />

    <!-- Button -->
    <SolidColorBrush x:Key="Fluent.Ribbon.Brushes.Button.MouseOver.BorderBrush" Color="{StaticResource Fluent.Ribbon.Colors.AccentColor40}" options:Freeze="True" />
    <SolidColorBrush x:Key="Fluent.Ribbon.Brushes.Button.MouseOver.Background" Color="{StaticResource Fluent.Ribbon.Colors.AccentColor20}" options:Freeze="True" />
    <SolidColorBrush x:Key="Fluent.Ribbon.Brushes.Button.Pressed.BorderBrush" Color="{StaticResource Fluent.Ribbon.Colors.AccentColor60}" options:Freeze="True" />
    <SolidColorBrush x:Key="Fluent.Ribbon.Brushes.Button.Pressed.Background" Color="{StaticResource Fluent.Ribbon.Colors.AccentColor40}" options:Freeze="True" />

    <!-- GalleryItem -->
    <SolidColorBrush x:Key="Fluent.Ribbon.Brushes.GalleryItem.MouseOver" Color="{StaticResource Fluent.Ribbon.Colors.AccentColor20}" options:Freeze="True" />
    <SolidColorBrush x:Key="Fluent.Ribbon.Brushes.GalleryItem.Selected" Color="{StaticResource Fluent.Ribbon.Colors.AccentColor40}" options:Freeze="True" />
    <SolidColorBrush x:Key="Fluent.Ribbon.Brushes.GalleryItem.Pressed" Color="{StaticResource Fluent.Ribbon.Colors.AccentColor60}" options:Freeze="True" />

    <!-- MenuItem -->
    <SolidColorBrush x:Key="Fluent.Ribbon.Brushes.ApplicationMenuItem.CheckBox.Background" Color="#FFFCF1C2" options:Freeze="True" />
    <SolidColorBrush x:Key="Fluent.Ribbon.Brushes.ApplicationMenuItem.CheckBox.BorderBrush" Color="#FFF29536" options:Freeze="True" />

    <!-- END BRUSHES -->
</ResourceDictionary>
```

In order to use this custom accent, you need to add it to the `ThemeManager` first.

```csharp
public partial class App : Application
{
    protected override void OnStartup(StartupEventArgs e)
    {
        // add custom accent and theme resource dictionaries to the ThemeManager
        // you should replace FluentRibbonThemesSample with your application name
        // and correct place where your custom accent lives
        ThemeManager.AddAccent("CustomAccent1", new Uri("pack://application:,,,/FluentRibbonThemesSample;component/CustomAccents/CustomAccent1.xaml"));

        // get the current app style (theme and accent) from the application
        Tuple<AppTheme, Accent> theme = ThemeManager.DetectAppStyle(Application.Current);

        // now change app style to the custom accent and current theme
        ThemeManager.ChangeAppStyle(Application.Current,
                                    ThemeManager.GetAccent("CustomAccent1"),
                                    theme.Item1);

        base.OnStartup(e);
    }
}
```

It is also possible to create an accent resource dictionary dynamically by using a specific color.
To do so you can have a look at the "Styles" tab in the showcase application or at [ThemeHelper](https://github.com/fluentribbon/Fluent.Ribbon/blob/develop/Fluent.Ribbon.Showcase/Helpers/ThemeHelper.cs).

## Aligning `AppTheme` with the current "app mode" setting from windows {#appmode}
> This feature is available starting with Version 6.1.

You can use `ThemeManager.AlignAppThemeWithWindowsAppModeSetting` to align the `AppTheme` once.  
You can use `ThemeManager.IsWindowsAppModeSettingDetectionEnabled` to align the `AppTheme` automatically when the Windows setting is changed during runtime.

Usage sample:

```csharp
public partial class App : Application
{
    /// <inheritdoc />
    protected override void OnStartup(StartupEventArgs e)
    {
        ThemeManager.IsWindowsAppModeSettingDetectionEnabled = true;
        ThemeManager.AlignAppThemeWithWindowsAppModeSetting();

        base.OnStartup(e);
    }
}
```

## Credits {#credits}

`ThemeManager` and this documentation is based on the work from [MahApps.Metro](https://github.com/MahApps/MahApps.Metro) and [Styles](http://mahapps.com/guides/styles.html).
---
layout: page
title: Interop with MahApps.Metro
---

## Reference implementation

You can find a fully working interop sample in
https://github.com/fluentribbon/Fluent.Ribbon/blob/develop/Fluent.Ribbon.Showcase/MahMetroWindow.xaml
and
https://github.com/fluentribbon/Fluent.Ribbon/blob/develop/Fluent.Ribbon.Showcase/MahMetroWindow.xaml.cs

## Recommended steps and settings
The most important steps you have to take to get Fluent.Ribbon working inside a `MetroWindow` are:
- You should set `ShowSystemMenuOnRightClick` to `false` on your `MetroWindow` (otherwise the context menu on the ribbon won't work as expected)
- You have to use this `TitleTemplate`
```xml
<Metro:MetroWindow.TitleTemplate>
    <DataTemplate>
        <Fluent:RibbonTitleBar x:Name="RibbonTitleBar"                                   
                                Header="{Binding ElementName=window, Path=Title}"/>
    </DataTemplate>
</Metro:MetroWindow.TitleTemplate>
```
- Implement the following method which should be called after the window is loaded:
```csharp
private void MahMetroWindow_Loaded(object sender, RoutedEventArgs e)
{
    this.TitleBar = this.FindChild<RibbonTitleBar>("RibbonTitleBar");
    this.TitleBar.InvalidateArrange();
    this.TitleBar.UpdateLayout();
}
```
- You can set `UseHighestAvailableAdornerLayer` on your `Backstage` to `false` (this enables showing MahApps.Metro style dialogs above the backstage)
- You can create the following style to improve the `Backstage` interop in case you used `UseHighestAvailableAdornerLayer`:
```xml
<Style x:Key="{x:Type Fluent:BackstageTabControl}"
        TargetType="{x:Type Fluent:BackstageTabControl}"
        BasedOn="{StaticResource {x:Type Fluent:BackstageTabControl}}">
    <Setter Property="SelectedContentMargin"
            Value="0" />
</Style>
```
- If you want to sync the themes being used implement:
```csharp
// One time call to ensure initial sync
SyncThemeManagers();
// Called every time the Fluent.Ribbon theme changes
ThemeManager.IsThemeChanged += (o, args) => SyncThemeManagers();

private static void SyncThemeManagers(OnThemeChangedEventArgs args = null)
{
    // Sync Fluent and MahApps ThemeManager
    var fluentRibbonTheme = args?.Theme ?? ThemeManager.DetectTheme();
    var appTheme = MahApps.Metro.ThemeManager.AppThemes.First(x => x.Name == "Base" + fluentRibbonTheme.BaseColorScheme);
    var accent = MahApps.Metro.ThemeManager.Accents.First(x => x.Name == fluentRibbonTheme.ColorScheme);
    MahApps.Metro.ThemeManager.ChangeAppStyle(Application.Current, accent, appTheme);
}
```
---
layout: page
title: Ribbon Background
---

Changing the background of the `Ribbon` can't be done by simple changing the `Background` property.
You have to, at least, overwrite the following resources to change the background of the `Ribbon`:

```xaml
<Fluent:RibbonWindow.Resources>
    <SolidColorBrush x:Key="Fluent.Ribbon.Brushes.RibbonTabControl.Background">LightBlue</SolidColorBrush>
    <SolidColorBrush x:Key="Fluent.Ribbon.Brushes.RibbonTabControl.TabsGrid.Background">LightBlue</SolidColorBrush>
    <SolidColorBrush x:Key="Fluent.Ribbon.Brushes.RibbonTabControl.Content.Background">LightBlue</SolidColorBrush>
    <SolidColorBrush x:Key="Fluent.Ribbon.Brushes.RibbonWindow.TitleBackground">LightBlue</SolidColorBrush>
</Fluent:RibbonWindow.Resources>
```
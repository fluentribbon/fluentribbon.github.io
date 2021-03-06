---
layout: page
title: Contextual Tabs
---

A contextual tab is visible when a particular object in an app is selected. Contextual tabs cannot exist outside a contextual tab group, so we need to create a contextual tab group (`RibbonContextualTabGroup`) and bind a tab to this group. `RibbonContextualTabGroup` needs to be added to the `Ribbon.ContextualGroups` collection:

```xaml
<!--Contextual Tab Groups-->
<Fluent:Ribbon.ContextualGroups>
    <Fluent:RibbonContextualTabGroup x:Name="toolsGroup"
                                     Header="Tools" 
                                     Visibility="Visible"
                                     Background="Green" 
                                     BorderBrush="Green" />
</Fluent:Ribbon.ContextualGroups>
```

And associate a tab to this group:

```xaml
<!--Contextual Tabs-->
<Fluent:RibbonTabItem Header="CT" Group="{Binding Source={x:Reference toolsGroup}}"/>
```

`RibbonContextualTabGroup` is not visible by default. 
To show you must set `RibbonContextualTabGroup.Visibility` property to `Visible`.
To hide you must set `RibbonContextualTabGroup.Visibility` property to `Collapsed`.
`Hidden` is not supported a supported value for `RibbonContextualTabGroup.Visibility`.
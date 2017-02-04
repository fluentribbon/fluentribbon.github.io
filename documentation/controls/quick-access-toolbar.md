---
layout: page
title: Quick Access Toolbar
---

_Quick Access Toolbar_ is a toolbar with shortcut controls. You can add any Fluent-based control using the context menu (a control has to implement the `IQuickAccessToolbarItem` interface). You can also pin controls to the _Quick Access Toolbar_ menu.

You can add pinned _Quick Access Items_ named `QuickAccessMenuItem` to the collection `Ribbon.QuickAccessItems`. To associate a target element you may bind it to the `QuickAccessMenuItem.Target` property or just set the content.

```xaml
<!--Quick Access Toolbar Items-->
<Fluent:Ribbon.QuickAccessItems>
    <!--Use Content or Target Property to set QAT item-->
    <Fluent:QuickAccessMenuItem IsChecked="true">
        <Fluent:Button Header="Pink" Icon="Images\Pink.png" />
    </Fluent:QuickAccessMenuItem>
    <!--You Can Just Bind with Any Control-->
    <Fluent:QuickAccessMenuItem Target="{Binding ElementName=buttonGreen}"/>
</Fluent:Ribbon.QuickAccessItems>
```

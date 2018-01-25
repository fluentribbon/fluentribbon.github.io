---
layout: page
title: Sizing
---

### Table of Contents
- [Defining sizing behavior](#sizingBehavior)
- [Aligning controls](#aligningControls)

### Defining sizing behavior {#sizingBehavior}

A `RibbonGroupBox` can be in one of four states:

- `Large`
- `Middle`
- `Small`
- `Collapsed`

By default, a `RibbonGroupBox` is in the `Large` state.
When a `RibbonGroupBox` changes its state, it changes the size of all its controls.

`RibbonTabItem` has a `ReduceOrder` property.
This property defines the order in which the groups reduce.
You can enumerate group names from last to first to reduce.

All ribbon contols (`Button`, `DropDownButton`, `Spinner` and so on) have a `SizeDefinition` property.
You can define which size will be used when the group will be in a particular state.
For example, if you set `SizeDefinition = "Middle, Middle, Small"`, that means:

* Large state of the group -> Middle size of the control
* Middle state of the group -> Middle size of the control
* Small state of the group -> Small size of the control

```xaml
<Fluent:RibbonTabItem ReduceOrder="Default,Default,Default,
                                   Large,Large,Large,
                                   Other,Other,Other" ...>
    <!--By default ReduceOrder="Large, Middle, Small"-->
    <Fluent:RibbonGroupBox Name="Default" Header="Default Behaviour">
        <Fluent:Button ... />
        <Fluent:Button ... />
        <Fluent:Button ... />
        <Fluent:Button ... />
    </Fluent:RibbonGroupBox>
    <!--You can use short form
    (for ex, "Middle" is equal "Middle,Middle,Middle")-->
    <Fluent:RibbonGroupBox Name="Large" Header="Large Only">
        <Fluent:Button SizeDefinition="Large" .../>
        <Fluent:Button SizeDefinition="Large" .../>
        <Fluent:Button SizeDefinition="Large" .../>
        <Fluent:Button SizeDefinition="Large" .../>
    </Fluent:RibbonGroupBox>
    <Fluent:RibbonGroupBox Name="Other" Header="Other">
        <Fluent:Button SizeDefinition="Large, Large, Large" Icon="Resource-Path to your small icon for this button" ... />
        <Fluent:Button SizeDefinition="Large, Large, Small" Icon="Resource-Path to your small icon for this button" ... />
        <Fluent:Button SizeDefinition="Middle, Small, Small" Icon="Resource-Path to your small icon for this button" ... />
        <Fluent:Button SizeDefinition="Middle, Small, Small" Icon="Resource-Path to your small icon for this button" ... />
    </Fluent:RibbonGroupBox>
</Fluent:RibbonTabItem>
```

### Aligning controls {#aligningControls}

> This feature is available starting with Version 6.0.

You can opt in to align the headers of controls like `ComboBox` or `Spinner` which are placed in the same column of a `RibbonGroupBox` by adding `Grid.IsSharedSizeScope="True"` to a `RibbonGroupBox`.
You can opt out of this behavior for single controls in that column by adding `Fluent:RibbonGroupBoxWrapPanel.ExcludeFromSharedSize="True"` to that control.

```xaml
<Fluent:RibbonGroupBox Header="SharedSizeScope"
                       Grid.IsSharedSizeScope="True">
    <Fluent:ComboBox Header="My header" />
    <Fluent:TextBox Header="My short header" />
    <Fluent:Spinner Header="My long long header" />

    <Fluent:ComboBox Header="Excluded from size sharing" Fluent:RibbonGroupBoxWrapPanel.ExcludeFromSharedSize="True" />
    <Fluent:Spinner Header="My short header" />
    <Fluent:ComboBox Header="My long long header" />
</Fluent:RibbonGroupBox>
```
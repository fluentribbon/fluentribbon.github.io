---
layout: page
title: StatusBar and StatusBarItem
---

Usage:

```
<Fluent:StatusBar>
    <!-- Place your items here -->
</Fluent:StatusBar>
```

You have to set `HorizontalAlignment` on every `StatusBarItem` and every `Separator` to get the `StatusBar` to work properly.

- Using `HorizontalAlignment=Left` will place items on the left hand side.
- Using `HorizontalAlignment=Right` will place items on the right hand side.
- Using everthing else as `HorizontalAlignment` will hide the item from the `StatusBar`.

The `ContextMenu` for the `StatusBar` is generated automatically.

A sample `StatusBar` would look like this:

```
<Fluent:StatusBar>
    <Fluent:StatusBarItem Title="Left placed item"
                          Value="150"
                          HorizontalAlignment="Left">
        <TextBlock Text="150 px" />
    </Fluent:StatusBarItem>
    
    <Separator HorizontalAlignment="Left" />
    
    <Fluent:StatusBarItem Title="Second left placed item"
                          Value="Value shown in ContextMenu"
                          ToolTip="Your ToolTip"
                          Content="Content shown in StatusBar"
                          HorizontalAlignment="Left" />

    <Fluent:StatusBarItem Title="Item placed on the right side"
                          HorizontalAlignment="Right"
                          Value="Your value which is also used as content if no content is set." />
</Fluent:StatusBar>
```

`StatusBarItem` has the following properties:
- `Title` is used as the `Header` in the `ContextMenu`.
- `Value` is the value shown in the `ContextMenu`.
- `Content` is the content shown in the `StatusBar`. This can be a simple string or everthing else you want to display.

If `Content` is not set, `Value` is used as `Content`.
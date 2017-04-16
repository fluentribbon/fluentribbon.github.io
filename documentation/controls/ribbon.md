---
layout: page
title: Ribbon
---

The `Ribbon` is the glue for everything in this library and thus the most important control.
It contains your menu, tabs, contextual tabs and so on.
Below is a small sample:

```xaml
<Fluent:Ribbon>
    <!--Backstage-->
    <Fluent:Ribbon.Menu>
        <Fluent:Backstage>
            <Fluent:Backstage />
        </Fluent:Backstage>
    </Fluent:Ribbon.Menu>
    <!--Tabs-->
    <Fluent:RibbonTabItem Header="Tab">
        <Fluent:RibbonGroupBox Header="Group">
            <Fluent:Button Name="buttonGreen" 
                           Header="Green"
                           Icon="Images\Green.png"
                           LargeIcon="Images\GreenLarge.png" />
            <Fluent:Button Name="buttonGray" 
                           Header="Grey" 
                           Icon="Images\Gray.png"
                           LargeIcon="Images\GrayLarge.png" />
        </Fluent:RibbonGroupBox>
    </Fluent:RibbonTabItem>
</Fluent:Ribbon>
```

The code above produces a `Ribbon` with a single tab, one group and two buttons.

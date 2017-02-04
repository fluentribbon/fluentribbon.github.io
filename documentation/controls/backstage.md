---
layout: page
title: Backstage
---

The `Backstage` is the menu that's hidden behind the _File_ button in the top-left corner in office.
Let's fill the backstage with items:

```xaml
<!--Backstage-->
<Fluent:Ribbon.Menu>
    <Fluent:Backstage>
        <Fluent:BackstageTabControl>
            <Fluent:BackstageTabItem Header="New"/>
            <Fluent:BackstageTabItem Header="Print"/>
            <Fluent:Button Header="Blue" Icon="Images\Blue.png"/>
        </Fluent:BackstageTabControl>
    </Fluent:Backstage>
</Fluent:Ribbon.Menu>
```
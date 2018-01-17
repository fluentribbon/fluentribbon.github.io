---
layout: page
title: StartScreen
---

The `StartScreen` makes it possible to resemble the view you get when starting Word or Excel.
Let's fill the startscreen with content:

```xaml
<!--Backstage-->
<Fluent:Ribbon.Menu>
    <Fluent:StartScreen>
        <Fluent:StartScreenTabControl>
            <Fluent:StartScreenTabControl.LeftContent>
                <StackPanel Orientation="Vertical">
                    <Label Content="StartScreen"
                            FontSize="48"
                            Foreground="{DynamicResource Fluent.Ribbon.Brushes.IdealForegroundColorBrush}" />
                </StackPanel>
            </Fluent:StartScreenTabControl.LeftContent>

            <Fluent:StartScreenTabControl.RightContent>
                <StackPanel Orientation="Vertical">
                    <TextBlock VerticalAlignment="Center"
                                HorizontalAlignment="Center">You can close the start screen by either clicking the button below or by pressing ESC</TextBlock>
                    <Fluent:Button HorizontalAlignment="Center"
                                   IsDefinitive="True">Close start screen</Fluent:Button>
                </StackPanel>
            </Fluent:StartScreenTabControl.RightContent>
        </Fluent:StartScreenTabControl>
    </Fluent:StartScreen>
</Fluent:Ribbon.Menu>
```

If you want to show the `StartScreen` on application startup you have to set it's `IsOpen` to `True`.
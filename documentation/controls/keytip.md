---
layout: page
title: KeyTip
---

Key tips provide users accessibility to the Ribbon using the keyboard.
To start the process the user must press one of the key tip keys. Per default these are `Alt` or `F10`.
`KeyTips` are shown over controls.

To make key tips work, it is enough to set the attached property `Fluent:KeyTip.Keys` to the target control,
and the ribbon will arrange and show the key tips automatically.
It is possible to set key tips to menu and / or submenu items.
You also need to set a key tip for groups to open them while they are collapsed.

```xaml
<Fluent:RibbonGroupBox Fluent:KeyTip.Keys="ZC" ... >
    <Fluent:SplitButton Fluent:KeyTip.Keys="R" ... >
        <Fluent:MenuItem Fluent:KeyTip.Keys="P" ... />
        <Fluent:MenuItem Fluent:KeyTip.Keys="R" ... >
            <Fluent:MenuItem Fluent:KeyTip.Keys="O" ... />
        </Fluent:MenuItem>
    </Fluent:SplitButton>
    ...
```

As you can see, items in the Quick Access Toolbar are key tipped automatically.
Also key tips are placed well automatically.
However, there are cases when custom placement is required.
In this case you have to set `Fluent:KeyTip.AutoPlacement` to `false` and use additional attached properties:

Property                    | Description
--------------------------- | -----------------------------------------------------------------
`KeyTip.AutoPlacement`      | `true` by default. Set to `false` to switch on custom placement.
`KeyTip.Horizontal`         | Horizontal alignment relative to key tipped control
`KeyTip.VerticalAlignment`  | Vertical alignment relative to key tipped control
`KeyTip.Margin`             | Margin to offset key tip

```xaml
<Fluent:RibbonGroupBox Header="Group">
    <Fluent:Button Text="Center"
                   Fluent:KeyTip.AutoPlacement="False"
                   Fluent:KeyTip.HorizontalAlignment="Center"
                   Fluent:KeyTip.VerticalAlignment="Center"
                   Fluent:KeyTip.Keys="C" />
    <Fluent:Button Text="Left"
                   Fluent:KeyTip.AutoPlacement="False"
                   Fluent:KeyTip.HorizontalAlignment="Left"
                   Fluent:KeyTip.VerticalAlignment="Center"
                   Fluent:KeyTip.Keys="L" />
    <Fluent:Button Text="Top"
                   Fluent:KeyTip.AutoPlacement="False"
                   Fluent:KeyTip.HorizontalAlignment="Center"
                   Fluent:KeyTip.VerticalAlignment="Top"
                   Fluent:KeyTip.Keys="T" />
</Fluent:RibbonGroupBox>
```

### Customize key tip keys

> This feature is available starting with Version 7.0.

To customize the keys the user can use to activate the key tips you simply have to define a list of `KeyGestures` in the `KeyTipKeys` property of the `Ribbon`. 

```xaml
<Fluent:Ribbon KeyTipKeys="F10, F9">
    <Fluent:Ribbon.KeyTipKeys>
        <KeyGesture>Alt+K</KeyGesture>
        <KeyGesture>F10</KeyGesture>
    </Fluent:Ribbon.KeyTipKeys>
</Fluent:Ribbon>
```

If you don't define custom keys the default keys will be used (`Alt` or `F10`).

> The gesture `Shift+F10` is a reserved gesture and cannot be used for `KeyTipKeys`.

## Screen Tips

To use screen tips you have to create a `Fluent.ScreenTip` instance and set the `ToolTip` property:

```xaml
<Fluent:Button ... >
    <Fluent:Button.ToolTip>
        <Fluent:ScreenTip Title="Gray"
                          HelpTopic="Help for Gray ScreenTip"
                          Image="Resource-Path to your large icon for this button"
                          Text="This ScreenTip is ribbon aligned. &#x0a;
                                It has the image and handles F1." />
    </Fluent:Button.ToolTip>
</Fluent:Button>
```

`ScreenTip` has a unique feature to invoke the contextual help when it is in the _open_ state.
To handle contextual help you must set `ScreenTip.HelpTopic` in XAML
and subscribe to the `ScreenTip.HelpPressed` event.
Be aware that the event is static,
so you must manually unsubscribe from it when it is appropriate to avoid memory leaks
or subscribe the application's lifetime object as shown below:

```csharp
public partial class Application : System.Windows.Application
{
    void OnStartup(object sender, StartupEventArgs e)
    {
        ScreenTip.HelpPressed += OnScreenTipHelpPressed;
    }

    /// <summary>
    /// Handles F1 pressed on ScreenTip with help capability
    /// </summary>
    /// <param name="sender">Sender</param>
    /// <param name="e">Arguments</param>
    static void OnScreenTipHelpPressed(object sender, ScreenTipHelpEventArgs e)
    {
        // Show help according the given help topic
        // (here just show help topic as string)
        MessageBox.Show(e.HelpTopic.ToString());
    }
}
```

`ScreenTip` shows on disabled Fluent-based controls automatically.
Moreover you can set text which should be shown when the target control is disabled.

```xaml
<Fluent:Button IsEnabled="False" ... >
    <Fluent:Button.ToolTip>
        <Fluent:ScreenTip Title="Orange" Width ="250"
                          Image="Resource-Path to your large icon for this button"
                          Text="This control is disabled and has fixed width 250px"
                          HelpTopic="Help for Orange ScreenTip"
                          DisableReason="This control is disabled
                                         to show 'disable reason' section" />
    </Fluent:Button.ToolTip>
</Fluent:Button>
```

You can find the main properties of `ScreenTip` in the table below.

Property                  | Description
------------------------- | ------------------------------------------------------------------------------------------
`ScreenTip.Title`         | The title of the screen tip
`ScreenTip.Text`          | The text of the screen tip
`ScreenTip.Image`         | Image
`ScreenTip.Width`         | Set this property if you want to make fixed sized screen tip.
`ScreenTip.DisableReason` | If the target control is disabled, this text will be shown to user.
`ScreenTip.HelpTopic`     | Set this property and subscribe to `ScreenTip.HelpPressed` to execute your contextual help.

---
layout: page
title: Themes
---

You can choose from 3 different themes:
- Office 2010 (currently the default)
- Office 2013
- Windows 8

To use the default theme:

```
<ResourceDictionary Source="pack://application:,,,/Fluent;Component/Themes/Generic.xaml" />
```

To use one specific theme:

```
<!-- Office 2010 theme -->
<ResourceDictionary Source="pack://application:,,,/Fluent;Component/Themes/Office2010/Generic.xaml" />
```

or

```
<!-- Office 2013 theme -->
<ResourceDictionary Source="pack://application:,,,/Fluent;Component/Themes/Office2013/Generic.xaml" />
```

or

```
<!-- Windows 8 theme -->
<ResourceDictionary Source="pack://application:,,,/Fluent;Component/Themes/Windows8/Generic.xaml" />
```
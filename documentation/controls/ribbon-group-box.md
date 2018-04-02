---
layout: page
title: RibbonGroupBox
---

### Table of Contents
- [Customizing the header](#customizingHeader)

### Customizing the header {#customizingHeader}

`RibbonGroupBox` inherits from `HeaderedItemsControl`. That way you can use things like `Header`, `HeaderTemplate` and so on.
Because the header has to look different when the control has it's `State` set to `Collapsed` `RibbonGroupBox` offers the attached property `IsCollapsedHeaderContentPresenter` on the `ContentControl` and `ContentPresenter` being visible in that state.
The style for the `ContentControl` being used in that case is `Fluent.Ribbon.Styles.RibbonGroupBox.TwoLineHeaderContentControl`.

If you don't want to show different templates you can simply overwrite the set `HeaderTemplateSelector`.

If you want to show different templates, but don't want to create your own `HeaderTemplateSelector` you can provide `DataTemplate` resources with keys as `Fluent.Ribbon.Templates.RibbonGroupBox.OneLineHeaderTemplate` and `Fluent.Ribbon.Templates.RibbonGroupBox.TwoLineHeaderTemplate`.
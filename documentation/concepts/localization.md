---
layout: page
title: Localization
---

### Table of Contents
- [Overview](#overview)
- [Manually setting the current localization](#manually)
- [Supported localizations](#supported_localizations)

### Overview {#overview}

The current localization is automatically detected by looking at `Thread.CurrentThread.CurrentUICulture`.
This only happens when the localization is accessed for the first time.
Runtime changes to `Thread.CurrentThread.CurrentUICulture` are not monitored.

All currently supported localizations live in the namespace `Fluent.Localization.Languages`.

### Manually setting the current localization {#manually}

If you want to ignore the threads current ui culture you can set the current localization by calling `RibbonLocalization.Current.Localization = new German()` or by calling `RibbonLocalization.Current.Culture = new System.Globalization.CultureInfo("de")`.

### Supported localizations {#supported_localizations}
*   Arabic
*   Azerbaijani
*   Catalan
*   Chinese
*   Chinese (Traditional)
*   Czech
*   Danish
*   Dutch
*   English
*   Estonian
*   Finnish
*   French
*   German
*   Greek
*   Hebrew
*   Hungarian
*   Italian
*   Japanese
*   Korean
*   Lithuanian
*   Norwegia
*   Russian
*   Persian
*   Polish
*   Portuguese
*   Portuguese (Brazilian)
*   Romanian
*   Sinhala
*   Slovak
*   Slovenian
*   Spanish
*   Swedish
*   Turkish
*   Ukrainian
*   Vietnamese
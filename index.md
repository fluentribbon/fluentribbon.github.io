---
layout: home
published: true
---

Introduction: To be written...

## Features

To be written...

## Getting Started
The quickest way to get started is down grab the latest package from [Nuget][nuget] and browse the [documentation][docs]. If you're running into trouble checkout our [support][support] section.


## Who's Behind It
The core contributors to {{ site.data.project.name }} are:
{% for member in site.data.members %}
 - [{{ member.name }}]({{ member.url }}) - {{ member.description }}
{% endfor %}
As is with any open source project there are many other contributors, you can see a full list on the [GitHub][contributors]. Apologies if your name was lost during the move between version control systems.

## Sponsors
These companies have kindly donated time so that some of the above developers can work on extending and supporting {{ site.data.project.name }}.

[nuget]: http://www.nuget.org/packages/Fluent.Ribbon
[docs]: /documentation
[support]: /support
[getting-started]: /documentation/getting-started
[contributors]: {{ site.data.github.repo }}/graphs/contributors
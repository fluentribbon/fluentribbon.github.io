---
layout: home
published: true
---

{{ site.data.project.name }} is an open source WPF control library licensed under the [MIT License][license] and hosted on [GitHub][github].

## Features

To be written...

## Getting Started
The quickest way to get started is down grab the latest package from [Nuget][nuget] and browse the [documentation][docs]. If you're running into trouble checkout our [support](#support) section.

## Support<a name="support"></a>
Basic support is provided on [gitter][gitter]. If you find a bug, want to request a feature or submit a full request then use the [issues list][issues].

## Who's Behind It
The core contributors to {{ site.data.project.name }} are:
{% for member in site.data.members %}
 - [{{ member.name }}]({{ member.url }}) - {{ member.description }}
{% endfor %}
As is with any open source project there are many other contributors, you can see a full list on the [GitHub][contributors]. Apologies if your name was lost during the move between version control systems.

[license]: {{ site.data.github.repo }}/master/License.txt
[github]: {{ site.data.github.repo }}
[nuget]: http://www.nuget.org/packages/Fluent.Ribbon
[docs]: /documentation
[gitter]: https://gitter.im/fluentribbon/Fluent.Ribbon
[issues]: {{ site.data.github.repo }}/issues
[getting-started]: /documentation/getting-started
[contributors]: {{ site.data.github.repo }}/graphs/contributors
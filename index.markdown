---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: default
---

Hi there!

<button class="button">Click</button>

<h2>Elements</h2>

{% for element in site.elements %}
  <h4>{{ element.title }}</h4>
  {{ element }}
  <hr />
{% endfor %}

<h2>Tokens</h2>

{% for token in site.tokens %}
  <h4>{{ token.title }}</h4>
  {{ token }}
  <hr />
{% endfor %}


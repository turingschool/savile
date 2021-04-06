---
title: Elements
layout: default
permalink: /elements/
subnav:
  buttons-links: Buttons & Links
  paragraphs: Paragraph Text
---

<h2 class="s-h2"><a id="buttons-links">Button & Links</a></h2>

Many of our sites have links that appear to be buttons. This is acceptable from a design standpoint, but it is important that the HTML correctly communicates the intent of the element to the browser. Start by understanding the important difference between a button and a link:

- **Buttons** should lead to actions such as "download", "sign up" or "log out"
- **Links** should allow a user to navigate to a new page or a different taget on the same page

Why this matters: For users of screen-readers and power users, a space key and enter key both trigger a button, where pressing the enter key is the only way to trigger a link.

<h3 class="s-h3">Button Examples</h3>
In the following examples, the elements _do_ lead to action, so need to be interpreted by the browser as buttons. There are several of ways to achieve this depending on the use case and needs; three examples are noted below. In order to focus on the elements and attributes, Savile styling classes have not been added to these examples.

Use a button element:
```html
<button>Log In</button>
```

Use an input element with a type attribute:
```html
<input type="button" value="Submit">
```

Use any non-button element with a <a href="https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/button_role" target="blank">role
  attribute</a> (acknowleging that inline and block elements may behave differently):
```html
<div role="button">Subscribe</div>
```

```html
<span role="button">Download Report</span>
```

<h3 class="s-h3">Link Examples</h3>
In the following examples, the button-look-alike is actually an anchor tag. This is the correct tag to use because the purpose of the element is to allow the user to navigate to a new page.
```html
  <a href="https://apply.turing.io" class="[add class(es) to make this appear as a button]">
    <span>Apply Now</span>
  </a>
```

```html
  <a href="/programs" class="[add class(es) to make this appear as a button]">More Info</a>
```

<h3 class="s-h3">Savile Buttons</h3>
Although many elements that appear as buttons, but are not technically buttons, will live in our software suite, Savile still refers to the element as "button" and uses such in the class names.
<table class="spaced-table">
  <thead>
    <tr class="table-head-row">
      <td>Class Name</td>
      <td>HTML</td>
      <td>Example</td>
    </tr>
  </thead>
  <tbody>
  {% assign buttons = site.elements | where: "element_type", "button" %}
  {% for button in buttons %}
    <tr class="token-table-row">
      <td class="element-code-cell">
        <code>{{ button.value }}</code>
      </td>
      <td>
        <code class="language-html" data-lang="html">
          {{button | remove: '<p>' | remove: '</p>' | escape}}
        </code>
      </td>
      <td class="element-sample-cell">{{ button }}</td>
    </tr>
  {% endfor %}
  </tbody>
</table>

<h3 class="s-h3">Savile Links</h3>
<table class="spaced-table">
  <thead>
    <tr class="table-head-row">
      <td>Class Name</td>
      <td>HTML</td>
      <td>Example</td>
    </tr>
  </thead>
  <tbody>
    {% assign links = site.elements | where: "element_type", "link" %}
    {% for link in links %}
    <tr class="token-table-row">
      <td class="element-code-cell">
        <code>{{ link.value }}</code>
      </td>
      <td>
        <code class="language-html" data-lang="html">
          {{link | remove: '<p>' | remove: '</p>' | escape}}
        </code>
      </td>
      <td class="element-sample-cell">{{ link }}</td>
    </tr>
    {% endfor %}
  </tbody>
</table>

<h2 class="s-h2"><a id="paragraphs">Paragraphs</a></h2>
<table class="spaced-table">
  <thead>
    <tr class="table-head-row">
      <td>Class Name</td>
      <td>HTML</td>
      <td>Example</td>
    </tr>
  </thead>
  <tbody>
    {% assign texts = site.elements | where: "element_type", "text" %}
    {% assign light_texts = texts | where: "light_text", "true" %}
    {% assign dark_texts = texts | where: "light_text", nil %}
    {% for text in dark_texts %}
    <tr class="token-table-row">
      <td class="element-code-cell">
        <code>{{ text.value }}</code>
      </td>
      <td>
        <code class="language-html" data-lang="html">
          {{text | remove: '<p>' | remove: '</p>' | escape}}
        </code>
      </td>
      <td class="element-sample-cell">
        {{ text }}
      </td>
    </tr>
    {% endfor %}
    {% for text in light_texts %}
    <tr class="token-table-row">
      <td class="element-code-cell">
        <code>{{ text.value }}</code>
      </td>
      <td>
        <code class="language-html" data-lang="html">
          {{text | remove: '<p>' | remove: '</p>' | escape}}
        </code>
      </td>
      <td class="element-sample-cell dark-cell">
        {{ text }}
      </td>
    </tr>
    {% endfor %}
  </tbody>
</table>
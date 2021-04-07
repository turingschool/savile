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

<p>Use a button element:
</p>
{% highlight html %}
  <button>Log In</button>
{% endhighlight %}

<p>Use an input element with a type attribute:
</p>
{% highlight html %}
  <input type="button" value="Submit">
{% endhighlight %}

<p>Use any non-button element with a <a href="https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/button_role" target="blank">role
  attribute</a> (acknowleging that inline and block elements may behave differently):
</p>
{% highlight html %}
  <div role="button">Subscribe</div>
{% endhighlight %}

{% highlight html %}
  <span role="button">Download Report</span>
{% endhighlight %}

<h3 class="s-h3">Link Examples</h3>
<p>In the following examples, the button-look-alike is actually an anchor tag. This is the correct tag to use because the purpose of the element is to allow the user to navigate to a new page.</p>
{% highlight html %}
  <a href="https://apply.turing.io" class="[add class(es) to make this appear as a button]">
    <span>Apply Now</span>
  </a>
{% endhighlight %}

{% highlight html %}
  <a href="/programs" class="[add class(es) to make this appear as a button]">More Info</a>
{% endhighlight %}

<h3 class="s-h3">Savile Buttons</h3>
Although many elements that appear as buttons, but are not technically buttons, will live in our software suite, Savile still refers to the element as "button" and uses such in the class names.
<table class="spaced-table">
  <thead>
    <tr class="table-head-row">
      <td >Class Name</td>
      <td>HTML</td>
      <td>Example</td>
    </tr>
  </thead>
  <tbody>
  {% assign buttons = site.elements | where: "element_type", "button" %}
  {% for button in buttons %}
<<<<<<< HEAD:elements.md
    <tr class="token-table-row">
      <td class="element-code-cell">
        <code>{{ button.value }}</code>
      </td>
      <td>
        <code class="language-html" data-lang="html">
          {{button | remove: '<p>' | remove: '</p>' | escape}}
        </code>
      </td>
=======
    <tr class="table-row">
      <td class="element-class-cell">{% highlight html %}{{ button.value }}{% endhighlight %}</td>
      <td class="element-code-cell">{% highlight html %}{{ button | remove: '<p>' | remove: '</p>' }}{% endhighlight %}</td>
>>>>>>> 81a5d46 (Use updated classes on tables):elements.html
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
<<<<<<< HEAD:elements.md
    <tr class="token-table-row">
      <td class="element-code-cell">
        <code>{{ link.value }}</code>
      </td>
      <td>
        <code class="language-html" data-lang="html">
          {{link | remove: '<p>' | remove: '</p>' | escape}}
        </code>
      </td>
=======
    <tr class="table-row">
      <td class="element-class-cell">{% highlight html %}{{ link.value }}{% endhighlight %}</td>
      <td class="element-code-cell">{% highlight html %}{{ link | remove: '<p>' | remove: '</p>' }}{% endhighlight %}</td>
>>>>>>> 81a5d46 (Use updated classes on tables):elements.html
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
<<<<<<< HEAD:elements.md
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
=======
    <tr class="table-row">
      <td class="element-class-cell">{% highlight html %}{{ text.value }}{% endhighlight %}</td>
      <td class="element-code-cell">{% highlight html %}{{ text }}{% endhighlight %}</td>
      <td class="element-sample-cell">{{ text }}</td>
>>>>>>> 81a5d46 (Use updated classes on tables):elements.html
    </tr>
    {% endfor %}
    {% for text in light_texts %}
<<<<<<< HEAD:elements.md
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
=======
    <tr class="table-row">
      <td class="element-class-cell">{% highlight html %}{{ text.value }}{% endhighlight %}</td>
      <td class="element-code-cell">{% highlight html %}{{ text }}{% endhighlight %}</td>
      <td class="element-sample-cell dark-cell">{{ text }}</td>
>>>>>>> 81a5d46 (Use updated classes on tables):elements.html
    </tr>
    {% endfor %}
  </tbody>
</table>
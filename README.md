# Savile - Turing's Design System

Savile as in "Savile Row", the fashion street in London where Alan Turing (probably?) bought his snazzy outfits.


**WIP** - this is currently just a placeholder project for the hackathon, final form unknown.

## Usage

### Applying Styles Non-Intrusively

By default, Savile will not apply styles to any HTML elements directly. To apply styles to an element, use the corresponding `sv-<element>` class, e.g.:

```html
<p class="sv-p">This paragraph WILL be styled like a Savile paragraph</p>

<p>This paragraph WILL NOT be styled like a Savile paragraph</p>
```

### Applying Styles to All Elements

If you want to style HTML you don't have direct control over (like Markdown output, for example), wrap the HTML with a `.sv-native` class, e.g.:

```html
<div class="sv-native">
  <p>This paragraph WILL be styled like a Savile paragraph</p>
</div>

<p>This paragraph WILL NOT be styled like a Savile paragraph</p>
```

### Extending Savile

#### Using Tokens

TODO: write instructions for writing CSS using Savile's tokens/variables

## Installing

Targets:

- Rails
- Jekyll
- Middleman
- NPM (React, Vue, etc.)
- CDN (for use with any ole CMS, or static HTML/CSS sites)

### Use with Rails

Add to `Gemfile`:

```
gem "@turing/savile-rails"
```

Add to `application.scss`:

```
@import "@turing/savile-rails";
```

And you're done! Start using Savile classes.

### Use with Jekyll

Add to `Gemfile`:

```
gem "@turing/savile-jekyll"
```

Add plugin (or theme) to `_config.yml`

```
theme: savile

plugins:
  - savile-jekyll
```

And you're done! Start using Savile classes.

### Use with Middleman

TODO: add instructions for integrating w/ Middleman

### Use with NPM

Add via Yarn:

```
yarn add @turing/savile
```

TODO: add instructions for adding to build process 

### Use from CDN

Add to your HTML:

```html
<link href="https://unpkg.com/@turing/savile@^1.0/dist/savile.min.css" rel="stylesheet">
```

And you're done! Start using Savile classes.



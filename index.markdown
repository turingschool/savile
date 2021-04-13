---
title: Savile
layout: default
---

## Turing School's Design System

Nicknamed after <a class="s-link" href="https://en.wikipedia.org/wiki/Savile_Row" target="blank">Savile Row</a>, Savile is the Design System for all sites and applications in the Turing Software suite. It is open-sourced though, so available for any who are interested to use!

<br>

### Adding Savile to an Application

Savile is language and framework agnostic, so no matter what an application is built in, it can utilize this design system. This means that the setup details may vary based on the framework.

To add Savile to a project, import the URL of the version you'd like to use in the appropriate place. 

<table class="spaced-table">
  <thead>
    <tr class="table-head-row">
      <th>Version Number</th>
      <th>URL</th>
    </tr>
  </thead>
  <tbody>
    <tr class="table-row">
      <td class="token-title-cell">1.1 - <em>latest stable release</em></td>
      <td class="token-title-cell">
        <a class="s-link" href="https://savile.turing.io/css/v1/1.1.css" target="blank">https://savile.turing.io/css/v1/1.1.css</a>
      </td>
    </tr>
    <tr class="table-row">
      <td class="token-title-cell">Latest - <em>only recommended for experimental use</em></td>
      <td class="token-title-cell">
        <a class="s-link" href="https://savile.turing.io/css/1-latest.css" target="blank">https://savile.turing.io/css/1-latest.css</a>
      </td>
    </tr>
    <tr class="table-row">
      <td class="token-title-cell">1.0</td>
      <td class="token-title-cell">
        <a class="s-link" href="https://savile.turing.io/css/v1/1.0.css" target="blank">https://savile.turing.io/css/v1/1.0.css</a>
      </td>
    </tr>
  </tbody>
</table>

Simply importing Savile should not make any changes to your existing application. _When Savile is added to an existing Turing application, you may notice very small changes in the weight of some fonts. This is because some of the older applications use older versions of font files, and Savile will override the font source._

<br>

### Using Savile in an Application

Once Savile is added to your project, variables, class names, and assets will be available anywhere in your project. 

In the documentation, you will find:
- variables for Tokens and Colors
- class names and some usage examples for Typography, Utils, Elements, and Components
- URLs for brand assets

The variables listed in Tokens and Colors are CSS variables which do work as expected in SCSS and SASS. As an example, for the variable `--s-color-cyn-400`, the following syntax needs to be used:

```css
.selector {
  color: var(--s-color-cyan-400);
}
```
---
title: Savile
layout: default
---

## Turing School's Design System

Nicknamed after <a class="s-link" href="https://en.wikipedia.org/wiki/Savile_Row" target="blank">Savile Row</a>, Savile is the Design System for all sites and applications in the Turing Software suite. It is open-sourced though, so available to anyone who is interested in using it!

<br>

### Adding Savile to a Project

To add Savile to a project, link the version you'd like to use in the `<head>` tag of your HTML. You can find a list of versions on the <a href="https://github.com/turingschool/savile/releases" target="blank" class="s-link">releases page</a>. For example, to link version 1.1:
```html
<link rel="stylesheet" href="https://savile.turing.io/css/v1/1.1.css">
```
If you don't need to lock in a specific version, but just want the latest release for a given major version, you can reference the `-latest.css` file.
```html
<link rel="stylesheet" href="https://savile.turing.io/css/v1/1-latest.css">
```

**Simply importing Savile should not change the styles of your existing application**. This is because Savile's classes are prefixed with `s-`, so the likelihood of them clashing with other CSS is very low.

_Caveat: when Savile is added to an existing Turing application, you may notice very small changes in the weight of some fonts. This is because some of the older applications use older versions of font files, and Savile will override the font source._

<br>

### Using Savile in a Project

Once Savile is added to your project, variables and class names will be available anywhere in your project. 

In the documentation, you will find:
- variables for Tokens and Colors
- class names and some usage examples for Typography, Utils, Elements, and Components
- URLs for Brand Assets

#### Static Assets

To learn how to use Savile's static assets like images and icons, check out the <a href="/assets" class="s-link">Assets page</a>.
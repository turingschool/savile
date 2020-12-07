# Savile - Turing's Design System

Savile as in "Savile Row", the fashion street in London where Alan Turing (probably?) bought his snazzy outfits.

## `gh-pages` branch

- Has work Tanner started over Hackathon
- run `bundle exec jekyll serve` to run locally
- run `bundle exec jekyll build --destination docs` to build

**To add pieces of DS/Documentation:**

- Add a .css file to the appropriate sub-directory of the css directory at the root of the project
- Write the CSS you want to apply to said token/el/comp
- Above the CSS rule, in `/* */` comments:
  - line 1: title
  - line 3: Subtext
  - line 4: HTML snippet, which will be rendered as the actual token/el/comp sample
- Run `bundle exec jekyll build --destination docs` to build - everything you wrote will build into the docs directory and that is the static site we will serve up.

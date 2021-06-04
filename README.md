# Savile - Turing's Design System

The Turing School of Software and Design's Design System. The site provides an everything-in-one-place guide to our style guide and available utils and class names for pre-built components that conform to the style guide. The design system itself is consumed by all* sites and apps in the Turing suite via CDN.

More information about internal engineering @ Turing is available on [Turing's Engineering Wiki](https://www.notion.so/Engineering-Wiki-29887c546265429db78560f47525d9f2). Look here to find documentation on topics like our [Guiding Principles,](https://www.notion.so/Guiding-Principles-57dc38f1b6454645bf23b252bc22b440) [How to Contribute](https://www.notion.so/How-to-Contribute-1b88e17f755c491989e4b2bc84db93c7), and [Project Standards](https://www.notion.so/Project-Standards-889a4f2b26b04dc091039f209f823c3c).

## Table of Contents

- [Savile Guiding Principles](#savile-guiding-principles)
- [Local Set Up](#local-set-up)
- [Contributing](#contributing)
- [How To: Add a Token, Element or Component](#how-to-add-a-token-element-or-component)
- [How To: Update the Assets Page](#how-to-update-the-assets-page)
- [Terminology](#terminology)

## Savile Guiding Principles

While we have Guiding Principles for our overarching work on the Turing Engineering Team, we wanted to get more granular with areas of priority and commitment to Savile. The Guiding Principles listed below should guide decisions we make about the project and help users understand the purpose of it.

- **Accessible.** This is well-documented and easy-to-use for all staff members. Users know of all the utils, elements, and components and the variants of those that are available to them. They are able to quickly reference documentation to know what the the rendered version will look like and be able to quickly access the code needed.
- **Simple.** This is a lightweight package in term of size. It is conceptually simple and straightforward; intuitive naming and reasonable variants. A developer should be able to read through our docs and in a couple hours have a good handle on how it works and how to utilize it.
- **Extensible.** It is built in a way that various team members can build on top of it relatively easily. Ways to override and customize are available and documented.
- **Durable.** The current form will last and continue to work, for all users and all app, regardless of tech stack.
- **Composable.** Utils and variants can be combined in many ways to create custom designs.
- **Innocuous.** It plays friendly with other tools like Bootstrap, MaterialUI, etc. and is web platform-agnostic.

## Local Set Up

To set the project up locally on your machine:

- clone the repo down with `git clone git@github.com:turingschool/savile.git`
- run `bundle exec jekyll serve`

## Contributing

Please follow Turing's shared [How to Contribute](https://www.notion.so/turingschool/How-to-Contribute-1b88e17f755c491989e4b2bc84db93c7) guide.

Anything that is merged into the `main` branch will not be immediately available on the `latest` version (or any other version). To release a new version and publish the latest changes, make sure to follow the guidance outlined in [contributing.md](./contributing.md).

### Generating Snapshots for your Pull Request

We use [Percy](https://percy.io/) to generate visual diffs of changes introduced. This helps ensure that every pull request includes a clear summary of how the code changes affected the site UI.

When you are ready to submit your PR for review, please create a Percy build by running the script `$ ./bin/percy`. You will need the `PERCY_TOKEN` environment variable to be set - this can be found by logging into Percy (account info is in the shared Turing 1password).

## How To: Add a Token, Element or Component

The workflow to add a token, element or component to Savile is as follows:

- Touch a new `.scss` file in within the appropriate sub-directory of the css/design_system directory at the root of the project. The file name should match the name of the token/element/component you are building. Find the [terminology below](#terminology) as well as project naming conventions (coming soon).
- Write the CSS for your token/element/component
- Above the CSS code, create a multi-line CSS comment. **The comment must start with two asterisks following the forward slash: `/**`**. Provide any relevant information in the comment, using the available attributes (listed below). See the following example for the specific syntax the docs generator expects:
    - `title` - this will be presented on the docs site and will be the name of the CSS file that is generated in the `docs` directory.
    - `category` - this should match the parent directory (elements, tokens, etc.)
    - `status` - is this a draft, complete, not-maintained, etc?
    - `value` - for variables, this should hold the value it stores. For class names, this should hold the class name wihtout the `.`
    - `description` - short description that the user of Savile will be provided with on the docs site
    - `example` - the HTML you write here will be rendered as the actual element; this provides an example of how this CSS will style the element.
    - some optional attributes may be used based on how the page that renders it is built; defer to any similar files or make up something new that you need!

    ```css
    /**
     * @title Base Button
     * @category elements
     * @element_type button
     * @status draft
     * @value s-button
     * @description Our base button styles. Any other button class can be used in addition to this, to get the desired variant.
     *
     * @example
     * <button class="s-button">Base Button</button>
     */
    ```

- In your terminal, run `./bin/build-css-docs` to run the generator, which will take the single SCSS file you created and wrote, and both feed the CSS into the design system (`_site/css`), and take the documentation and make it markdown-friendly (`docs`).
- While running the project locally, visit the appropriate URI in the browser. You should see this newly created token/element/component displayed with it's respective information.

## How To: Update the Assets Page

The `_data/assets.yml` file is dynamically generated from [this XML page](https://turing-savile-assets.s3.amazonaws.com/?list-type=2) using the `./bin/build-assets-data` script.

If changes are made to the S3 bucket (add/remove files), then you can update the assets page in the docs by re-running the script:

```bash
$ ./bin/build-assets-data
```

If you'd like to add to or update the assets in the S3 bucket and don't have access, please post a message in the #fancy-boots channel on Slack.

## Terminology

Design systems have varying sets of terminology, and many of the terms used within them are used in other parts of development. To make sure all contributors to Savile are clear on those terms here, please read the guide that follows:

### Tokens

Tokens are CSS variables that store a single value for a CSS declaration. Elements, components and patterns should use the tokens whenever they are available. Tokens are available for colors, typography, spacing, borders and shadows. Every Savile variable starts with `s-` to avoid naming conflicts in applications that use Savile.

>Examples Token: A variable called `--s-color-red-500` stores the value `#ef3852` and can be used anywhere within Savile and the applications that use Savile.

### Utilities

Utilities are classes which can be used to change specific styles for an element. They provide a friendlier interface for users of Savile to access the values of tokens by applying classes in HTML rather than referencing variables in CSS. Utilities allow users of Savile to customize the styles of their HTML elements in those cases when there isn't an exact Savile element or component for the job.

> Example: `.s-border-thin`, `.s-text-blue`, `.s-mt-2`

### Elements

Elements should have a 1:1 correlation with HTML elements. Usually those HTML elements are not containers; but directly hold content. Elements will in many cases have variants.

>Example Elements: `button`, `input`, `link`, `p`

### Components

Components should use 2 or more elements together. They are meant to be re-usable, but not always used in the exact same way, as they do allow for variance.

>Example Component: A card (maybe a `div` or `section`) that encompasses a heading and paragraph text elements, and input and button elements. Some potential variances for a card may be an optional heading, optional photo and a top border with color options.

### Patterns

Patterns can contain many elements and/or elements, usually for top level sections.

>Example Patterns: navigation, sidebar, image grid

# Contributing to Savile

Please always following the standards in our [Contributing Guide](https://www.notion.so/turingschool/How-to-Contribute-1b88e17f755c491989e4b2bc84db93c7).

## Versioning

We closely follow the [Semantic Versioning System](https://semver.org/)

Since this is a relatively small project, we combine the idea of minor & patch versioning into simple MINOR versioning, so we only do `x.y` vs `x.y.z`

So what constitutes a major version change -

> MAJOR version when you make incompatible API changes

For this design project, that may include:

- Removing previously defined external accessible css rules
- A large design change that would affect the entire system
- Changing token definitions (i.e. spacing) causing many elements, components to be affected

What constitutes a MINOR version change -

> MINOR version when you add functionality in a backwards compatible manner, and
> PATCH version when you make backwards compatible bug fixes.

For this design project, this may include:

- Adding new components, elements, tokens, css rules
- Fixing bugs in exiting CSS

We don't need to create a MINOR version for every change unless we want it to be publicly available to other applications. We can have multiple PRs included in 1 MINOR version update.

### Finding versions

Full repo bundles of all cut releases are listed on the [releases](https://github.com/turingschool/savile/releases) page within Github. Compiled CSS for each version also lives in the `css/versions/` directory.

### Cutting a New Version

#### Cutting a new MINOR version on the current MAJOR Version (Most Common)
1. Checkout a new branch following the name conventions `v[CURRENT_MAJOR_VERSION].[UPDATED_MINOR_VERSION]` (e.q. `v1.3`)
2. Build the site. This can be done with `bundle exec jekyll build`
3. Locate the `_site/css/main.css` file and copy the contents to clipboard
4. Create a new file under `css/versions/[CURRENT_MAJOR_VERSION]/`; name the file following the naming convention `[version-number].css` (e.g `1.3.css`). Paste what is on your clipboard into this file
5. Override the current `v[CURRENT_MAJOR_VERSION]/[CURRENT_MAJOR_VERSION]-latest.css` (e.g. `v1/1-latest.css`) with the contents of `_site/css/main.css` as well.
6. Commit this new and updated file with `git commit -m "Cut v[version-number] release"`
7. Push these changes up and make a PR
8. Once merged make a new release in Github by going to https://github.com/turingschool/savile/releases and click 'Draft a new release'. Tag version (e.g v1.3),target (master) and release title (e.g 1.3), and what new features are included

Once this PR is merged, two things will happen:
- The `main` branch will be updated with these changes (as you'd expect)
- Savile users can now choose to access this new version at `https://savile.turing.edu/css/versions/[version-file-name].css`.

#### Cutting a new MAJOR version
Similar to the instuctions above with the extra step of creating a new folder (before step 4) with the major version number under `css/versions` and rather than updating `[MAJOR_VERSION]-latest.css` you will need to create that file.

#### Cutting a new MINOR version on an older MAJOR Version (Not Common)
This may be done when fixing a bug or making an update to an older version of Savile.

1. Checkout the most recent release for the MAJOR Version you are looking to update. You can do this by `git checkout v[MOST_RECENT_VERSION]` (e.g. git checkout v1.3)
2. You will need to create a new branch to submit your update. (e.g. git checkout -b v1.4) Note: It is possible you will get in a detached head state. You will need to run `git switch -c v[UPDATED_VERSION]` (e.g git switch -c v1.4) as noted in these [docs](https://git-scm.com/book/en/v2/Git-Basics-Tagging)
3. Make the changes you wish to make to the branch.
4. Follow the steps for 'Cutting a new MINOR version on the current MAJOR Version' above starting at 2.

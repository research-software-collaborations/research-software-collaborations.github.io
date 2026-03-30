# Bootstrap CSS — How It Works

Bootstrap CSS is loaded from a local SCSS build, not from a CDN. This allows Bootstrap's
Sass variables (colors, breakpoints, etc.) to be overridden before the Bootstrap source
is compiled.

## File layout

```
_sass/
  bootstrap/          — Bootstrap 5 SCSS source, copied verbatim from the bootstrap gem.
                        Do not edit these files. Update them by copying from a newer gem version.
  _variables.scss     — Custom variable overrides (colors, etc.). Loaded before Bootstrap.
  _footer.scss        — Site-specific footer styles.
  _masthead.scss      — Site-specific masthead styles.
  _code.scss          — Site-specific code block styles.

assets/css/
  bootstrap.scss      — Imports bootstrap/ and site-specific partials. Compiled to bootstrap.css.
  style.scss          — Main site stylesheet (imports variables, custom styles).
```

## Updating Bootstrap

1. Add `gem 'bootstrap', '~> 5.x'` to the Gemfile and run `bundle install`.
2. Copy the SCSS source from the gem into `_sass/bootstrap/`:
   ```
   cp -r $(bundle show bootstrap)/assets/stylesheets/bootstrap/ _sass/bootstrap/
   ```
3. Remove the gem from the Gemfile and run `bundle install` again.
4. Test with `bundle exec jekyll serve` and do visual QA.

## Alternative: CDN-only Bootstrap

It is possible to drop the local SCSS build entirely and load Bootstrap CSS from a CDN
(as is already done for Bootstrap JS). The tradeoff: you lose the ability to override
Bootstrap Sass variables (like the `$iris-*` brand colors in `_sass/_variables.scss`) at
compile time, and would need to switch to CSS custom property overrides instead.

# Claude Code guidance for this repo

## Running the local dev server

Use the `github-web-dev` conda environment:

```bash
# One-time setup (if the environment doesn't exist yet)
conda create -n github-web-dev -c conda-forge ruby=3.4.8 clang_osx-arm64 -y
conda run -n github-web-dev bundle install

# Start the server (full build — required when editing _data/ files)
conda run -n github-web-dev bundle exec jekyll serve
```

Site is served at http://localhost:4000

### Why this works on macOS arm64

The conda-forge Ruby packages require a cross-compiler wrapper
(`arm64-apple-darwin20.0.0-clang`) to build native gem extensions.
The `clang_osx-arm64` package provides it. Without it, gems like
`eventmachine` and `json` fail to compile.

Do not set `BUNDLE_FORCE_RUBY_PLATFORM: true` in `.bundle/config` —
this forces pre-compiled binary gems (e.g. `nokogiri`, `sass-embedded`)
to build from source, which breaks them.

### Incremental builds and `_data/` files

Do not use `--incremental` when editing files under `_data/` (events,
projects, etc.). Jekyll's incremental mode does not detect data file
changes and will silently skip rebuilding the pages that depend on them.
Run without `--incremental` to get a full rebuild.

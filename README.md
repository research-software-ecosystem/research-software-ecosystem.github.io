<p align="center">
  <a href="https://research-software-ecosystem.org">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/research-software-ecosystem/graphics/main/RSEc_Logo_FULL_mono.png">
      <img src="https://raw.githubusercontent.com/research-software-ecosystem/graphics/main/RSEc_Logo_FULL_RGB.png" alt="ELIXIR Research Software Ecosystem (RSEc)" width="300">
    </picture>
  </a>
</p>

# RSEc website

This repository contains the source of the [ELIXIR Research Software Ecosystem (RSEc) website](https://research-software-ecosystem.org/). The site introduces the ecosystem, its metadata sources and applications, and provides documentation, governance information and community contacts.

## How the site is organised

The site is built with Jekyll and the ELIXIR Toolkit Theme configured in [`_config.yml`](_config.yml).

- Root-level Markdown files contain the website pages, such as `index.md`, `sources.md`, `applications.md` and `docs.md`.
- [`_data/`](_data/) contains navigation and structured content. Edit `_data/topnav.yml` to update the main navigation.
- [`_includes/`](_includes/) contains local template fragments.
- [`_sass/`](_sass/) contains styling, including the website-specific rules in `_sass/custom_classes.scss`.
- [`assets/`](assets/) contains stylesheets, logos and icons.
- [`bin/update-logo.sh`](bin/update-logo.sh) regenerates the favicons and app icons.
- [`.github/workflows/jekyll.yml`](.github/workflows/jekyll.yml) builds and deploys the site to GitHub Pages.

## Preview locally

Use Ruby 3.3, matching the deployment workflow, with Bundler installed. From the repository root:

```sh
bundle install
bundle exec jekyll serve
```

Open the local address printed by Jekyll, normally `http://127.0.0.1:4000`. Jekyll downloads the remote theme during the build, so network access is required. Restart the preview after changing `_config.yml`.

Pages containing Mermaid diagrams also require Node.js and the Mermaid CLI (`mmdc`), which the deployment workflow installs with:

```sh
npm install -g @mermaid-js/mermaid-cli
```

To check the site without starting a server:

```sh
bundle exec jekyll build
```

Generated files are written to `_site/`, which is ignored by Git.

## Logos and icons

The canonical artwork lives in the [RSEc graphics repository](https://github.com/research-software-ecosystem/graphics). The website uses local SVG copies: `assets/img/logo-rsec-full.svg` for the full logo and `assets/img/logo-rsec.svg` for the logomark. The README header uses the light and dark variants from the graphics repository.

After updating the local logomark, regenerate the favicon, Apple touch icon, Android icons, Windows tile and Safari pinned-tab icon:

```sh
bash bin/update-logo.sh
```

The script requires `rsvg-convert` (librsvg) and ImageMagick's `convert` command. Review and commit the updated source SVGs and generated assets together. The Safari icon is generated as a black silhouette; the other icons retain the logo colours.

## Deployment

Pushes to `main` trigger the GitHub Pages workflow, which can also be started manually. In addition to building the site, it downloads the latest `metadata-commons-datasets` artifact from GHCR and adds the archive to the published website. This archive-download step runs in GitHub Actions, not during a local Jekyll preview.

## Contributing

For website changes, edit the relevant page, data file or stylesheet and check the local preview before opening a pull request against `main`. Include regenerated icons when changing the logomark. Keep generated `_site/` files out of commits.

## Acknowledgements

The ELIXIR RSEc is supported and coordinated by [ELIXIR Europe](https://elixir-europe.org/).

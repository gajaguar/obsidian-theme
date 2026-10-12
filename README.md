# Obsidian Custom Theme

A very personalized theme for Obsidian, made for [G.A.JAGUAR](https://www.gajaguar.com).

## About

The theme skins the interface and the editor with a font stack of its own: the
fonts are referenced but not embedded, so install them first. Missing fonts
fall back to Roboto / Roboto Mono, then Obsidian's defaults.

## Requirements

- A vault on Obsidian 1.0.0 or newer (see [`manifest.json`](manifest.json)).
- The fonts the theme references, installed on the system:
  - [Nunito](https://fonts.google.com/specimen/Nunito) — interface and reading view
  - [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads)
    — editor and code

## Usage

Install the theme into a vault and release a version:

```bash
make install                      # toolchain and git hooks
OBSIDIAN__VAULT_PATH=/path/to/vault make deploy  # copy the theme into the vault
```

Then enable **GAJAGUAR** in *Settings › Appearance › Themes*.

Run `make help` for the full target list. Pushing a version tag publishes a
GitHub Release with the theme assets; see
[`docs/conventions/versioning.md`](docs/conventions/versioning.md).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

See [LICENSE](LICENSE).

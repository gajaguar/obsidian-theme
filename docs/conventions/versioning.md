---
type: decision
title: Versioning, tags and releases
description: SemVer decides every version bump, a minor or major bump gets a Git tag, and publishing a release is on demand.
tags: [release, versioning]
status: stable
---

# Versioning, tags and releases

The project follows [Semantic Versioning](https://semver.org/).

## Choosing the bump

| Change                                                                              | Bump    |
| ----------------------------------------------------------------------------------- | ------- |
| Breaking change to the public contract (API, command surface, output, config keys)  | major   |
| Backwards-compatible feature                                                        | minor   |
| Fix, or internal change a user can notice                                           | patch   |
| Documentation, CI, tests or development dependencies only                           | none    |

Before `1.0.0` the contract is not frozen, so a breaking change bumps minor.
`1.0.0` is the release that declares the contract stable.

## When the bump happens

- The pull request that introduces the change bumps the version, in its own
  commit: `chore(release): set the version to X.Y.Z`.
- A pull request that needs no bump says so in its description.

## Tags

- A minor or major bump gets an annotated tag `vX.Y.Z` on the merge commit of
  the base branch, created after the merge and pushed to the remote:
  `git tag -a vX.Y.Z -m "vX.Y.Z" && git push origin vX.Y.Z`.
- A patch bump gets no tag. It is tagged only when someone asks to publish
  that patch.
- Where the `Makefile` defines `make release-tag`, use it: it tags the base
  branch as `v<project.version>` and pushes the tag, after checking that the
  branch is clean and at its remote.

## Releases

- A GitHub Release, and the package publication it triggers, happens on
  demand. The agent MAY suggest one after tagging, and MUST NOT create it
  unasked.
- The release is created from an existing tag.

## In this project

- The version lives in `package.json`. `pnpm run version` runs
  `version-bump.mjs`, which carries it over to `manifest.json` and adds the
  entry to `versions.json`, then stages both files for the bump commit.
- The command surface is `pnpm`: `pnpm run version` for the bump,
  `pnpm run build` (via `make deploy`) to install the theme into a vault.
- Pushing a tag publishes the release: `.github/workflows/release-version.yml`
  creates a GitHub Release for the tag with `manifest.json` and `theme.css`
  attached as assets. Tagging is releasing here, so an on-demand version tag
  is the whole publish step — the Obsidian manual-install flow downloads the
  assets from it.

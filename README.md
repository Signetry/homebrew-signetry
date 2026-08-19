# homebrew-signetry

> **Copyright (c) 2026 Binay Dalai. All rights reserved.**
> This repository is strictly for viewing and contributing to the original project. You may not use, copy, modify, distribute, or commercialize this code for your own personal or commercial projects without explicit written permission. Only the original author retains the right to use and monetize this project.


Homebrew tap for the **Signetry CLI** — the [signetry-core](https://github.com/Signetry/core)
change-control plane for coding agents.

## Install

```sh
brew install signetry/signetry/signetry
```

Or tap first, then install:

```sh
brew tap signetry/signetry
brew install signetry
```

Then:

```sh
signetry init            # scaffold .signetry/admission.yaml
signetry admit .         # govern a change
signetry guard --help    # deterministic pre-action check
```

## What it installs

The `signetry` CLI, built from the **source-available** `signetry-core` repo (All Rights
Reserved; not on PyPI) into an isolated Python virtualenv (Homebrew's
`python@3.12`), symlinked onto your `PATH`. No system Python packages are touched.

## Other install paths

- **pip / uv / pipx:** `pip install "signetry-core @ git+https://github.com/Signetry/core@v0.7.0"`
- **one-liner:** `curl -fsSL https://raw.githubusercontent.com/Signetry/core/main/install.sh | sh`

Part of the [Signetry platform](https://github.com/Signetry/signetry).

## Updating the formula (maintainers)

On each `signetry-core` release, bump the `tag` + `revision` in `Formula/signetry.rb` to
the new git tag. Get the commit SHA for a tag with:

```sh
gh api repos/Signetry/core/git/refs/tags/<vX.Y.Z> --jq .object.sha
```

## License

**Copyright (c) 2026 Binay Dalai. All rights reserved.** This code is not open source. You may not use, copy, modify, distribute, or commercialize it for your own personal or commercial purposes without explicit written permission from the author, who alone retains the right to use and monetize this project. See [CONTRIBUTING.md](CONTRIBUTING.md).

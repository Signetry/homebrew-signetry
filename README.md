# homebrew-umbra

> **Copyright (c) 2026 Binay Dalai. All rights reserved.**
> This repository is strictly for viewing and contributing to the original project. You may not use, copy, modify, distribute, or commercialize this code for your own personal or commercial projects without explicit written permission. Only the original author retains the right to use and monetize this project.


Homebrew tap for the **Umbra CLI** — the [umbra-core](https://github.com/Signetry/core)
change-control plane for coding agents.

## Install

```sh
brew install bkd-dotcom/umbra/umbra
```

Or tap first, then install:

```sh
brew tap bkd-dotcom/umbra
brew install umbra
```

Then:

```sh
umbra init            # scaffold .umbra/admission.yaml
umbra admit .         # govern a change
umbra guard --help    # deterministic pre-action check
```

## What it installs

The `umbra` CLI, built from the **source-available** `umbra-core` repo (All Rights
Reserved; not on PyPI) into an isolated Python virtualenv (Homebrew's
`python@3.12`), symlinked onto your `PATH`. No system Python packages are touched.

## Other install paths

- **pip / uv / pipx:** `pip install "umbra-core @ git+https://github.com/Signetry/core@v0.5.4"`
- **one-liner:** `curl -fsSL https://raw.githubusercontent.com/Signetry/core/main/install.sh | sh`

Part of the [Umbra platform](https://github.com/Signetry/signetry).

## Updating the formula (maintainers)

On each `umbra-core` release, bump the `tag` + `revision` in `Formula/umbra.rb` to
the new git tag. Get the commit SHA for a tag with:

```sh
gh api repos/Signetry/core/git/refs/tags/<vX.Y.Z> --jq .object.sha
```

## License

**Copyright (c) 2026 Binay Dalai. All rights reserved.** This code is not open source. You may not use, copy, modify, distribute, or commercialize it for your own personal or commercial purposes without explicit written permission from the author, who alone retains the right to use and monetize this project. See [CONTRIBUTING.md](CONTRIBUTING.md).

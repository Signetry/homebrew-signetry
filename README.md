# homebrew-signetry

> **[Apache-2.0](LICENSE)** — this tap is open source. The CLI it installs
> ([`signetry-core`](https://github.com/Signetry/core)) is source-available under
> BUSL-1.1 and converts to Apache-2.0 on **2030-08-31**.


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

The `signetry` CLI, built from the **source-available** `signetry-core` repo
([BUSL-1.1](https://github.com/Signetry/core/blob/main/LICENSE); not on PyPI) into an
isolated Python virtualenv (Homebrew's `python@3.12`), symlinked onto your `PATH`. No
system Python packages are touched.

**Two licences are in play here and they are not the same one.** This tap — the formula,
this README, everything in this repository — is Apache-2.0. The software it installs is
BUSL-1.1: you may read, run, fork and patch it, including in production on your own
repositories; the one prohibition is reselling it as a competing hosted governance
service. It converts to Apache-2.0 on 2030-08-31, and every release carries its own
four-year clock. See
[LICENSING.md](https://github.com/Signetry/signetry/blob/main/LICENSING.md).

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

**This tap: [Apache-2.0](LICENSE).** Copyright (c) 2026 Binay Dalai. Fork it, vendor it,
point it at your own mirror.

**What it installs: [BUSL-1.1](https://github.com/Signetry/core/blob/main/LICENSE)** →
Apache-2.0 on 2030-08-31. A packaging repository that is harder to use than the thing it
packages makes no sense, so this one carries no restrictions at all. See
[LICENSING.md](https://github.com/Signetry/signetry/blob/main/LICENSING.md).

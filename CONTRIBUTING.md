# Contributing to homebrew-signetry

This tap is **[Apache-2.0](LICENSE)** — fork it, vendor it, point it at your own mirror,
no permission needed. The CLI it installs
([`signetry-core`](https://github.com/Signetry/core)) is source-available under BUSL-1.1
and converts to Apache-2.0 on **2030-08-31**. Two licences, and they are not the same
one; see [LICENSING.md](https://github.com/Signetry/signetry/blob/main/LICENSING.md).

## What belongs here

Only packaging. This repository contains a Homebrew formula and nothing else — no
governance logic, no detection rules, no CLI behaviour. Those live in
[`Signetry/core`](https://github.com/Signetry/core), and a change that puts any of them
here will be sent upstream instead.

Good contributions:

- **A bottle, or anything that makes the build faster.** Right now every install compiles
  from source.
- **Platform fixes** — a formula that fails on Linuxbrew or on an older macOS is a real
  bug.
- **A `brew audit` / `brew test` workflow.** There is currently no CI here at all, which
  is the most useful gap to close.

## Testing a formula change locally

```sh
brew tap signetry/signetry            # or point at your fork
brew install --build-from-source --verbose signetry
brew test signetry
brew audit --strict --online signetry
```

`brew audit` is the one that catches the mistakes reviewers otherwise catch by eye. Run
it before opening the PR.

## Bumping the pinned version (maintainers)

On each `signetry-core` release, bump **both** the `tag` and the `revision` in
`Formula/signetry.rb`:

```sh
gh api repos/Signetry/core/git/refs/tags/<vX.Y.Z> --jq .object.sha
```

The `revision` is not decoration — it pins the formula to an immutable commit, so a
moved tag cannot silently change what users install.

## The CLA still applies — and why

Open source and a CLA are not in tension. Because Signetry is open core, code
legitimately moves **across the licence line**, and the [CLA](CLA.md) gives the
maintainer the relicensing rights that make those moves possible without tracking down
every past contributor for permission.

It takes nothing from you: you keep the full Apache-2.0 grant on this repository, exactly
like every other user, and you keep the right to use your own work however you like
elsewhere. Contributors are credited in [CONTRIBUTORS.md](CONTRIBUTORS.md), the Git
history, and release notes.

## Signing the CLA (required before merge)

This is enforced by a bot. When you open a pull request, the **CLA Assistant** check
will ask you to sign the [Contributor License Agreement](CLA.md). Reply on the PR
with exactly:

```
I have read the CLA Document and I hereby sign the CLA
```

Your acceptance is recorded in `signatures/cla.json`. A PR **cannot be merged** until
the CLA is signed.

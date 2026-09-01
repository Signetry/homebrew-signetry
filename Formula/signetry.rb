class Signetry < Formula
  include Language::Python::Virtualenv

  desc "Agent-agnostic change-control plane for coding agents (the signetry CLI)"
  homepage "https://github.com/Signetry/signetry"
  # signetry-core is SOURCE-AVAILABLE under BUSL-1.1 (converts to Apache-2.0 on
  # 2030-08-31) and is NOT published to PyPI (all PyPI releases were yanked).
  # Install from the source repo by tag.
  url "https://github.com/Signetry/core.git",
      tag:      "v0.8.0",
      revision: "ee974f324aca0fd35726569d4a1c4f55a5a75a2e"
  # BUSL-1.1 is a valid SPDX identifier, so the real licence can be named here
  # rather than hidden behind :cannot_represent — `brew info signetry` now shows
  # it. This tap itself is Apache-2.0; this field describes what gets installed.
  license "BUSL-1.1"

  depends_on "python@3.12"

  # signetry-core's runtime deps (cryptography, PyYAML) and their transitive deps are
  # resolved from PyPI at install time into an isolated virtualenv. signetry-core
  # itself is built from this checkout (source-available under BUSL-1.1; not on PyPI).
  def install
    venv = virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", buildpath
    bin.install_symlink libexec/"bin/signetry"
  end

  test do
    # The CLI is present and the offline guard runs deterministically (no network).
    (testpath/".signetry").mkdir
    (testpath/".signetry/admission.yaml").write <<~YAML
      version: 1
      allowed_paths:
        - "src/**"
      forbidden_paths:
        - "**/.env*"
    YAML
    system "git", "-C", testpath, "init", "-q"
    # An in-scope path is allowed (exit 0).
    system bin/"signetry", "guard", "--repo", testpath, "--path", "src/app.py"
    # A forbidden path is denied (non-zero exit).
    assert_raises { system bin/"signetry", "guard", "--repo", testpath, "--path", ".env", exception: true }
  end
end

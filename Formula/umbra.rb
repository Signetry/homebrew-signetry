class Umbra < Formula
  include Language::Python::Virtualenv

  desc "Agent-agnostic change-control plane for coding agents (the umbra CLI)"
  homepage "https://github.com/bkd-dotcom/umbra-umbrella"
  # umbra-core is SOURCE-AVAILABLE (All Rights Reserved) and is NOT published to
  # PyPI (all PyPI releases were yanked). Install from the source repo by tag.
  url "https://github.com/bkd-dotcom/umbra-core.git",
      tag:      "v0.5.3",
      revision: "25eebaedb43a45d6e71288c0deda10d3a698b2b0"
  license :cannot_represent # All Rights Reserved — not open source

  depends_on "python@3.12"

  # umbra-core's runtime deps (cryptography, PyYAML) and their transitive deps are
  # resolved from PyPI at install time into an isolated virtualenv. umbra-core
  # itself is built from this checkout (source-available; not on PyPI).
  def install
    venv = virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", buildpath
    bin.install_symlink Dir["#{libexec}/bin/umbra"]
  end

  test do
    # The CLI is present and the offline guard runs deterministically (no network).
    (testpath/".umbra").mkdir
    (testpath/".umbra/admission.yaml").write <<~YAML
      version: 1
      allowed_paths:
        - "src/**"
      forbidden_paths:
        - "**/.env*"
    YAML
    system "git", "-C", testpath, "init", "-q"
    # An in-scope path is allowed (exit 0).
    system bin/"umbra", "guard", "--repo", testpath, "--path", "src/app.py"
    # A forbidden path is denied (non-zero exit).
    assert_raises { system bin/"umbra", "guard", "--repo", testpath, "--path", ".env", exception: true }
  end
end

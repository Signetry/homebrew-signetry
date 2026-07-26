class Umbra < Formula
  include Language::Python::Virtualenv

  desc "Agent-agnostic change-control plane for coding agents (the umbra CLI)"
  homepage "https://github.com/bkd-dotcom/umbra-umbrella"
  url "https://files.pythonhosted.org/packages/f3/60/3e4ca71fa8a21e9fa6a9061061dcdbfd72a840d156105baa6e735ef5dfea/umbra_core-0.3.0.tar.gz"
  sha256 "8f7843d8840871739158eb3bc9277142460ac8a46ff7a8943bf1655354a23be2"
  license "MIT"

  depends_on "python@3.12"

  # umbra-core's runtime deps (cryptography, PyYAML) and their transitive deps are
  # resolved from PyPI at install time into an isolated virtualenv. We install the
  # published wheel + deps rather than pinning every resource by hand, so the
  # formula stays correct across dependency patch releases.
  def install
    venv = virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", "umbra-core==#{version}"
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

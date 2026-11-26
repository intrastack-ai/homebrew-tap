class Intrastack < Formula
  desc "Deploy internal apps to Intrastack"
  homepage "https://intrastack.ai"
  version "0.1.44"
  on_macos do
    on_arm do
      url "https://intrastack.ai/api/cli/releases/0.1.44/download?target=darwin-arm64"
      sha256 "e7688247759430876ff3c3097910daf4d959644511aec069ac6b03c3c49234c1"
    end
    on_intel do
      url "https://intrastack.ai/api/cli/releases/0.1.44/download?target=darwin-x64"
      sha256 "599a1788f3e212c5f7d58cc8a4687c082ca3b9d75e96614e55ec9df27d19442f"
    end
  end
  on_linux do
    on_arm do
      url "https://intrastack.ai/api/cli/releases/0.1.44/download?target=linux-arm64"
      sha256 "f73628a9869a7d247ea98d989fd108885dc37fba5960ea027ac10ae39133021e"
    end
    on_intel do
      url "https://intrastack.ai/api/cli/releases/0.1.44/download?target=linux-x64"
      sha256 "0f21959f0f60f74a509a99377fa367f35030bb6b04f5bcd77516c7249e5f6aba"
    end
  end

  def install
    libexec.install "intrastack", "workerd", "package"
    (libexec/"install-method").write "homebrew\n"
    bin.install_symlink libexec/"intrastack"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/intrastack --version")
  end
end

class Intrastack < Formula
  desc "Deploy internal apps to Intrastack"
  homepage "https://intrastack.ai"
  version "0.1.43"
  on_macos do
    on_arm do
      url "https://intrastack.ai/api/cli/releases/0.1.43/download?target=darwin-arm64"
      sha256 "f4003eb2130aeb7d28dcdd2c42ad72a5995ed628a63647bf91dcf66fede648f0"
    end
    on_intel do
      url "https://intrastack.ai/api/cli/releases/0.1.43/download?target=darwin-x64"
      sha256 "33da2ee4d4c5699bf8af0a1918f58a809730c339f6c848e2cc37f40e30f1ff80"
    end
  end
  on_linux do
    on_arm do
      url "https://intrastack.ai/api/cli/releases/0.1.43/download?target=linux-arm64"
      sha256 "4b12025c1675b734ff81fa5c7847d8e5e4cd4a8a10f5a3f81e55311b698cd0ee"
    end
    on_intel do
      url "https://intrastack.ai/api/cli/releases/0.1.43/download?target=linux-x64"
      sha256 "7498bad986ec2028f776169869577e1fadd45936af5f9ad0e2e80c9bdd38ab08"
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

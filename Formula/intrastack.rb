class Intrastack < Formula
  desc "Deploy internal apps to Intrastack"
  homepage "https://intrastack.ai"
  version "0.1.38"
  on_macos do
    on_arm do
      url "https://intrastack.ai/api/cli/releases/0.1.38/download?target=darwin-arm64"
      sha256 "619911b8d12aa8886d7739146715c860c2de944e51eb9fb1143be98023149a7c"
    end
    on_intel do
      url "https://intrastack.ai/api/cli/releases/0.1.38/download?target=darwin-x64"
      sha256 "ee883ea448861db9707d0c838b85397c6f8e0dbc21bab26ee33bbbf97662759a"
    end
  end
  on_linux do
    on_arm do
      url "https://intrastack.ai/api/cli/releases/0.1.38/download?target=linux-arm64"
      sha256 "4647c154cbaf11c662a2ce904a7c23aae1522308476620f115e8904f8908be86"
    end
    on_intel do
      url "https://intrastack.ai/api/cli/releases/0.1.38/download?target=linux-x64"
      sha256 "7ed93a7e0a788f42a225d1ee8ea897910c653ebdedac9320d5b385ad8bcdfc5a"
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

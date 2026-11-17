class Intrastack < Formula
  desc "Deploy internal apps to Intrastack"
  homepage "https://intrastack.ai"
  version "0.1.35"
  on_macos do
    on_arm do
      url "https://intrastack.ai/api/cli/releases/0.1.35/download?target=darwin-arm64"
      sha256 "6b758f60892633cad97fc3e66adca1fb1588d2295f22e9ed59d779b168b9dffb"
    end
    on_intel do
      url "https://intrastack.ai/api/cli/releases/0.1.35/download?target=darwin-x64"
      sha256 "a024e4b981f5ac4848a9cd683d56d7dcc0021f48141ce15785bb9e886448eb94"
    end
  end
  on_linux do
    on_arm do
      url "https://intrastack.ai/api/cli/releases/0.1.35/download?target=linux-arm64"
      sha256 "0afe90ba51689c0ed2c13931d034fbc6aa72ab1de9e2e8f52f9a66a6fd49b5d6"
    end
    on_intel do
      url "https://intrastack.ai/api/cli/releases/0.1.35/download?target=linux-x64"
      sha256 "9cb3ced5be6e797d3a3b18b7126b0e682fb610ba07c208f6a4f1f05a71841188"
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

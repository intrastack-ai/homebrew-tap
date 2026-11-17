class Intrastack < Formula
  desc "Deploy internal apps to Intrastack"
  homepage "https://intrastack.ai"
  version "0.1.34"
  on_macos do
    on_arm do
      url "https://intrastack.ai/api/cli/releases/0.1.34/download?target=darwin-arm64"
      sha256 "da2ff83c2e21a16855bebb5bcd61d14469af0849c285e75a2b86938574fe955e"
    end
    on_intel do
      url "https://intrastack.ai/api/cli/releases/0.1.34/download?target=darwin-x64"
      sha256 "834555a857fcf04ea355fcdf0f4ad78dd9609480a2c6284f8aab388672781e09"
    end
  end
  on_linux do
    on_arm do
      url "https://intrastack.ai/api/cli/releases/0.1.34/download?target=linux-arm64"
      sha256 "2f7c1d9975b33389ff2dbe86a7e1bb1f7ea0b3a2e50e0a323a256fa640c4b1d4"
    end
    on_intel do
      url "https://intrastack.ai/api/cli/releases/0.1.34/download?target=linux-x64"
      sha256 "90e286233c42923faa32c42ec32fcdc7cfde70c29e4ccee5d04c71fda9100aa2"
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

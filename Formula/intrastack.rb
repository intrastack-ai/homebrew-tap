class Intrastack < Formula
  desc "Deploy internal apps to Intrastack"
  homepage "https://intrastack.ai"
  version "0.1.33"
  on_macos do
    on_arm do
      url "https://intrastack.ai/api/cli/releases/0.1.33/download?target=darwin-arm64"
      sha256 "a3e409557d055cc602b8e08e99b2ad4f7a6d55be52a2ec64d62c17e7e127ed74"
    end
    on_intel do
      url "https://intrastack.ai/api/cli/releases/0.1.33/download?target=darwin-x64"
      sha256 "7fb191a5807afb087e789b3a7e78c3a20a09f88d887ef4d4c340c8e0827654bb"
    end
  end
  on_linux do
    on_arm do
      url "https://intrastack.ai/api/cli/releases/0.1.33/download?target=linux-arm64"
      sha256 "ce20dedf1b3ff37da992024caf307ab829703dc23b721914adffac626b3c4ac0"
    end
    on_intel do
      url "https://intrastack.ai/api/cli/releases/0.1.33/download?target=linux-x64"
      sha256 "48b8dcc275e5ffe7af66fc31c190946c25e9f7fc4dab2e41412ac442353942d6"
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

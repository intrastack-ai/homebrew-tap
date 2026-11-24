class Intrastack < Formula
  desc "Deploy internal apps to Intrastack"
  homepage "https://intrastack.ai"
  version "0.1.40"
  on_macos do
    on_arm do
      url "https://intrastack.ai/api/cli/releases/0.1.40/download?target=darwin-arm64"
      sha256 "4f41efad5f377d1f0d1b083d0fa41be22094230979d58fa0c5a1ff35ebc04ce6"
    end
    on_intel do
      url "https://intrastack.ai/api/cli/releases/0.1.40/download?target=darwin-x64"
      sha256 "409105a53e2ce7e6602ba1c04fd3df48256dafc668c742cd1eef2f982314fb0e"
    end
  end
  on_linux do
    on_arm do
      url "https://intrastack.ai/api/cli/releases/0.1.40/download?target=linux-arm64"
      sha256 "16676941a9bb89152f7be3e01a21e9f90e4de444020ed18fcbcc348b878f6465"
    end
    on_intel do
      url "https://intrastack.ai/api/cli/releases/0.1.40/download?target=linux-x64"
      sha256 "68db2c4b6ee81780b3df420fd59adf5c7dbd64bfd5a59bd0afe9bff6b6357261"
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

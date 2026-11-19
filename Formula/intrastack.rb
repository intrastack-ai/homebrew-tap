class Intrastack < Formula
  desc "Deploy internal apps to Intrastack"
  homepage "https://intrastack.ai"
  version "0.1.37"
  on_macos do
    on_arm do
      url "https://intrastack.ai/api/cli/releases/0.1.37/download?target=darwin-arm64"
      sha256 "3d27ed5b901b4501c658590d0ff9779e804fedfed23c466678fa91ecbf551cb3"
    end
    on_intel do
      url "https://intrastack.ai/api/cli/releases/0.1.37/download?target=darwin-x64"
      sha256 "c5378a320a306745d45562afc9cac0ed7d52a54ec38e52125c073d85ead687b3"
    end
  end
  on_linux do
    on_arm do
      url "https://intrastack.ai/api/cli/releases/0.1.37/download?target=linux-arm64"
      sha256 "3bf1578302bc4570b040902171a6fdfdef3141bcab6234f37460e42c8f394978"
    end
    on_intel do
      url "https://intrastack.ai/api/cli/releases/0.1.37/download?target=linux-x64"
      sha256 "c6be082c54de44e3bd12d462c15a74a14bb0f3b8aaefedc355b6fc6f43a95007"
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

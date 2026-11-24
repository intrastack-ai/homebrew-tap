class Intrastack < Formula
  desc "Deploy internal apps to Intrastack"
  homepage "https://intrastack.ai"
  version "0.1.41"
  on_macos do
    on_arm do
      url "https://intrastack.ai/api/cli/releases/0.1.41/download?target=darwin-arm64"
      sha256 "2fef6f88248b5e5a0c650c13d0d50947adf288683080609456d6309a3b66e756"
    end
    on_intel do
      url "https://intrastack.ai/api/cli/releases/0.1.41/download?target=darwin-x64"
      sha256 "14d63a9c4a8975dea5523bef4593a52ecc94cefeeb0048df86728661e9e44f99"
    end
  end
  on_linux do
    on_arm do
      url "https://intrastack.ai/api/cli/releases/0.1.41/download?target=linux-arm64"
      sha256 "5039800277e5386b5b76dc15505e6dd88591c076bf0869b15f0b5af59837563c"
    end
    on_intel do
      url "https://intrastack.ai/api/cli/releases/0.1.41/download?target=linux-x64"
      sha256 "828b52d83afb36ff71f5e07db76d26184ca6020c6d21104906824c8d120bc93d"
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

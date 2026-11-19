class Intrastack < Formula
  desc "Deploy internal apps to Intrastack"
  homepage "https://intrastack.ai"
  version "0.1.36"
  on_macos do
    on_arm do
      url "https://intrastack.ai/api/cli/releases/0.1.36/download?target=darwin-arm64"
      sha256 "2c0b8a2918bd98fd52e4532affc4cb6e0f9bb65c8d0b1fee25f58177205fd858"
    end
    on_intel do
      url "https://intrastack.ai/api/cli/releases/0.1.36/download?target=darwin-x64"
      sha256 "632698795e2e2b6dffe4621bbe783675aaa89803493e5c0f6d7b8437726b909f"
    end
  end
  on_linux do
    on_arm do
      url "https://intrastack.ai/api/cli/releases/0.1.36/download?target=linux-arm64"
      sha256 "db4fb5f082c2ee52935d0ecc0286e07673ff426f9c447c89f576341616b4806c"
    end
    on_intel do
      url "https://intrastack.ai/api/cli/releases/0.1.36/download?target=linux-x64"
      sha256 "dd7a00a057c91a39540c5520a73b5011afdd510d12675d5887abe9867cf52784"
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

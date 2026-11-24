class Intrastack < Formula
  desc "Deploy internal apps to Intrastack"
  homepage "https://intrastack.ai"
  version "0.1.39"
  on_macos do
    on_arm do
      url "https://intrastack.ai/api/cli/releases/0.1.39/download?target=darwin-arm64"
      sha256 "ee785241665d69391809e78e51a96733aeef7c00cd7ce2b608e7e36ec20c540b"
    end
    on_intel do
      url "https://intrastack.ai/api/cli/releases/0.1.39/download?target=darwin-x64"
      sha256 "528ecbf0ed51a5bb8ab12cf8d4638ccef5efb66e200912c5438a86749fa8bc4d"
    end
  end
  on_linux do
    on_arm do
      url "https://intrastack.ai/api/cli/releases/0.1.39/download?target=linux-arm64"
      sha256 "9995f1cbb4f69b54b616ed1bd1aa7bae330ed7ab25a5d62ddbce783bfd80f7b6"
    end
    on_intel do
      url "https://intrastack.ai/api/cli/releases/0.1.39/download?target=linux-x64"
      sha256 "9ab0a547aaf10e04e661165862e67dd36a3c18f3162419d1314d64b3ff7338ae"
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

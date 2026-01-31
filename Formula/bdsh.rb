class Bdsh < Formula
  desc "Run commands on multiple hosts via SSH with consensus view"
  homepage "https://github.com/brianm/bdsh"
  version "0.2.12"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.12/bdsh-0.2.12-aarch64-apple-darwin.tar.gz"
      sha256 "3be4ea349f363e01a56c8c2fdd03bc1f980529a040339647c64607dcc7e8cfc4"
    else
      url "https://github.com/brianm/bdsh/releases/download/v0.2.12/bdsh-0.2.12-x86_64-apple-darwin.tar.gz"
      sha256 "b9b090c57699a6e861a367fd9c2c233b2819cd472acff57029065a3830ea03ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.12/bdsh-0.2.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "66742cbf5e932ca529c975bec7c5e0ead77a45e17b378e125b8a267efbd34c4f"
    else
      url "https://github.com/brianm/bdsh/releases/download/v0.2.12/bdsh-0.2.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "954b9c287eecfc559eb220208dfa9b0b421dbfe1fbf5c50b56e57887598ed380"
    end
  end

  depends_on "tmux"

  def install
    bin.install "bdsh"
    man1.install "bdsh.1"
  end

  test do
    assert_match "bdsh #{version}", shell_output("#{bin}/bdsh --version")
  end
end

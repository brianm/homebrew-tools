class Bdsh < Formula
  desc "Run commands on multiple hosts via SSH with consensus view"
  homepage "https://github.com/brianm/bdsh"
  version "0.2.15"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.15/bdsh-0.2.15-aarch64-apple-darwin.tar.gz"
      sha256 "47f54ad3b5f1080ef705a203edf80aa68343202678f2a0495f7a796dab6e8d29"
    else
      url "https://github.com/brianm/bdsh/releases/download/v0.2.15/bdsh-0.2.15-x86_64-apple-darwin.tar.gz"
      sha256 "a28c34790832853dad72cc921667a02b1ad77439a1849e066b8bf7d63b22ed1b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.15/bdsh-0.2.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7f53cbdc29866d93fdcc522fb4cc61d7f5961105938a85664ac00e98d30f2d51"
    else
      url "https://github.com/brianm/bdsh/releases/download/v0.2.15/bdsh-0.2.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5e799a60369e4c173d725221e140e87e4fb1bbc62a5aa265ee3764ec7037a7de"
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

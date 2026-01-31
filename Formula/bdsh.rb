class Bdsh < Formula
  desc "Run commands on multiple hosts via SSH with consensus view"
  homepage "https://github.com/brianm/bdsh"
  version "0.2.11"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.11/bdsh-0.2.11-aarch64-apple-darwin.tar.gz"
      sha256 "7c8bc49be325e08c0ededa8b645484f727e6b84dc45c1570f7ff24728682e594"
    else
      url "https://github.com/brianm/bdsh/releases/download/v0.2.11/bdsh-0.2.11-x86_64-apple-darwin.tar.gz"
      sha256 "30f8e21f08de9fce94688d08e49e570a09af1ccadbe1d0d3e14caba13b99a24a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.11/bdsh-0.2.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2ac42945902092da016573edc3b954ca9bf50b8d0c98b6850b66600ba0abb632"
    else
      url "https://github.com/brianm/bdsh/releases/download/v0.2.11/bdsh-0.2.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "28ece3f07cea957c46beabb4a0c2501bf13b668323dc544f0fabd0a13a11a431"
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

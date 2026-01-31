class Bdsh < Formula
  desc "Run commands on multiple hosts via SSH with consensus view"
  homepage "https://github.com/brianm/bdsh"
  version "0.2.14"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.14/bdsh-0.2.14-aarch64-apple-darwin.tar.gz"
      sha256 "b2e3333d5270cca8e9bcf1d77b4b3c166cb3c109091eab5b783ffa9ba49dc290"
    else
      url "https://github.com/brianm/bdsh/releases/download/v0.2.14/bdsh-0.2.14-x86_64-apple-darwin.tar.gz"
      sha256 "bc52daa2651cc965d3cf76296b0a387248ad4af29649c2a8825232bd0c4bcaa8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.14/bdsh-0.2.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a6310dbfa44ab8af9e769aceb0e3a696b9e794d5cc1f7541c60201a67a54b77c"
    else
      url "https://github.com/brianm/bdsh/releases/download/v0.2.14/bdsh-0.2.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0f2b5d89aa24a0f74d105f4df3bf6a3da961daf69a62415d6bacd0c55edc4167"
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

class Bdsh < Formula
  desc "Run commands on multiple hosts via SSH with consensus view"
  homepage "https://github.com/brianm/bdsh"
  version "0.2.13"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.13/bdsh-0.2.13-aarch64-apple-darwin.tar.gz"
      sha256 "da5aafe7b55ea6f04c1517c90f5d149eef447e946ff0453ec937335e001ebc3a"
    else
      url "https://github.com/brianm/bdsh/releases/download/v0.2.13/bdsh-0.2.13-x86_64-apple-darwin.tar.gz"
      sha256 "c05008a8833ecf69729fcd10ed0d5f84ddbaf3b50138deae66cb36b608d414f2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.13/bdsh-0.2.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "583c4460ef149b80863388e9ab2aa341ea1777d61e90723852e67129a41c4e33"
    else
      url "https://github.com/brianm/bdsh/releases/download/v0.2.13/bdsh-0.2.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f41453069fe282f0f224aaf8852bced42dfb9e0f81ece1516e2c7c8d0c03bf7c"
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

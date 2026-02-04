class Bdsh < Formula
  desc "Run commands on multiple hosts via SSH with consensus view"
  homepage "https://github.com/brianm/bdsh"
  version "0.2.16"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.16/bdsh-0.2.16-aarch64-apple-darwin.tar.gz"
      sha256 "76108959abb3ae952d651c68358c65e4a11136f0c15d1057b1cba9a644ca002f"
    else
      url "https://github.com/brianm/bdsh/releases/download/v0.2.16/bdsh-0.2.16-x86_64-apple-darwin.tar.gz"
      sha256 "1162d111868eec7523d20101b709cc04429490566e255d71126c4d1320d711d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.16/bdsh-0.2.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9c157139387ec1a24c348e8a92e16a97dbec804bb370a4d4686388f519e5377f"
    else
      url "https://github.com/brianm/bdsh/releases/download/v0.2.16/bdsh-0.2.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "653a6ad520e514ef6e86341af93f70229f2c63bcf724e4e620c5f2ce927b79c3"
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

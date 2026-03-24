class Bdsh < Formula
  desc "Run commands on multiple hosts via SSH with consensus view"
  homepage "https://github.com/brianm/bdsh"
  version "0.2.17"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.17/bdsh-0.2.17-aarch64-apple-darwin.tar.gz"
      sha256 "c7dcb12fe2c0d7fa3120bd65f217d3ddbc22695fcc8d6736f7c80e436420d308"
    else
      url "https://github.com/brianm/bdsh/releases/download/v0.2.17/bdsh-0.2.17-x86_64-apple-darwin.tar.gz"
      sha256 "b891773710e815be364d82be6d53b1804a4e5c3297b16a83d8e60c8062723b65"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.17/bdsh-0.2.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a2462dd8f735444e0032f58dd3ee847251c62a1233a3c395dd2ce711dbbeccc9"
    else
      url "https://github.com/brianm/bdsh/releases/download/v0.2.17/bdsh-0.2.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a9f966607f84421118d4b8fa19bd226293a3d23ffcfc9e37352b3ed3ce58fcfd"
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

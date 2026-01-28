class Bdsh < Formula
  desc "Run commands on multiple hosts simultaneously via SSH with consensus output view"
  homepage "https://github.com/brianm/bdsh"
  version "0.1.7"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.1.7/bdsh-aarch64-apple-darwin.tar.xz"
      sha256 "d8479186a2d403b49d4359f60d752bfb479c3665f3cb83b1bbb5664a2887382e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/brianm/bdsh/releases/download/v0.1.7/bdsh-x86_64-apple-darwin.tar.xz"
      sha256 "56c68ef6fceec1d5844854f74638426932c1f5796d8b8c4144f750c57fd1f161"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.1.7/bdsh-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a6c03e8bf784bead925b2dd3892836ab48402332dade49851d80702f28de1bab"
    end
    if Hardware::CPU.intel?
      url "https://github.com/brianm/bdsh/releases/download/v0.1.7/bdsh-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f0b8bf55dde26da6e7a1333d6ff555ca0419cb636d2d1041e9be10de2190b0a0"
    end
  end
  license "Apache-2.0"
  depends_on "tmux"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "bdsh" if OS.mac? && Hardware::CPU.arm?
    bin.install "bdsh" if OS.mac? && Hardware::CPU.intel?
    bin.install "bdsh" if OS.linux? && Hardware::CPU.arm?
    bin.install "bdsh" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end

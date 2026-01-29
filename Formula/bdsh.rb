class Bdsh < Formula
  desc "Run commands on multiple hosts simultaneously via SSH with consensus output view"
  homepage "https://github.com/brianm/bdsh"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.0/bdsh-aarch64-apple-darwin.tar.xz"
      sha256 "3da93a6bba62af4f2d9efaf0f474338f18231ea54ea028df37b3eaa47cfe625b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.0/bdsh-x86_64-apple-darwin.tar.xz"
      sha256 "4f8a4d812a55884b13bc1c4fe2a6395db064d270d3d27a4a53430d187102945c"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.0/bdsh-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "f9b218cba7ef35e1371e7852b52844d7787553d931ae8fea78c46aa5df9ecf03"
    end
    if Hardware::CPU.intel?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.0/bdsh-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "6c4a3d9cb7cd95ddbc04beec37b15c6521201546bc31d2f63b179f660d2fa44f"
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

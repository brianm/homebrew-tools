class Bdsh < Formula
  desc "Run commands on multiple hosts simultaneously via SSH with consensus output view"
  homepage "https://github.com/brianm/bdsh"
  version "0.2.7"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.7/bdsh-aarch64-apple-darwin.tar.xz"
      sha256 "6e8240ceb6bd15427450bbac7c3ea66d55248d5d8b35d9c165fc8190332a401d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.7/bdsh-x86_64-apple-darwin.tar.xz"
      sha256 "1288cd67e9621af3beb906b2e877bb6826224e96d1a5fed676da29987ef2fb69"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.7/bdsh-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "3c11702b6589aafd0396d3f2f1071e0636e9f2a9fe45ac198a0a9ef850f35c4d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.7/bdsh-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "169fe2b5afeb7fc089cfe15a081fee419699132d60ee5782cc090b4402205328"
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
    man1.install "doc/bdsh.1"
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

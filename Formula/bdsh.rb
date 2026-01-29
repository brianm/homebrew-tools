class Bdsh < Formula
  desc "Run commands on multiple hosts simultaneously via SSH with consensus output view"
  homepage "https://github.com/brianm/bdsh"
  version "0.2.9"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.9/bdsh-aarch64-apple-darwin.tar.xz"
      sha256 "582e5582218d577de6e50a6ca9d7e487081b3ef297817216ed473d8b18d3acde"
    end
    if Hardware::CPU.intel?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.9/bdsh-x86_64-apple-darwin.tar.xz"
      sha256 "a5eb0ebdd6e6846e0a1807ee2a96f8f323e1ad0cfce61a4baf52a3bedd2690df"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.9/bdsh-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "c20085c0d27e577307cb3227148c36f3dabf0ff5a52704b9081a03bffef24aef"
    end
    if Hardware::CPU.intel?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.9/bdsh-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "3699cf330f79165443bbbd3453e261c59956f8b138175e08458ef6090cdd9dfb"
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
    man1.install "bdsh.1"
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

class Bdsh < Formula
  desc "Run commands on multiple hosts simultaneously via SSH with consensus output view"
  homepage "https://github.com/brianm/bdsh"
  version "0.2.6"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.6/bdsh-aarch64-apple-darwin.tar.xz"
      sha256 "600080108453a7083de1dd7faa9f4a5c9b24bf160fd7355b156ab91a9291803a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.6/bdsh-x86_64-apple-darwin.tar.xz"
      sha256 "fc688868dfd704d8b17f631d0a3b4fbb914d48ccb4b7bbea87dc9c9526738417"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.6/bdsh-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "7deab20cb741b2f2a385dfd82d4fe9148adbef12bd39b048ce8b80036cda6833"
    end
    if Hardware::CPU.intel?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.6/bdsh-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "9a30ad553bf417c2f2c7a81e0d0e7133204d517840c38ad3e579147aaecbe3c9"
    end
  end
  license "Apache-2.0"
  depends_on "tmux"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin": {},
    "x86_64-unknown-linux-gnu": {}
  }

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install
    man1.install "doc/bdsh.1"_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    man1.install "doc/bdsh.1"
    if OS.mac? && Hardware::CPU.arm?
      bin.install "bdsh"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "bdsh"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "bdsh"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "bdsh"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end

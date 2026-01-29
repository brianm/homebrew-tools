class Bdsh < Formula
  desc "Run commands on multiple hosts simultaneously via SSH with consensus output view"
  homepage "https://github.com/brianm/bdsh"
  version "0.2.8"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.8/bdsh-aarch64-apple-darwin.tar.xz"
      sha256 "060cf90796c03ee2d49aaae49e43788228820ac1d514da862e0fe5540ac24ee2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.8/bdsh-x86_64-apple-darwin.tar.xz"
      sha256 "5605429b44b2e1fa584c581246153e3ce67d35e35cb8a8df6fd8a549373fd880"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.8/bdsh-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9fa92311c6ab42475b022e1edd00bca75fc5b89d88a8228afbc87eb0bbf73c53"
    end
    if Hardware::CPU.intel?
      url "https://github.com/brianm/bdsh/releases/download/v0.2.8/bdsh-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "1ade0b65a3c0dd0dce0e767dc56324154f5cce505a32f39a4d1c757e7f3227e8"
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

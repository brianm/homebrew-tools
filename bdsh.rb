class Bdsh < Formula
  desc "Better Distributed Shell - run commands on multiple hosts with consensus view"
  homepage "https://github.com/brianm/bdsh"
  url "https://github.com/brianm/bdsh/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "3c2b5f6881321af97f7c79158701ee4c65d7c83bc6db9acc182069999c8caf27"
  license "Apache-2.0"
  head "https://github.com/brianm/bdsh.git"

  depends_on "rust" => :build
  depends_on "tmux"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"bdsh", "--help"
  end
end

class Bdsh < Formula
  desc "Better Distributed Shell - run commands on multiple hosts with consensus view"
  homepage "https://github.com/brianm/bdsh"
  url "https://github.com/brianm/bdsh/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  license "Apache-2.0"
  head "https://github.com/brianm/bdsh.git"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"bdsh", "--help"
  end
end

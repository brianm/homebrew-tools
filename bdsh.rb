class Bdsh < Formula
  desc "Better Distributed Shell - run commands on multiple hosts with consensus view"
  homepage "https://github.com/brianm/bdsh"
  url "https://github.com/brianm/bdsh/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "eba78f11df453bb8bcef52bfa7f8bdd0a3767ec9ca3c613e77c11890b6b98e69"
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

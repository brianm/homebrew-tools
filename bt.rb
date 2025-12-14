class Bt < Formula
  desc "Small task tracker for small projects"
  homepage "https://github.com/brianm/bt"
  url "https://github.com/brianm/bt/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "6322a5b6601dd2c7f3465b0dc7f7b57d6d6bc845cc96c39290c6b591ec0be2fb"
  license "Apache-2.0"
  head "https://github.com/brianm/bt.git"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"bt", "--version"
  end
end

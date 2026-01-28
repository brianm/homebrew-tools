class Yatl < Formula
  desc "Small task tracker for small projects"
  homepage "https://github.com/brianm/yatl"
  url "https://github.com/brianm/yatl/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "7d0e5df375e81143147550e644c1c1fd36256a83b0d03b253f6071103d3810ab"
  license "Apache-2.0"
  head "https://github.com/brianm/yatl.git"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"yatl", "--version"
  end
end

class Yatl < Formula
  desc "Small task tracker for small projects"
  homepage "https://github.com/brianm/yatl"
  url "https://github.com/brianm/yatl/archive/refs/tags/v0.4.3.tar.gz"
  sha256 "4b43f91be9281b60f65a0b5073362817242bcb6fa091b977c4d67f55208d0ee9"
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

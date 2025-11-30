class Bt < Formula
  desc "Small task tracker for small projects"
  homepage "https://github.com/brianm/bt"
  url "https://github.com/brianm/bt/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "0c0796a81baf7eefd991a965728ca526f6fab38aa458997beafc29c204c7b0cf"
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

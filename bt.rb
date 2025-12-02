class Bt < Formula
  desc "Small task tracker for small projects"
  homepage "https://github.com/brianm/bt"
  url "https://github.com/brianm/bt/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "b8ff9239506121d8af0984de6e78b044bf900eadda2e513cefaf1fba19e13161"
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

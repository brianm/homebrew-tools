class Wsf < Formula
  desc "Washington State Ferry Schedule CLI"
  homepage "https://github.com/brianm/wsf"
  url "https://github.com/brianm/wsf/archive/refs/tags/wsf-1.1.12.tar.gz"
  sha256 "5d3a1c5406c848f0966cb27f663f814d365f5b8b498dd8c6a695c3230bc80d93"
  license "Apache-2.0"
  head "https://github.com/brianm/wsf.git"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    man1.install "wsf.1"
  end

  test do
    system bin/"wsf", "--help"
  end
end

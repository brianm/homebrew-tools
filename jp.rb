class Jp < Formula
  desc "JSON processor using JSON pointers"
  homepage "https://github.com/brianm/jp"
  url "https://github.com/brianm/jp/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "5e52639d4d026f9d6de6683a1a1af3df43373807ff15c4f3ff4efcb0c84bf475"
  license "Apache-2.0"
  head "https://github.com/brianm/jp.git"

  depends_on "pandoc" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/jp"
    man1.install "target/jp.1"
  end

  test do
    system bin/"jp", "--version"
  end
end

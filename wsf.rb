require "formula"

class Wsf < Formula
  head "https://github.com/brianm/wsf.git"

  url "https://github.com/brianm/wsf/archive/wsf-0.1.2.tar.gz"
  version "0.1.2"
  homepage "https://github.com/brianm/wsf"
  sha256 ""

  depends_on "rust" => :build
  depends_on "pandoc" => :build
  
  def install
    system "make"    
    bin.install "target/release/wsf"
    man1.install "wsf.1"
  end
end

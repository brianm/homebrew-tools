require "formula"

class Wsf < Formula
  head "https://github.com/brianm/wsf.git"

  url "https://github.com/brianm/wsf/archive/wsf-0.1.1.tar.gz"
  version "0.1.1"
  homepage "https://github.com/brianm/wsf"
  sha256 "850cc9b1a90c7ade14a100a78e8124e10a22c9860c985d31899037b03d5d7ce5"

  depends_on "rust" => :build
  depends_on "pandoc" => :build
  
  def install
    system "make"    
    bin.install "target/release/wsf"
    man1.install "wsf.1"
  end
end

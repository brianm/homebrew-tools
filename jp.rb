require "formula"

$jp_version = "0.3.1"

class Jp < Formula
  head "https://github.com/brianm/jp.git"

  url "https://github.com/brianm/jp/archive/jp-#{$jp_version}.tar.gz"
  version $wsf_version
  homepage "https://github.com/brianm/jp"
  sha256 "478bb7b1f5c083f4f9e3a9f59491d53c5ec1a4085bd837df82bdbb63f5acb474"

  depends_on "rust" => :build
  depends_on "pandoc" => :build
  
  def install
    system "cargo build --release"
    bin.install "target/release/jp"
    man1.install "target/jp.1"
  end
end

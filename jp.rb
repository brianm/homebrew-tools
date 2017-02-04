require "formula"

$jp_version = "0.3.0"

class Jp < Formula
  head "https://github.com/brianm/jp.git"

  url "https://github.com/brianm/jp/archive/jp-#{$jp_version}.tar.gz"
  version $wsf_version
  homepage "https://github.com/brianm/jp"
  sha256 "5fa4926421005f88989a5d4bb5a80d15167e7e88b1454402fec2db059ab5de86"

  depends_on "rust" => :build
  depends_on "pandoc" => :build
  
  def install
    system "cargo build --release"
    bin.install "target/release/jp"
    man1.install "target/jp.1"
  end
end

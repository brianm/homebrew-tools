require "formula"

$jp_version = "0.2.0"

class Jp < Formula
  head "https://github.com/brianm/jp.git"

  url "https://github.com/brianm/jp/archive/jp-#{$jp_version}.tar.gz"
  version $wsf_version
  homepage "https://github.com/brianm/jp"
  sha256 "f827ea4c7be51e52a4a11d9f59d8dc795bdaee8bb55d395518159d5de3499a8c"

  depends_on "rust" => :build
  def install
    system "cargo build --release"
    bin.install "target/release/jp"
  end
end

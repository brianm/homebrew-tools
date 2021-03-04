require "formula"

$pkg_version = "0.4.0"
$pkg_group = "brianm"
$pkg_repo = "dice"
$pkg_tag = "#{$pkg_repo}-#{$pkg_version}"

class Dice < Formula
  head "https://github.com/#{$pkg_group}/#{$pkg_repo}.git"

  url "https://github.com/#{$pkg_group}/#{$pkg_repo}/archive/#{$pkg_tag}.tar.gz"
  version $pkg_version
  homepage "https://github.com/#{$pkg_group}/#{$pkg_repo}"
  sha256 "ce7d009cd590eb1f7ed184b81abf3a7ca0d89bff283c30af3d9e4dd198a685fc"

  depends_on "rust" => :build

  def install
    system "cargo build --release"
    bin.install "target/release/dice"
  end
end

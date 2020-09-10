require "formula"

$pkg_version = "0.2.0"
$pkg_group = "brianm"
$pkg_repo = "aqi"
$pkg_tag = "#{$pkg_repo}-#{$pkg_version}"

class Aqi < Formula
  head "https://github.com/#{$pkg_group}/#{$pkg_repo}.git"

  url "https://github.com/#{$pkg_group}/#{$pkg_repo}/archive/#{$pkg_tag}.tar.gz"
  version $pkg_version
  homepage "https://github.com/#{$pkg_group}/#{$pkg_repo}"
  sha256 "d1419eef4cae6b005e5005f6b60ee7dc762fd995a328752e0c19078bdae0c4bc"

  depends_on "rust" => :build
  depends_on "openssl"

  def install
    system "cargo build --release"
    bin.install "target/release/aqi"
  end
end

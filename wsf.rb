require "formula"

$pkg_version = "1.1.12"
$pkg_group = "brianm"
$pkg_repo = "wsf"
$pkg_tag = "#{$pkg_repo}-#{$pkg_version}"

class Wsf < Formula
  head "https://github.com/#{$pkg_group}/#{$pkg_repo}.git"

  url "https://github.com/#{$pkg_group}/#{$pkg_repo}/archive/#{$pkg_tag}.tar.gz"
  version $pkg_version
  homepage "https://github.com/#{$pkg_group}/#{$pkg_repo}"
  sha256 "5d3a1c5406c848f0966cb27f663f814d365f5b8b498dd8c6a695c3230bc80d93"

  depends_on "rust" => :build

  def install
    system "cargo build --release"
    bin.install "target/release/wsf"
    man1.install "wsf.1"
  end
end

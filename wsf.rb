require "formula"

$pkg_version = "0.1.6"
$pkg_group = "brianm"
$pkg_repo = "wsf"
$pkg_tag = "#{$pkg_repo}-#{$pkg_version}"

class Wsf < Formula
  head "https://github.com/#{$pkg_group}/#{$pkg_repo}.git"

  url "https://github.com/#{$pkg_group}/#{$pkg_repo}/archive/#{$pkg_tag}.tar.gz"
  version $pkg_version
  homepage "https://github.com/#{$pkg_group}/#{$pkg_repo}"
  sha256 ""

  depends_on "rust" => :build
  depends_on "pandoc" => :build
  depends_on "openssl"

  def install
    system "cargo build --release"
    bin.install "target/release/wsf"
    man1.install "wsf.1"
  end
end

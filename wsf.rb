require "formula"

$pkg_version = "1.1.9"
$pkg_group = "brianm"
$pkg_repo = "wsf"
$pkg_tag = "#{$pkg_repo}-#{$pkg_version}"

class Wsf < Formula
  head "https://github.com/#{$pkg_group}/#{$pkg_repo}.git"

  url "https://github.com/#{$pkg_group}/#{$pkg_repo}/archive/#{$pkg_tag}.tar.gz"
  version $pkg_version
  homepage "https://github.com/#{$pkg_group}/#{$pkg_repo}"
  sha256 "40bd0c7b1326906489892a7a989cb1e4e7fbd4bf4df609657f07b9d0a9c0d2a9"

  depends_on "rust" => :build
  depends_on "pandoc" => :build
  depends_on "openssl"

  def install
    system "cargo build --release"
    bin.install "target/release/wsf"
    man1.install "wsf.1"
  end
end

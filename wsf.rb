require "formula"

$pkg_version = "1.1.8"
$pkg_group = "brianm"
$pkg_repo = "wsf"
$pkg_tag = "#{$pkg_repo}-#{$pkg_version}"

class Wsf < Formula
  head "https://github.com/#{$pkg_group}/#{$pkg_repo}.git"

  url "https://github.com/#{$pkg_group}/#{$pkg_repo}/archive/#{$pkg_tag}.tar.gz"
  version $pkg_version
  homepage "https://github.com/#{$pkg_group}/#{$pkg_repo}"
  sha256 "af7ba3e764a5a9a0ce23362d42a5962917bba2694adfa27af3f3137ad86cf8b1"

  depends_on "rust" => :build
  depends_on "pandoc" => :build
  depends_on "openssl"

  def install
    system "cargo build --release"
    bin.install "target/release/wsf"
    man1.install "wsf.1"
  end
end

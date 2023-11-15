require "formula"

$pkg_version = "1.1.11"
$pkg_group = "brianm"
$pkg_repo = "wsf"
$pkg_tag = "#{$pkg_repo}-#{$pkg_version}"

class Wsf < Formula
  head "https://github.com/#{$pkg_group}/#{$pkg_repo}.git"

  url "https://github.com/#{$pkg_group}/#{$pkg_repo}/archive/#{$pkg_tag}.tar.gz"
  version $pkg_version
  homepage "https://github.com/#{$pkg_group}/#{$pkg_repo}"
  sha256 "f81f58a0f51f5fa6f1ca59474e2c13312c9f8687e023e580804c74ae189a8cc4"

  depends_on "rust" => :build

  def install
    system "cargo build --release"
    bin.install "target/release/wsf"
    man1.install "wsf.1"
  end
end

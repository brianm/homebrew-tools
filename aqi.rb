require "formula"

$pkg_version = "0.1.0"
$pkg_group = "brianm"
$pkg_repo = "aqi"
$pkg_tag = "#{$pkg_repo}-#{$pkg_version}"

class Aqi < Formula
  head "https://github.com/#{$pkg_group}/#{$pkg_repo}.git"

  url "https://github.com/#{$pkg_group}/#{$pkg_repo}/archive/#{$pkg_tag}.tar.gz"
  version $pkg_version
  homepage "https://github.com/#{$pkg_group}/#{$pkg_repo}"
  sha256 "8cba0264d1cf5451765bd1f691b0768f939a44bed85934b906ac6a38ea04c202"

  depends_on "rust" => :build
  depends_on "openssl"

  def install
    system "cargo build --release"
    bin.install "target/release/aqi"
  end
end

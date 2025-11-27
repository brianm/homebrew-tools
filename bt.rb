require "formula"

$pkg_version = "0.1.0"
$pkg_group = "brianm"
$pkg_repo = "bt"
$pkg_tag = "v#{$pkg_version}"

class Bt < Formula
  head "https://github.com/#{$pkg_group}/#{$pkg_repo}.git"

  url "https://github.com/#{$pkg_group}/#{$pkg_repo}/archive/#{$pkg_tag}.tar.gz"
  version $pkg_version
  homepage "https://github.com/#{$pkg_group}/#{$pkg_repo}"
  sha256 "9939a48cf0259c11ad8d57b8ca0d3f2b1643b21ed81b50492a0f88999633a0a4"

  depends_on "rust" => :build

  def install
    system "cargo build --release"
    bin.install "target/release/bt"
  end
end

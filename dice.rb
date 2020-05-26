require "formula"

$pkg_version = "0.3.0"
$pkg_group = "brianm"
$pkg_repo = "dice"
$pkg_tag = "#{$pkg_repo}-#{$pkg_version}"

class Dice < Formula
  head "https://github.com/#{$pkg_group}/#{$pkg_repo}.git"

  url "https://github.com/#{$pkg_group}/#{$pkg_repo}/archive/#{$pkg_tag}.tar.gz"
  version $pkg_version
  homepage "https://github.com/#{$pkg_group}/#{$pkg_repo}"
  sha256 "e73677254819e467e587c292a2932947e0419d1dc10f2386d5233bbdf1ad223f"

  depends_on "rust" => :build

  def install
    system "cargo build --release"
    bin.install "target/release/dice"
  end
end

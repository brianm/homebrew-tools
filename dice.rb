require "formula"

$pkg_version = "0.2.0"
$pkg_group = "brianm"
$pkg_repo = "dice"
$pkg_tag = "#{$pkg_repo}-#{$pkg_version}"

class Dice < Formula
  head "https://github.com/#{$pkg_group}/#{$pkg_repo}.git"

  url "https://github.com/#{$pkg_group}/#{$pkg_repo}/archive/#{$pkg_tag}.tar.gz"
  version $pkg_version
  homepage "https://github.com/#{$pkg_group}/#{$pkg_repo}"
  sha256 "9a5372514179639a2144a66dea4943278830dbae15d817b2c2ffc11fe7b12cbf"

  depends_on "rust" => :build

  def install
    system "cargo build --release"
    bin.install "target/release/dice"
  end
end

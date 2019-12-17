require "formula"

$pkg_version = "0.1.0"
$pkg_group = "brianm"
$pkg_repo = "dice"
$pkg_tag = "#{$pkg_repo}-#{$pkg_version}"

class Dice < Formula
  head "https://github.com/#{$pkg_group}/#{$pkg_repo}.git"

  url "https://github.com/#{$pkg_group}/#{$pkg_repo}/archive/#{$pkg_tag}.tar.gz"
  version $pkg_version
  homepage "https://github.com/#{$pkg_group}/#{$pkg_repo}"
  sha256 "9a4022a5115079f9a1b72f8ff99886c83725311e2695b8648673726cc8323687"

  depends_on "rust" => :build

  def install
    system "cargo build --release"
    bin.install "target/release/dice"
  end
end

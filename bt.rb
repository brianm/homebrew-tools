require "formula"

$pkg_version = "0.1.0"
$pkg_group = "brianm"
$pkg_repo = "bt"
$pkg_tag = "#{$pkg_repo}-#{$pkg_version}"

class Bt < Formula
  head "https://github.com/#{$pkg_group}/#{$pkg_repo}.git"

  url "https://github.com/#{$pkg_group}/#{$pkg_repo}/archive/#{$pkg_tag}.tar.gz"
  version $pkg_version
  homepage "https://github.com/#{$pkg_group}/#{$pkg_repo}"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"

  depends_on "rust" => :build

  def install
    system "cargo build --release"
    bin.install "target/release/bt"
  end
end

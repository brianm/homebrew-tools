require "formula"

$_version = "0.3.0"
$_group = "brianm"
$_name = "whereami"

class Whereami < Formula
  head "https://github.com/#{$_group}/#{$_name}.git"

  url "https://github.com/#{$_group}/#{$_name}/archive/#{$_name}-#{$_version}.tar.gz"
  version $wsf_version
  homepage "https://github.com/#{$_group}/#{$_name}"
  sha256 "c0157977798e6fbe24cea67c4f469ec1016914c40e05f093b070aff247c596de"

  def install
    system "make"
    bin.install "whereami"    
  end
end

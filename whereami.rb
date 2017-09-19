require "formula"

$_version = "0.1"
$_group = "brianm"
$_name = "whereami"

class Whereami < Formula
  head "https://github.com/#{$_group}/#{$_name}.git"

  url "https://github.com/#{$_group}/#{$_name}/archive/#{$_name}-#{$_version}.tar.gz"
  version $wsf_version
  homepage "https://github.com/#{$_group}/#{$_name}"
  sha256 "6ab919830862ff2b34fb6ffb9af7c22646e6cfabb87c84ebfe689314f84612c6"

  def install
    system "make"
    bin.install "whereami"    
  end
end

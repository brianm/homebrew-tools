require "formula"

$_version = "0.2.0"
$_group = "brianm"
$_name = "whereami"

class Whereami < Formula
  head "https://github.com/#{$_group}/#{$_name}.git"

  url "https://github.com/#{$_group}/#{$_name}/archive/#{$_name}-#{$_version}.tar.gz"
  version $wsf_version
  homepage "https://github.com/#{$_group}/#{$_name}"
  sha256 "7400ec0afaef6d7d445e665a82fb677e605e1d14e9fb69437f8a2c18dd10443b"

  def install
    system "make"
    bin.install "whereami"    
  end
end

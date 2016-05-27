require "formula"

$wsf_version = "0.1.3"

class Wsf < Formula
  head "https://github.com/brianm/wsf.git"

  url "https://github.com/brianm/wsf/archive/wsf-#{$wsf_version}.tar.gz"
  version $wsf_version
  homepage "https://github.com/brianm/wsf"
  sha256 "ad9adfeaad6c9871279a2800e25b3b2f0f0e65a36642cc2c42ba3161ab97b3f1"

  depends_on "rust" => :build
  depends_on "pandoc" => :build
  depends_on "openssl"
  
  def install
    # export OPENSSL_INCLUDE_DIR=`/include
    # export OPENSSL_LIB_DIR=`brew --prefix openssl`/lib
    #ENV['OPENSSL_INCLUDE_DIR'] = "#{`brew --prefix openssl`}/include"
    #ENV['OPENSSL_LIB_DIR'] = "#{`brew --prefix openssl`}/lib"
    system "make"    
    bin.install "target/release/wsf"
    man1.install "wsf.1"
  end
end

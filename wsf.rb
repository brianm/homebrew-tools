require "formula"

class Wsf < Formula
  head "https://github.com/brianm/wsf.git"

  url "https://github.com/brianm/wsf/archive/wsf-0.1.2.tar.gz"
  version "0.1.2"
  homepage "https://github.com/brianm/wsf"
  sha256 "27b487e0ff1af2cae3cacf30c56da0fa904f81e2f02a1ef3e017d88baa6dc9fa"

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

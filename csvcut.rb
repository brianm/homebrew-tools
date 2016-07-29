require "formula"
require "language/go"

$version = "0.1.1"

class Csvcut < Formula
  url"https://github.com/brianm/csvcut/archive/csvcut-#{$version}.tar.gz"
  version $version
  homepage "https://github.com/brianm/csvcut"
  sha256 "35df572e6d8d70d50ceddf7a2d18d0ea021c9bb9522699edd4c0742672d35048"

  depends_on "go" => :build
  
  def install
    ENV["GOPATH"] = buildpath

    my_path = buildpath/"src/github.com/brianm/csvcut"
    my_path.install Dir["*"] 

    cd my_path do
      system "go", "build"
    end

    bin.install my_path/"csvcut"
  end
end

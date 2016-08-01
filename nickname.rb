require "formula"
require "language/go"

class Nickname < Formula
    url "https://github.com/brianm/nickname.git",
      :using => :git,
      :tag => "0.3.0"
  version "0.3.0"
  homepage "https://github.com/nickname/mdnsp"
  sha256 ""

  depends_on "go" => :build
  depends_on "godep" => :build

  def install
    ENV["GOPATH"] = buildpath

    my_path = buildpath/"src/github.com/brianm/nickname"
    my_path.install Dir["*"]

    cd my_path do
      system "godep", "go", "build"
    end

    bin.install my_path/"nickname"
  end
end

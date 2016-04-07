require "formula"
require "language/go"

class Mdnsp < Formula
    url "https://github.com/brianm/mdnsp.git",
      :using => :git,
      :tag => "0.2.0"
  version "0.2.0"
  homepage "https://github.com/brianm/mdnsp"
  sha1 ""

  depends_on "go" => :build
  depends_on "godep" => :build

  def install
    ENV["GOPATH"] = buildpath

    my_path = buildpath/"src/github.com/brianm/mdnsp"
    my_path.install Dir["*"]

    Language::Go.stage_deps resources, buildpath/"src"

    cd my_path do
      system "godep", "go", "build"
    end

    bin.install my_path/"mdnsp"
  end
end

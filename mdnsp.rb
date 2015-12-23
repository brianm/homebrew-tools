require "formula"
require "language/go"

class Mdnsp < Formula
    url "https://github.com/brianm/mdnsp.git",
      :using => :git,
      :tag => "0.1.0"
  version "0.1.0"
  homepage "https://github.com/brianm/mdnsp"
  sha1 ""

  depends_on "go" => :build

  go_resource "github.com/brianm/mdns" do
    url "https://github.com/brianm/mdns.git", :revision => "0.1.0"
  end

  go_resource "github.com/miekg/dns" do
    url "https://github.com/miekg/dns.git", :revision => "c2d8398a252a98a7ba29676e6946faf33c5e2fe1"
  end

  def install
    ENV["GOPATH"] = buildpath

    my_path = buildpath/"src/github.com/brianm/mdnsp"
    my_path.install Dir["*"]

    Language::Go.stage_deps resources, buildpath/"src"

    cd my_path do
      system "go", "build", "-o", "mdnsp", "./main.go"
    end

    bin.install my_path/"mdnsp"
  end
end

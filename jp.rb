require "formula"

$jp_version = "0.1.0"

class Jp < Formula
  head "https://github.com/brianm/jp.git"

  url "https://github.com/brianm/jp/archive/jp-#{$jp_version}.tar.gz"
  version $wsf_version
  homepage "https://github.com/brianm/jp"
  sha256 "d2353a527a32051b6ddd5573daa493d5fe42965a058a818046ad6f32617d6c14"

  depends_on "rust" => :build
  def install
    system "cargo build --release"
    bin.install "target/release/jp"
  end
end

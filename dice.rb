class Dice < Formula
  desc "CLI dice roller"
  homepage "https://github.com/brianm/dice"
  url "https://github.com/brianm/dice/archive/refs/tags/dice-0.4.0.tar.gz"
  sha256 "ce7d009cd590eb1f7ed184b81abf3a7ca0d89bff283c30af3d9e4dd198a685fc"
  license "Apache-2.0"
  head "https://github.com/brianm/dice.git"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"dice", "--version"
  end
end

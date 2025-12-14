class Bt < Formula
  desc "Small task tracker for small projects"
  homepage "https://github.com/brianm/bt"
  url "https://github.com/brianm/bt/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "0f6c52f0605ea5b0fb9deaf15aae835f8db2db593f9411bd5b29d895278a0c20"
  license "Apache-2.0"
  head "https://github.com/brianm/bt.git"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"bt", "--version"
  end
end

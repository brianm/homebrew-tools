class Bt < Formula
  desc "Small task tracker for small projects"
  homepage "https://github.com/brianm/bt"
  url "https://github.com/brianm/bt/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "df2eac02485c88fdace629fd7d581372f75938e966424d4eb6e3e9608795aaa8"
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

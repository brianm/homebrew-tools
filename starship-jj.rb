class StarshipJj < Formula
  desc "Starship plugin for jj (Jujutsu version control)"
  homepage "https://gitlab.com/lanastara_foss/starship-jj"
  url "https://gitlab.com/lanastara_foss/starship-jj/-/archive/0.7.0/starship-jj-0.7.0.tar.gz"
  sha256 "e1282d515b7aa54da903435096047f15d5abf53a2b5630d8c7f3c2954c52a782"
  license "MIT"
  head "https://gitlab.com/lanastara_foss/starship-jj.git"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"starship-jj", "--version"
  end
end

class Keep2reminders < Formula
  include Language::Python::Virtualenv

  desc "Bidirectional sync between Google Keep checklists and Apple Reminders"
  homepage "https://github.com/brianm/keep2reminders"
  url "https://github.com/brianm/keep2reminders/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "35d3d262c59e01f14669fb1a1ab1e86913d94cec68166c77df3dda901d7c4f87"
  license "Apache-2.0"
  head "https://github.com/brianm/keep2reminders.git", branch: "main"

  depends_on "python@3.11"
  depends_on :macos

  # Run `brew update-python-resources keep2reminders` to regenerate these.
  resource "certifi" do
    url "https://files.pythonhosted.org/packages/af/2d/7bf41579a8986e348fa033a31cdd0e4121114f6bce2457e8876010b092dd/certifi-2026.2.25.tar.gz"
    sha256 "e887ab5cee78ea814d3472169153c2d12cd43b14bd03329a39a9c6e2e80bfba7"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/13/69/33ddede1939fdd074bce5434295f38fae7136463422fe4fd3e0e89b98062/charset_normalizer-3.4.4.tar.gz"
    sha256 "94537985111c35f28720e43603b8e7b43a6ecfb2ce1d3058bbe955b73404e21a"
  end

  resource "future" do
    url "https://files.pythonhosted.org/packages/a7/b2/4140c69c6a66432916b26158687e821ba631a4c9273c474343badf84d3ba/future-1.0.0.tar.gz"
    sha256 "bd2968309307861edae1458a4f8a4f3598c03be43b97521076aebf5d94c07b05"
  end

  resource "gkeepapi" do
    url "https://files.pythonhosted.org/packages/88/61/f33bb386feb726ed98560ca8b69b589a95095b4090ba32dab43e62c385e9/gkeepapi-0.17.1-py3-none-any.whl"
    sha256 "8e242bc745640c809d21eb3f95c7182ac340a8cc2b84e5d78b9d692c2c2d35dc"
  end

  resource "gpsoauth" do
    url "https://files.pythonhosted.org/packages/1a/6a/f4fd84bcfd513d512711a2a14039ac431201c440c29a8f76af5584a34614/gpsoauth-2.0.0.tar.gz"
    sha256 "9e3b765a6a4e0364dec1bc4157bd3ed7e5ec3066589e285d0b46986910aa6bd2"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/6f/6d/0703ccc57f3a7233505399edb88de3cbd678da106337b9fcde432b65ed60/idna-3.11.tar.gz"
    sha256 "795dafcc9c04ed0c1fb032c2aa73654d8e8c5023a7df64a53f39190ada629902"
  end

  resource "pycryptodome" do
    url "https://files.pythonhosted.org/packages/8e/a6/8452177684d5e906854776276ddd34eca30d1b1e15aa1ee9cefc289a33f5/pycryptodome-3.23.0.tar.gz"
    sha256 "447700a657182d60338bab09fdb27518f8856aecd80ae4c6bdddb67ff5da44ef"
  end

  resource "pycryptodomex" do
    url "https://files.pythonhosted.org/packages/c9/85/e24bf90972a30b0fcd16c73009add1d7d7cd9140c2498a68252028899e41/pycryptodomex-3.23.0.tar.gz"
    sha256 "71909758f010c82bc99b0abf4ea12012c98962fbf0583c2164f8b84533c2e4da"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/c9/74/b3ff8e6c8446842c3f5c837e9c3dfcfe2018ea6ecef224c710c85ef728f4/requests-2.32.5.tar.gz"
    sha256 "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/c7/24/5f1b3bdffd70275f6661c76461e25f024d5a38a46f04aaca912426a2b1d3/urllib3-2.6.3.tar.gz"
    sha256 "1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed"
  end

  def install
    virtualenv_install_with_resources
  end

  service do
    run [opt_bin/"keep2reminders"]
    keep_alive true
    log_path var/"log/keep2reminders.log"
    error_log_path var/"log/keep2reminders.log"
  end

  test do
    system bin/"keep2reminders", "--help"
  end
end

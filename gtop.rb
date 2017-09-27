require "formula"
require "language/node"

$_version = "0.1.5"

class Gtop < Formula  
  desc "Hancy top stuff"
  homepage "https://github.com/aksakalli/gtop"
  url "https://registry.npmjs.org/gtop/-/gtop-#{$_version}.tgz"
  sha256 "133dcb72876b20a964f4a757ee647868bff1c34327e06e01c6cb80c8c18ff65c"

  depends_on "node"
  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end

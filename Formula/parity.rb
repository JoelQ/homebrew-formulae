class Parity < Formula
  homepage ""
  url "https://github.com/JoelQ/parity/releases/download/v0.4.2/parity-0.4.2-osx.tar.gz"
  sha1 ""

  depends_on "heroku-toolbelt"

  def install
    prefix.install "lib" => "lib"
    bin.install "bin/development"
  end

  test do
    system "#{bin}/development", "--version"
  end
end

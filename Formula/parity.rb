class Parity < Formula
  homepage ""
  url "https://github.com/JoelQ/parity/releases/download/v0.4.3/parity-0.4.3-osx.tar.gz"
  sha1 ""

  depends_on "heroku-toolbelt"

  def install
    prefix.install "lib" => "lib"
    bin.install "bin/development", "bin/staging", "bin/production"
  end

  test do
    system "#{bin}/development", "--version"
    system "#{bin}/staging", "--version"
    system "#{bin}/production", "--version"
  end
end

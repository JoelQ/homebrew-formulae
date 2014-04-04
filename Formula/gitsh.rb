require 'formula'

class Gitsh < Formula
  SYSTEM_RUBY_PATH = '/usr/bin/ruby'
  HOMEBREW_RUBY_PATH = "#{HOMEBREW_PREFIX}/bin/ruby"

  homepage 'http://thoughtbot.github.io/gitsh/'
  url 'http://thoughtbot.github.io/gitsh/gitsh-0.6.tar.gz'
  sha1 'e440a68974cdcba68028ef7db5d55d0c2d7a7d79'

  def self.old_system_ruby?
    system_ruby_version = `#{SYSTEM_RUBY_PATH} -e "puts RUBY_VERSION"`.chomp
    system_ruby_version < '1.9.3'
  end

  if old_system_ruby?
    depends_on 'Ruby'
  end

  def install
    set_ruby_path
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/gitsh", "--version"
  end

  private

  def set_ruby_path
    if self.class.old_system_ruby? || File.exist?(HOMEBREW_RUBY_PATH)
      ENV['RUBY'] = HOMEBREW_RUBY_PATH
    else
      ENV['RUBY'] = SYSTEM_RUBY_PATH
    end
  end
end

class Randpass < Formula
  desc "An adequate command-line random password generator for macOS"
  homepage "https://mraffonso.github.io/randpass/"
  url "https://github.com/mraffonso/randpass/releases/download/v0.1.5/randpass-0.1.5-darwin-amd64.tar.xz"
  sha256 "507e2eb446fa98578b188d2c4158870afa9ffe5c846d1a54da843742ae0cc41a"
  version '0.1.5'

  depends_on "jq"
  depends_on "libevent"

  def install
    bin.install "randpass"
  end

  test do
    require "open3"
    randpass_bin = "#{bin}/randpass"
    ::Open3.popen3("#{randpass_bin} -h") do |_, stdout, _|
      assert_equal "Randpass 0.1.5", stdout.readlines.first.strip
    end
  end
end

class Randpass < Formula
  desc "An adequate command-line random password generator for macOS"
  homepage "https://mraffonso.github.io/randpass/"
  url "https://github.com/mraffonso/randpass/releases/download/v0.1.4/randpass-0.1.4-darwin-amd64.tar.xz"
  sha256 "050bb4d8c5613deb05b10f5d649a1246b09d4353355dd69a37923775fad254ba"
  version '0.1.4'

  depends_on "libevent"

  def install
    bin.install "randpass"
  end

  test do
    require "open3"
    randpass_bin = "#{bin}/randpass"
    ::Open3.popen3("#{randpass_bin} -h") do |_, stdout, _|
      assert_equal "Randpass 0.1.4", stdout.readlines.first.strip
    end
  end
end

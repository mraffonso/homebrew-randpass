class Randpass < Formula
  desc "An adequate command-line random password generator for macOS"
  homepage "https://mraffonso.github.io/randpass/"
  url "https://github.com/mraffonso/randpass/releases/download/v0.1.3/randpass-0.1.3-darwin-amd64.tar.xz"
  sha256 "558a780ad182a79b92ca124c61331ef93b9a56f9733e48c31202d005870c271f"
  version '0.1.3'

  depends_on "libevent"

  def install
    bin.install "randpass"
  end

  test do
    require "open3"
    randpass_bin = "#{bin}/randpass"
    ::Open3.popen3("#{randpass_bin} -h") do |_, stdout, _|
      assert_equal "Randpass 0.1.3", stdout.readlines.first.strip
    end
  end
end

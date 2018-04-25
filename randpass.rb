class Randpass < Formula
  desc "Adequate command line random password generator for macOS"
  homepage "https://github.com/mraffonso/randpass"
  url "https://github.com/mraffonso/randpass/releases/download/v0.1.2/randpass-0.1.2-darwin-amd64.tar.xz"
  sha256 "cb9a24a3d4c7f38b9b2ca8c0e01b31296769df35322e7710972bf0abdfa63b46"
  version '0.1.2'

  depends_on "libevent"

  def install
    bin.install "randpass"
  end

  test do
    require "open3"
    randpass_bin = "#{bin}/randpass"
    ::Open3.popen3("#{puma_dev_bin} -h") do |_, stdout, _|
      assert_equal "Randpass 0.1.0", stdout.readlines.first.strip
    end
  end
end

class Randpass < Formula
  desc "Adequate command line random password generator for macOS"
  homepage "https://github.com/mraffonso/randpass"
  url "https://github.com/mraffonso/randpass/releases/download/v0.1.0/randpass-0.1.0-darwin-amd64.tar.xz"
  sha256 "4f1400bfe954492ce117fefd7763a4f2f05367f7b4e4578a695c38c9d409c734"
  version '0.1.0'

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

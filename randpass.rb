class Randpass < Formula
  desc "Adequate command line random password generator for macOS"
  homepage "https://github.com/mraffonso/randpass"
  url "https://github.com/mraffonso/randpass/releases/download/v0.1.1/randpass-0.1.1-darwin-amd64.tar.xz"
  sha256 "de0675e01cb6fdc398afa6f74c76acc9378bb8fdcc871815f49f489029d5ba0d"
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

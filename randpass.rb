class Randpass < Formula
  desc "Adequate command line random password generator for macOS"
  homepage "https://github.com/mraffonso/randpass"
  url "https://github.com/mraffonso/randpass/releases/download/v0.1.0/randpass-0.1.0-darwin-amd64.zip"
  sha256 "52e840b3335838cc37c4c893cc90fae1d0a189bd1d5abe6465681a03a5d63291"
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

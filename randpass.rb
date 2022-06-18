class Randpass < Formula
  desc "An adequate command-line random password generator"
  homepage "https://github.com/mraffonso/randpass"
  url "https://github.com/mraffonso/randpass/releases/download/v0.1.6/randpass-0.1.6-darwin-amd64.tar.xz"
  sha256 "5ffb58ad7a781001a04209e46f16809f51b82e9602bf51d0c14e8d92c69b4f12"
  version '0.1.6'

  depends_on "jq"
  depends_on "libevent"

  def install
    bin.install "randpass"
  end

  test do
    require "open3"
    randpass_bin = "#{bin}/randpass"
    ::Open3.popen3("#{randpass_bin} -h") do |_, stdout, _|
      assert_equal "Randpass 0.1.6", stdout.readlines.first.strip
    end
  end
end
